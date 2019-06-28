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
-- Aurora 8b/10b Interface modified for DNCPIE. The QSFP+ quads are contiguous and
-- this implementation should use the CPLL, so just use the same reference clock for
-- all transceivers.
-- PSA modified to remove CRC.
-- Known Issues:
--*********************************************************************************
 library ieee;
     use ieee.std_logic_1164.all;
     use ieee.std_logic_misc.all;
     use ieee.numeric_std.all;
library work;
    use work.ttcs_intfc_pkg.all;
-- synthesis translate_off
library unisim;
    use unisim.vcomponents.all;
-- synthesis translate_on

entity dnpcie_aurora is
generic(
    NLANE                           : natural range 1 to 8          := 4;
    STBL_CLK_PER                    : integer                       := 20;  --Period of the stable clock driving this state-machine, unit is [ns]
    SIM_SPDUP                       : boolean                       := FALSE);
port(
    -- Clocks
    gt_refclk_p                     : in  std_logic;
    gt_refclk_n                     : in  std_logic;
    init_clk                        : in  std_logic;--free running clock for reset
    user_clk                        : in  std_logic_vector(0 to NLANE-1);--Aurora logic clock
    -- Resets
    ext_reset                       : in std_logic;
    -- AXI TX Interface
    s_axi_tx_tdata                  : in  ttcs_32bbe_type(0 to NLANE-1);
    s_axi_tx_tkeep                  : in  ttcs_4bbe_type(0 to NLANE-1);
    s_axi_tx_tvalid                 : in  std_logic_vector(0 to NLANE-1);
    s_axi_tx_tready                 : out std_logic_vector(0 to NLANE-1);
    s_axi_tx_tlast                  : in  std_logic_vector(0 to NLANE-1);
    s_axi_tx_tuser                  : in  std_logic_vector(0 to NLANE-1);
    -- AXI RX Interface
    m_axi_rx_tdata                  : out ttcs_32bbe_type(0 to NLANE-1);
    m_axi_rx_tkeep                  : out ttcs_4bbe_type(0 to NLANE-1);
    m_axi_rx_tvalid                 : out std_logic_vector(0 to NLANE-1);
    m_axi_rx_tlast                  : out std_logic_vector(0 to NLANE-1);
    m_axi_rx_tuser                  : out std_logic_vector(0 to NLANE-1);
    -- Native Flow Control TX Interface
    s_axi_tx_nfc_xoff               : in std_logic_vector(0 to NLANE-1); --transmit XOFF to source channel
    --CRC  status signals
   -- no CRC here
   -- crc_pass_fail_n                 : out std_logic_vector(0 to NLANE-1);
   -- crc_valid                       : out std_logic_vector(0 to NLANE-1);
    -- Error Detection Interface
    frame_err                       : out std_logic_vector(0 to NLANE-1);
    hard_err                        : out std_logic_vector(0 to NLANE-1);
    soft_err                        : out std_logic_vector(0 to NLANE-1);
    channel_up                      : out std_logic_vector(0 to NLANE-1);
    lane_up                         : out std_logic_vector(0 to NLANE-1);
    -- System Interface
    tx_out_clk                      : out std_logic_vector(0 to NLANE-1);
    pll_not_locked                  : in  std_logic;
    power_down                      : in  std_logic_vector(0 to NLANE-1);
    loopback                        : in  ttcs_3ble_type(0 to NLANE-1);
    tx_lock                         : out std_logic_vector(0 to NLANE-1);
    tx_resetdone                    : out std_logic_vector(0 to NLANE-1);
    rx_resetdone                    : out std_logic_vector(0 to NLANE-1);
    qpll_status                     : out std_logic_vector(4 downto 0);
    --DRP Ports
    drpclk                          : in  std_logic;
    drpaddr                         : in  std_logic_vector(8 downto 0);
    drpdi                           : in  std_logic_vector(15 downto 0);
    drpdo                           : out ttcs_16ble_type(0 to NLANE-1);
    drpen                           : in  std_logic;
    drprdy                          : out std_logic_vector(0 to NLANE-1);
    drpwe                           : in  std_logic;
    -- GT Serial I/O
    rxp                             : in  std_logic_vector(0 to NLANE-1);
    rxn                             : in  std_logic_vector(0 to NLANE-1);
    txp                             : out std_logic_vector(0 to NLANE-1);
    txn                             : out std_logic_vector(0 to NLANE-1));
end dnpcie_aurora;


architecture behave of dnpcie_aurora is

    component IBUFDS_GTE3
    generic(
        REFCLK_HROW_CK_SEL          : std_logic_vector(1 downto 0));
    port (
        O                           : out std_logic;
        ODIV2                       : out std_logic;
        CEB                         : in std_logic;
        I                           : in std_logic;
        IB                          : in std_logic);
    end component;

    component BUFG_GT
    port(
        O                           : out std_logic;
        CE                          : in std_logic;
        CEMASK                      : in std_logic;
        CLR                         : in std_logic;
        CLRMASK                     : in std_logic;
        DIV                         : in std_logic_vector(2 downto 0);
        I                           : in std_logic);
    end component;

    component aurora_8b10b_core
    generic(
        CC_FREQ_FACTOR              : integer;   --  := 5'd12,
        EXAMPLE_SIMULATION          : integer); --0      
    port(
        --AXI TX Interface
        s_axi_tx_tdata              : in  std_logic_vector(0 to 31);
        s_axi_tx_tkeep              : in  std_logic_vector(0 to 3);
        s_axi_tx_tvalid             : in  std_logic;
        s_axi_tx_tlast              : in  std_logic;
        s_axi_tx_tready             : out std_logic;
        --AXI RX Interface
        m_axi_rx_tdata              : out std_logic_vector(0 to 31);
        m_axi_rx_tkeep              : out std_logic_vector(0 to 3);
        m_axi_rx_tvalid             : out std_logic;
        m_axi_rx_tlast              : out std_logic;
        --Native Flow Control TX Interface
        s_axi_nfc_req               : in  std_logic;
        s_axi_nfc_nb                : in  std_logic_vector(0 to 3);
        s_axi_nfc_ack               : out std_logic;
        --Native Flow Control RX Interface
        m_axi_rx_snf                : out std_logic;
        m_axi_rx_fc_nb              : out std_logic_vector(0 to 3);
        --GT Serial I/O
        rxp                         : in  std_logic;
        rxn                         : in  std_logic;
        txp                         : out std_logic;
        txn                         : out std_logic;
        --GT Reference Clock Interface
        gt_refclk1                  : in  std_logic;
        --Error Detection Interface
        hard_err                    : out std_logic;
        soft_err                    : out std_logic;
        frame_err                   : out std_logic;
        --CRC Status
        -- no CRC here
        -- crc_pass_fail_n             : out std_logic;
        -- crc_valid                   : out std_logic;       
        --Status
        channel_up                  : out std_logic;
        lane_up                     : out std_logic;
        --System Interface
        user_clk                    : in  std_logic;
        sync_clk                    : in  std_logic;
        reset                       : in  std_logic;
        power_down                  : in  std_logic;
        loopback                    : in  std_logic_vector(2 downto 0);
        gt_reset                    : in  std_logic;
        init_clk_in                 : in  std_logic;
        pll_not_locked              : in  std_logic;
        tx_resetdone_out            : out std_logic;
        rx_resetdone_out            : out std_logic;
        link_reset_out              : out std_logic;
        gt0_drpaddr_in              : in  std_logic_vector(8 downto 0);
        gt0_drpdi_in                : in  std_logic_vector(15 downto 0);
        gt0_drpdo_out               : out std_logic_vector(15 downto 0);
        gt0_drpen_in                : in  std_logic;
        gt0_drprdy_out              : out std_logic;
        gt0_drpwe_in                : in  std_logic;
        tx_out_clk                  : out std_logic;
        ------------------
        gt_powergood                : out  std_logic;
        bufg_gt_clr_out             : out  std_logic;
        sys_reset_out               : out  std_logic;
        tx_lock                     : out  std_logic);
    end component;

    constant XOFF_VAL               : std_logic_vector(3 downto 0)          := X"F";
    constant XON_VAL                : std_logic_vector(3 downto 0)          := X"0";
    constant CQD                    : time                                  := 1 ns; -- clock to Q delay for Aurora simulation

    signal common_reset_vec         : std_logic_vector(0 to NLANE-1);
    signal gt_powergood             : std_logic_vector(0 to NLANE-1);
    signal bufg_gt_clr              : std_logic_vector(0 to NLANE-1);

    -- COMMON PORTS
    signal gt_refclk_b              : std_logic;
    signal tx_out_clk_b             : std_logic_vector(0 to NLANE-1);
    --signal sync_clk                 : std_logic_vector(0 to NLANE-1);

    signal fr_gt_reset              : std_logic_vector(0 to NLANE-1);--free running clock logic reset
    signal ur_ch_reset              : std_logic_vector(0 to NLANE-1);--free running clock gt reset

    signal rx_new_pkt_d             : std_logic_vector(0 to NLANE-1);
    signal rx_new_pkt_q             : std_logic_vector(0 to NLANE-1);

    signal s_axi_nfc_req            : std_logic_vector(0 to NLANE-1);
    signal s_axi_nfc_nb             : ttcs_4bbe_type(0 to NLANE-1);
    signal s_axi_nfc_ack            : std_logic_vector(0 to NLANE-1);
    signal m_axi_rx_snf             : std_logic_vector(0 to NLANE-1);
    signal m_axi_rx_fc_nb           : ttcs_4bbe_type(0 to NLANE-1);
    signal nfc_xoff_q0              : std_logic_vector(0 to NLANE-1);
    signal nfc_xoff_q1              : std_logic_vector(0 to NLANE-1);
    signal nfc_xoff_re              : std_logic_vector(0 to NLANE-1);
    signal nfc_xoff_fe              : std_logic_vector(0 to NLANE-1);
    signal nfc_xoff_strt            : std_logic_vector(0 to NLANE-1);
    signal nfc_xoff_stop            : std_logic_vector(0 to NLANE-1);

    --signal common_reset_bit         : std_logic;
    --signal gt_refclk1_odiv          : std_logic;

begin

 --*********************************Main Body of Code**********************************

    -------------------------------------------------------
    -- pFPGA-zFPGA GT interface reference clock dedicated routing
    -------------------------------------------------------
    ibufds_gte_ins : IBUFDS_GTE3
    generic map(
        REFCLK_HROW_CK_SEL                          => "01")
    port map(
        O                                           => gt_refclk_b,
        ODIV2                                       => open,
        CEB                                         => '0',
        I                                           => gt_refclk_p,
        IB                                          => gt_refclk_n
    );

    lane_gen : for I in 0 to NLANE-1 generate

        ---------------------------------------------------
        -- Generate a BUFGs.
        ---------------------------------------------------
        BUFG_GT_inst : BUFG_GT
        port map (
            O                                       => tx_out_clk(I), -- 1-bit output: Buffer
            CE                                      => '1', -- 1-bit input: Buffer enable
            CEMASK                                  => '0', -- 1-bit input: CE Mask
            CLR                                     => '0', -- 1-bit input: Asynchronous clear
            CLRMASK                                 => '0', -- 1-bit input: CLR Mask
            DIV                                     => "000", -- 3-bit input: Dymanic divide Value
            I                                       => tx_out_clk_b(I) -- 1-bit input: Buffer
        );

        reset_ins : entity work.dnpcie_aurora_reset
        port map(
            init_clk                    => init_clk,
            user_clk                    => user_clk(I),
            ext_reset                   => ext_reset, --reset on free-running clock
            gt_reset                    => fr_gt_reset(I),--GT reset on free-running clock
            chan_reset                  => ur_ch_reset(I)--Aurora/logic reset released on user_clk               
        );
        
        ---------------------------------------------------
        -- Aurora Lane (Transceiver)
        ---------------------------------------------------
        aurora_8b10b_ins : aurora_8b10b_core
        generic map(
            CC_FREQ_FACTOR              => 5,   --  := 5'd12,
            EXAMPLE_SIMULATION          => 0)      
        port map(
            --AXI TX Interface
            s_axi_tx_tdata              => s_axi_tx_tdata(I),              
            s_axi_tx_tkeep              => s_axi_tx_tkeep(I),    
            s_axi_tx_tvalid             => s_axi_tx_tvalid(I),     
            s_axi_tx_tlast              => s_axi_tx_tlast(I),    
            s_axi_tx_tready             => s_axi_tx_tready(I),     
            --AXI RX Interface
            m_axi_rx_tdata              => m_axi_rx_tdata(I),    
            m_axi_rx_tkeep              => m_axi_rx_tkeep(I),    
            m_axi_rx_tvalid             => m_axi_rx_tvalid(I),     
            m_axi_rx_tlast              => m_axi_rx_tlast(I),    
            --Native Flow Control TX Interface 
            s_axi_nfc_req               => s_axi_nfc_req(I),
            s_axi_nfc_nb                => s_axi_nfc_nb(I),
            s_axi_nfc_ack               => s_axi_nfc_ack(I),
            --Native Flow Control RX Interface 
            m_axi_rx_snf                => m_axi_rx_snf(I),
            m_axi_rx_fc_nb              => m_axi_rx_fc_nb(I),
            --GT Serial I/O
            rxp                         => rxp(I),
            rxn                         => rxn(I),
            txp                         => txp(I),
            txn                         => txn(I),
            --GT Reference Clock Interface
            gt_refclk1                  => gt_refclk_b,
            --Error Detection Interface
            hard_err                   => hard_err(I), 
            soft_err                   => soft_err(I),
            frame_err                  => frame_err(I),
            --CRC Status
            -- no CRC here
            -- crc_pass_fail_n            => crc_pass_fail_n(I),
            -- crc_valid                  => crc_valid(I),
            --Status                   
            channel_up                 => channel_up(I),
            lane_up                    => lane_up(I),
            --System Interface         
            user_clk                   => user_clk(I),
            sync_clk                   => user_clk(I),
            reset                      => ur_ch_reset(I),
            power_down                 => power_down(I),
            loopback                   => loopback(I),
            gt_reset                   => fr_gt_reset(I),
            init_clk_in                => init_clk,
            pll_not_locked             => pll_not_locked,
            tx_resetdone_out           => tx_resetdone(I),
            rx_resetdone_out           => rx_resetdone(I),
            link_reset_out             => open,
            gt0_drpaddr_in             => drpaddr,
            gt0_drpdi_in               => drpdi,
            gt0_drpdo_out              => drpdo(I),
            gt0_drpen_in               => drpen,
            gt0_drprdy_out             => drprdy(I),
            gt0_drpwe_in               => drpwe,
            tx_out_clk                 => tx_out_clk_b(I),
            ------------------         
            gt_powergood               => gt_powergood(I),
            bufg_gt_clr_out            => bufg_gt_clr(I),
            sys_reset_out              => open,
            tx_lock                    => tx_lock(I)
        );

        rx_new_pkt_d(I)   <= '0' when ((m_axi_rx_tvalid(I) and m_axi_rx_tlast(I)) = '1') else
                             '1' when ((m_axi_rx_tvalid(I) and (not m_axi_rx_tlast(I))) = '1') else
                             rx_new_pkt_q(I);

        m_axi_rx_tuser(I) <= (not rx_new_pkt_q(I)) when ((m_axi_rx_tvalid(I) and m_axi_rx_tlast(I)) = '1') else
                          (rx_new_pkt_d(I) and (not rx_new_pkt_q(I)));

        --------------------------------------------------
        -- Start of frame (tuser in AXI) registers.
        --------------------------------------------------
        sof_pcs :  process(user_clk(I))
        begin
            if (user_clk(I)'event and user_clk(I)='1') then
                if (ur_ch_reset(I) = '1') then
                    rx_new_pkt_q(I) <= '0' after CQD;
                else
                    rx_new_pkt_q(I) <= rx_new_pkt_d(I) and channel_up(I) after CQD;
                end if;
            end if;
        end process;

        --------------------------------------------------
        -- NFC XON/XOFF logic. Start by sending XOFF when
        -- FIFO is almost full. Conclude by sending XON
        -- when FIFO empties.
        --------------------------------------------------
        nfc_pcs : process(user_clk(I))
        begin
            if (user_clk(I)'event and user_clk(I)='1') then
                if (ur_ch_reset(I) = '1') then
                    nfc_xoff_q0(I) <= '0';
                    nfc_xoff_q1(I) <= '0';
                    nfc_xoff_re(I) <= '0';
                    nfc_xoff_fe(I) <= '0';
                    nfc_xoff_strt(I) <= '0';
                    nfc_xoff_stop(I) <= '0';
                    s_axi_nfc_req(I) <= '0';
                    s_axi_nfc_nb(I)  <= XON_VAL;
                    --m_axi_rx_nfc_xoff(I) <= '0';
                else
                    nfc_xoff_q0(I) <= s_axi_tx_nfc_xoff(I);
                    nfc_xoff_q1(I) <= nfc_xoff_q0(I);
                    nfc_xoff_re(I) <= nfc_xoff_q0(I) and (not nfc_xoff_q1(I));--rising edge
                    nfc_xoff_fe(I) <= (not nfc_xoff_q0(I)) and nfc_xoff_q1(I);--falling edge
                    -- XOFF transmit logic ------------------
                    if (s_axi_nfc_ack(I) and nfc_xoff_strt(I)) = '1' then--clear values when ack occurs                    
                        nfc_xoff_strt(I) <= '0';
                    else            
                        if nfc_xoff_re(I) = '1' then-- rising edge starts XOFF cycle
                            nfc_xoff_strt(I) <= '1';
                        end if;
                    end if;
                    -- XOFF start logic
                    if (s_axi_nfc_ack(I) and (not nfc_xoff_strt(I)) and nfc_xoff_stop(I)) = '1' then--clear values when ack occurs
                        nfc_xoff_stop(I) <= '0';
                    else            
                        if nfc_xoff_fe(I) = '1' then-- falling edge concludes XOFF cycle
                            nfc_xoff_stop(I) <= '1';
                        end if;
                    end if;
                    -- XOFF end logic
                    if s_axi_nfc_ack(I) = '1' then--clear values when ack occurs                    
                        s_axi_nfc_req(I) <= '0' ;
                        s_axi_nfc_nb(I)  <= XON_VAL;--first ack XOFF, second XON
                    else            
                        -- need to request at start and stop
                        s_axi_nfc_req(I) <= nfc_xoff_strt(I) or nfc_xoff_stop(I);
                        if nfc_xoff_strt(I) = '1' then
                            s_axi_nfc_nb(I)  <= XOFF_VAL;--first value always XOFF
                        end if;
                    end if;
                    -- XOFF receive logic ---------------
                    --if m_axi_rx_snf(I) = '1' then
                    --    m_axi_rx_nfc_xoff(I) <= '1' when m_axi_rx_fc_nb(I) = XOFF_VAL else '0';
                    --end if;
                end if;
            end if;
        end process;

    end generate;

    --sync_clk  <= user_clk;

    --init_pipe_pcs : process(init_clk)
    --begin
    --    if init_clk'event and init_clk='1' then
    --    end if;
    --end process;

 end behave;
