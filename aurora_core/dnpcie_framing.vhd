--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: HELIX
--
-- Author:  Brandon Kunkler
--
-- Date:    11/09/2018
--
--*********************************************************************************
-- This notification is to inform you that the schematics/source-code provided by
-- Indiana University are controlled under the US Export Control Regulations.  The
-- schematics/source code are classified as ECCN 3E991.  Under these --controls this
-- information cannot be shared with individuals from or shipped to Cuba, Iran,
-- North Korea, Syria, or Sudan.  If there is a need to share this information with
-- any other individuals please contact export@iu.edu prior to sharing the information
-- so it can be determined if a US export control license is required.
--
--*********************************************************************************
-- Description:
-- Aurora 8b/10b frame generator and checker for HELIX DNPCIE.
--
-- Known Issues:
--*********************************************************************************
 library ieee;
     use ieee.std_logic_1164.all;
    use ieee.math_real.all;
library work;
    use work.ttcs_intfc_pkg.all;

entity dnpcie_framing is
generic(
    NLANE                                   : natural := 4;
    USE_HWA                                 : boolean := FALSE;
    FRM_TYP                                 : string  := "XLX");--IUB or XLX
port(
    user_clk                                : in  std_logic_vector(0 to NLANE-1);
    -- Resets
    tx_resetdone                            : in  std_logic_vector(0 to NLANE-1);
    rx_resetdone                            : in  std_logic_vector(0 to NLANE-1);
    --CRC  status signals
    crc_pass_fail_n                         : in  std_logic_vector(0 to NLANE-1);
    crc_valid                               : in  std_logic_vector(0 to NLANE-1);
    -- Error Detection Interface
    frame_err                               : in  std_logic_vector(0 to NLANE-1);
    hard_err                                : in  std_logic_vector(0 to NLANE-1);
    soft_err                                : in  std_logic_vector(0 to NLANE-1);
    channel_up                              : in  std_logic_vector(0 to NLANE-1);
    lane_up                                 : in  std_logic_vector(0 to NLANE-1);
    tx_lock                                 : in  std_logic_vector(0 to NLANE-1);
    -- AXI TX Interface
    s_axi_tx_tdata                          : out ttcs_32bbe_type(0 to NLANE-1);
    s_axi_tx_tkeep                          : out ttcs_4bbe_type(0 to NLANE-1);
    s_axi_tx_tvalid                         : out std_logic_vector(0 to NLANE-1);
    s_axi_tx_tready                         : in  std_logic_vector(0 to NLANE-1);
    s_axi_tx_tlast                          : out std_logic_vector(0 to NLANE-1);
    s_axi_tx_tuser                          : out std_logic_vector(0 to NLANE-1);
    -- AXI RX Interface
    m_axi_rx_tdata                          : in  ttcs_32bbe_type(0 to NLANE-1);
    m_axi_rx_tkeep                          : in  ttcs_4bbe_type(0 to NLANE-1);
    m_axi_rx_tvalid                         : in  std_logic_vector(0 to NLANE-1);
    m_axi_rx_tlast                          : in  std_logic_vector(0 to NLANE-1);
    m_axi_rx_tuser                          : in  std_logic_vector(0 to NLANE-1);
    -- Native Flow Control TX Interface
    s_axi_tx_nfc_xoff                       : out std_logic_vector(0 to NLANE-1)); --transmit XOFF to source channel
end dnpcie_framing;

architecture behave of dnpcie_framing is

    component aurora_8b10b_FRAME_GEN is
    port(
        -- User Interface
        TX_D                                : out std_logic_vector(0 to 31); 
        TX_REM                              : out std_logic_vector(0 to 1);     
        TX_SOF_N                            : out std_logic;
        TX_EOF_N                            : out std_logic;
        TX_SRC_RDY_N                        : out std_logic;
        TX_DST_RDY_N                        : in  std_logic;         
        -- NFC Interface
        NFC_REQ_N                           : out std_logic;
        NFC_NB                              : out std_logic_vector(0 to 3);     
        NFC_ACK_N                           : in  std_logic;  
        -- System Interface
        USER_CLK                            : in std_logic;   
        RESET                               : in std_logic;
        CHANNEL_UP                          : in std_logic);
    end component;

    component aurora_8b10b_LL_TO_AXI is
    generic(
        DATA_WIDTH                          : integer;      -- DATA bus width
        STRB_WIDTH                          : integer;      -- STROBE bus width
        USE_UFC_REM                         : integer;      -- UFC REM bus width identifier
        BC                                  : integer;      -- Byte count
        REM_WIDTH                           : integer);     -- REM bus width
    port(
        ----------------------  AXI4-S Interface -------------------------------
        AXI4_S_OP_TDATA                     : out std_logic_vector(0 to DATA_WIDTH-1);
        AXI4_S_OP_TKEEP                     : out std_logic_vector(0 to STRB_WIDTH-1);
        AXI4_S_OP_TVALID                    : out std_logic;
        AXI4_S_OP_TLAST                     : out std_logic;
        AXI4_S_IP_TREADY                    : in  std_logic;
        ----------------------  LocalLink Interface ----------------------------
        LL_IP_DATA                          : in  std_logic_vector(0 to DATA_WIDTH-1);
        LL_IP_REM                           : in  std_logic_vector(0 to REM_WIDTH-1);
        LL_IP_SRC_RDY_N                     : in  std_logic;
        LL_IP_SOF_N                         : in  std_logic;
        LL_IP_EOF_N                         : in  std_logic;
        LL_OP_DST_RDY_N                     : out std_logic);
    end component;

    component aurora_8b10b_AXI_TO_LL is
    generic(
        DATA_WIDTH                          : integer;      -- DATA bus width
        STRB_WIDTH                          : integer;      -- STROBE bus width
        BC                                  : integer;      -- Byte count
        USE_4_NFC                           : integer;      --  0 => PDU, 1 => NFC, 2 => UFC
        REM_WIDTH                           : integer);     -- REM bus width
    port(
        ----------------------  AXI4-S Interface -------------------------------     
        AXI4_S_IP_TX_TVALID                 : in  std_logic;
        AXI4_S_IP_TX_TREADY                 : out std_logic;
        AXI4_S_IP_TX_TDATA                  : in  std_logic_vector (0 to DATA_WIDTH-1);
        AXI4_S_IP_TX_TKEEP                  : in  std_logic_vector (0 to STRB_WIDTH-1);
        AXI4_S_IP_TX_TLAST                  : in  std_logic;        
        ----------------------  LocalLink Interface ----------------------------
        LL_OP_DATA                          : out std_logic_vector (0 to DATA_WIDTH-1);
        LL_OP_SOF_N                         : out std_logic;
        LL_OP_EOF_N                         : out std_logic;
        LL_OP_REM                           : out std_logic_vector(0 to REM_WIDTH-1);
        LL_OP_SRC_RDY_N                     : out std_logic;
        LL_IP_DST_RDY_N                     : in  std_logic;
        ----------------------  System Interface ----------------------------
        USER_CLK                            : in  std_logic;
        RESET                               : in  std_logic;
        CHANNEL_UP                          : in  std_logic);
    end component;

    component aurora_8b10b_FRAME_CHECK is
    port(
        -- User Interface
        RX_D                                : in std_logic_vector(0 to 31);
        RX_REM                              : in std_logic_vector(0 to 1);
        RX_SOF_N                            : in std_logic;
        RX_EOF_N                            : in std_logic;
        RX_SRC_RDY_N                        : in std_logic;
        -- NFC INterface    
        RX_SNF                              : in std_logic;
        RX_FC_NB                            : in std_logic_vector(0 to 3);
        -- System Interface 
        USER_CLK                            : in std_logic;
        RESET                               : in std_logic;
        CHANNEL_UP                          : in std_logic;
        ERR_COUNT                           : out std_logic_vector(7 downto 0));
    end component;

    component gt_framing_ila is
    port(
        clk                                 : in std_logic;
        probe0                              : in std_logic_vector(0  downto 0);
        probe1                              : in std_logic_vector(0  downto 0);
        probe2                              : in std_logic_vector(0  downto 0);
        probe3                              : in std_logic_vector(0  downto 0);
        probe4                              : in std_logic_vector(0  downto 0);
        probe5                              : in std_logic_vector(0  downto 0);
        probe6                              : in std_logic_vector(0  downto 0);
        probe7                              : in std_logic_vector(0  downto 0);
        probe8                              : in std_logic_vector(0  downto 0);
        probe9                              : in std_logic_vector(0  downto 0);
        probe10                             : in std_logic_vector(0  downto 0);
        probe11                             : in std_logic_vector(0  downto 0);
        probe12                             : in std_logic_vector(0  downto 0);
        probe13                             : in std_logic_vector(0  downto 0);
        probe14                             : in std_logic_vector(31 downto 0);
        probe15                             : in std_logic_vector(3  downto 0);
        probe16                             : in std_logic_vector(0  downto 0);
        probe17                             : in std_logic_vector(0  downto 0);
        probe18                             : in std_logic_vector(0  downto 0);
        probe19                             : in std_logic_vector(31 downto 0);
        probe20                             : in std_logic_vector(3  downto 0);
        probe21                             : in std_logic_vector(0  downto 0);
        probe22                             : in std_logic_vector(7  downto 0));
    end component;

    component helix_framing_vio
    port(
        clk                                 : in std_logic;
        probe_out0                          : out std_logic_vector(NLANE-1 downto 0));
    end component;

    constant DWDT                           : positive                      := 32;--must be 32 for Dini PCIe board
    constant MWDT                           : positive                      := 16;--merger data width
    constant KWDT                           : positive                      := DWDT/8;
    constant RWDT                           : positive                      := INTEGER(CEIL(LOG2(REAL(KWDT))));

    signal s_axi_nfc_req_n                  : std_logic_vector(0 to NLANE-1);
    signal s_axi_nfc_ack_n                  : std_logic_vector(0 to NLANE-1);

    signal tx_resetdone_nq0                 : std_logic_vector(0 to NLANE-1);
    signal rx_resetdone_nq0                 : std_logic_vector(0 to NLANE-1);
    signal crc_pass_fail_n_q0               : std_logic_vector(0 to NLANE-1);
    signal crc_valid_q0                     : std_logic_vector(0 to NLANE-1);
    signal frame_err_q0                     : std_logic_vector(0 to NLANE-1);
    signal hard_err_q0                      : std_logic_vector(0 to NLANE-1);
    signal soft_err_q0                      : std_logic_vector(0 to NLANE-1);
    signal channel_up_q0                    : std_logic_vector(0 to NLANE-1);
    signal lane_up_q0                       : std_logic_vector(0 to NLANE-1);
    signal tx_lock_q0                       : std_logic_vector(0 to NLANE-1);
    signal s_axi_tx_tdata_q0                : ttcs_32bbe_type(0 to NLANE-1);
    signal s_axi_tx_tkeep_q0                : ttcs_4bbe_type(0 to NLANE-1);
    signal s_axi_tx_tvalid_q0               : std_logic_vector(0 to NLANE-1);
    signal s_axi_tx_tready_q0               : std_logic_vector(0 to NLANE-1);
    signal s_axi_tx_tlast_q0                : std_logic_vector(0 to NLANE-1);
    signal s_axi_tx_tuser_q0                : std_logic_vector(0 to NLANE-1);
    signal m_axi_rx_tdata_q0                : ttcs_32bbe_type(0 to NLANE-1);
    signal m_axi_rx_tkeep_q0                : ttcs_4bbe_type(0 to NLANE-1);
    signal m_axi_rx_tvalid_q0               : std_logic_vector(0 to NLANE-1);
    signal m_axi_rx_tlast_q0                : std_logic_vector(0 to NLANE-1);
    signal m_axi_rx_tuser_q0                : std_logic_vector(0 to NLANE-1);
    signal s_axi_tx_nfc_xoff_q0             : std_logic_vector(0 to NLANE-1);       

    signal frm_chk_err                      : ttcs_8ble_type(0 to NLANE-1);
    signal frm_chk_err_q0                   : ttcs_8ble_type(0 to NLANE-1);

    signal inject_err                       : std_logic_vector(0 to NLANE-1);
    signal err_shift                        : ttcs_4bbe_type(0 to NLANE-1);
    signal err_re                           : std_logic_vector(0 to NLANE-1);
    signal err_vec                          : std_logic_vector(0 to NLANE-1);
    signal err_ack                          : std_logic_vector(0 to NLANE-1);    
    signal s_axi_tx_tdata_err               : ttcs_32bbe_type(0 to NLANE-1);

    --Of course Vivado renames these signals even though they are always connected
    attribute DONT_TOUCH : string;
    attribute DONT_TOUCH of tx_resetdone_nq0    : signal is "TRUE";
    attribute DONT_TOUCH of rx_resetdone_nq0    : signal is "TRUE";
    attribute DONT_TOUCH of crc_pass_fail_n_q0  : signal is "TRUE";
    attribute DONT_TOUCH of crc_valid_q0        : signal is "TRUE";
    attribute DONT_TOUCH of frame_err_q0        : signal is "TRUE";
    attribute DONT_TOUCH of hard_err_q0         : signal is "TRUE";
    attribute DONT_TOUCH of soft_err_q0         : signal is "TRUE";
    attribute DONT_TOUCH of channel_up_q0       : signal is "TRUE";
    attribute DONT_TOUCH of lane_up_q0          : signal is "TRUE";
    attribute DONT_TOUCH of tx_lock_q0          : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tdata_q0   : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tkeep_q0   : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tvalid_q0  : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tready_q0  : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tlast_q0   : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_tuser_q0   : signal is "TRUE";
    attribute DONT_TOUCH of m_axi_rx_tdata_q0   : signal is "TRUE";
    attribute DONT_TOUCH of m_axi_rx_tkeep_q0   : signal is "TRUE";
    attribute DONT_TOUCH of m_axi_rx_tvalid_q0  : signal is "TRUE";
    attribute DONT_TOUCH of m_axi_rx_tlast_q0   : signal is "TRUE";
    attribute DONT_TOUCH of m_axi_rx_tuser_q0   : signal is "TRUE";
    attribute DONT_TOUCH of s_axi_tx_nfc_xoff_q0: signal is "TRUE";
    attribute DONT_TOUCH of frm_chk_err_q0      : signal is "TRUE";

begin

    frame_gen : for I in 0 to NLANE-1 generate

        frm_gen_ins : entity work.helix_frmgen
        generic map(
            TXDWDT                          => DWDT,
            RXDWDT                          => MWDT,
            KWDT                            => KWDT,
            NFRM                            => 16)
        port map(
            -- system interface
            user_clk                        => user_clk(I),
            reset                           => tx_resetdone_nq0(I),--user clock domain!
            channel_up                      => channel_up(I),
            -- user interface
            tready                          => s_axi_tx_tready(I),
            tuser                           => s_axi_tx_tuser(I),
            tlast                           => s_axi_tx_tlast(I),
            tvalid                          => s_axi_tx_tvalid(I),
            tdata                           => s_axi_tx_tdata_err(I),
            tkeep                           => s_axi_tx_tkeep(I),
            -- nfc interface
            tx_nfc_xoff                     => s_axi_tx_nfc_xoff(I)
        );

        frm_chk_ins : entity work.helix_frmchk
        generic map(
            DWDT                            => DWDT,
            KWDT                            => KWDT,
            NFRM                            => 16)
        port map(
            -- system interface
            user_clk                        => user_clk(I),
            reset                           => rx_resetdone_nq0(I),
            channel_up                      => channel_up(I),
            -- user interface
            tuser                           => m_axi_rx_tuser(I),
            tlast                           => m_axi_rx_tlast(I),
            tvalid                          => m_axi_rx_tvalid(I),
            tdata                           => m_axi_rx_tdata(I),
            tkeep                           => m_axi_rx_tkeep(I),
            err_count                       => frm_chk_err(I)
        );

        ila_gen : if USE_HWA generate
            framing_ila_ins : gt_framing_ila
            port map(
                clk                         => user_clk(I),
                probe0(0)                   => tx_resetdone_nq0(I),
                probe1(0)                   => rx_resetdone_nq0(I),
                probe2(0)                   => tx_lock_q0(I),
                probe3(0)                   => channel_up_q0(I),
                probe4(0)                   => lane_up_q0(I),
                probe5(0)                   => hard_err_q0(I),
                probe6(0)                   => soft_err_q0(I),
                probe7(0)                   => frame_err_q0(I),
                probe8(0)                   => crc_pass_fail_n_q0(I),
                probe9(0)                   => crc_valid_q0(I),
                probe10(0)                  => s_axi_tx_tready_q0(I),
                probe11(0)                  => s_axi_tx_tuser_q0(I),
                probe12(0)                  => s_axi_tx_tlast_q0(I),
                probe13(0)                  => s_axi_tx_tvalid_q0(I),
                probe14                     => s_axi_tx_tdata_q0(I),
                probe15                     => s_axi_tx_tkeep_q0(I),
                probe16(0)                  => m_axi_rx_tuser_q0(I),
                probe17(0)                  => m_axi_rx_tlast_q0(I),
                probe18(0)                  => m_axi_rx_tvalid_q0(I),
                probe19                     => m_axi_rx_tdata_q0(I),
                probe20                     => m_axi_rx_tkeep_q0(I),
                probe21(0)                  => s_axi_tx_nfc_xoff_q0(I),
                probe22                     => frm_chk_err_q0(I)
            );
        end generate;

        -------------------------------------------------------------
        -- Error injection logic.
        -------------------------------------------------------------
        error_pcs : process(user_clk(I))
        begin
            if user_clk(I)'event and user_clk(I)='1' then
                -- cross clock domains just in case
                err_shift(I)  <= inject_err(I) & err_shift(I)(err_shift(I)'left to err_shift(I)'right-1);
                -- detect rising edge of VIO outptut
                err_re(I)     <= err_shift(I)(err_shift(I)'right-1) and (not err_shift(I)(err_shift(I)'right));
                -- hold inject signal until data is sent
                err_ack(I) <= (not s_axi_tx_tuser(I)) and (not s_axi_tx_tlast(I)) and s_axi_tx_tvalid(I);
                if tx_resetdone_nq0(I) then
                    err_vec(I) <= '0';
                else
                    if err_re(I) then
                        err_vec(I) <= '1';
                    else
                        if err_ack(I) = '1' then
                            err_vec(I) <= '0';
                        end if;
                    end if;
                end if;            
            end if;
        end process;

        user_pipe_pcs : process(user_clk(I))
        begin
            if user_clk(I)'event and user_clk(I)='1' then
                tx_resetdone_nq0(I) <= not tx_resetdone(I);
                rx_resetdone_nq0(I) <= not rx_resetdone(I);
                crc_pass_fail_n_q0(I)  <= crc_pass_fail_n(I);
                crc_valid_q0(I)        <= crc_valid(I);
                frame_err_q0(I)        <= frame_err(I);
                hard_err_q0(I)         <= hard_err(I);
                soft_err_q0(I)         <= soft_err(I);
                channel_up_q0(I)       <= channel_up(I);
                lane_up_q0(I)          <= lane_up(I);
                tx_lock_q0(I)          <= tx_lock(I);
                s_axi_tx_tdata_q0(I)   <= s_axi_tx_tdata(I);
                s_axi_tx_tkeep_q0(I)   <= s_axi_tx_tkeep(I);
                s_axi_tx_tvalid_q0(I)  <= s_axi_tx_tvalid(I);
                s_axi_tx_tready_q0(I)  <= s_axi_tx_tready(I);
                s_axi_tx_tlast_q0(I)   <= s_axi_tx_tlast(I);
                s_axi_tx_tuser_q0(I)   <= s_axi_tx_tuser(I);
                m_axi_rx_tdata_q0(I)   <= m_axi_rx_tdata(I);
                m_axi_rx_tkeep_q0(I)   <= m_axi_rx_tkeep(I);
                m_axi_rx_tvalid_q0(I)  <= m_axi_rx_tvalid(I);
                m_axi_rx_tlast_q0(I)   <= m_axi_rx_tlast(I);
                m_axi_rx_tuser_q0(I)   <= m_axi_rx_tuser(I);
                s_axi_tx_nfc_xoff_q0(I)<= s_axi_tx_nfc_xoff(I);
                frm_chk_err_q0(I)      <= frm_chk_err(I);
            end if;
        end process; 

        --inject error;        
        s_axi_tx_tdata(I) <= s_axi_tx_tdata_err(I) when (not err_vec(I)) else (not s_axi_tx_tdata_err(I));

    end generate;

    vio_ins : helix_framing_vio
    port map(
        clk                             => user_clk(NLANE-1),
        probe_out0                      => inject_err
    );

end behave;