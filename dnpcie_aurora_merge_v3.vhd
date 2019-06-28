--
-- NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
--
-- This module doesn't need to be used in the final implementation: it's a partial
-- implementation testing that the basic aurora_core_wrap module works to encapsulate
-- the per-link logic.
--
-- That is, this is a test implementation of 8 aurora_core_wrap modules. The aurora_core_wrap
-- modules are NOT full implementations of the Aurora link for the DNPCIE. They
-- still have a 32-bit transmit path, and have no CRC for RX or TX. Those are added
-- in the dnpcie_aurora_core module.
--
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

entity dnpcie_aurora_merge_v2 is
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
end dnpcie_aurora_merge_v3;


architecture behave of dnpcie_aurora_merge_v3 is

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

    component aurora_core_wrap
    generic(
        CC_FREQ_FACTOR              : integer;   --  := 5'd12,
        EXAMPLE_SIMULATION          : integer); --0      
    port(
        --AXI TX Interface
        s_axis_tx_tdata              : in  std_logic_vector(0 to 31);
        s_axis_tx_tkeep              : in  std_logic_vector(0 to 3);
        s_axis_tx_tvalid             : in  std_logic;
        s_axis_tx_tlast              : in  std_logic;
        s_axis_tx_tready             : out std_logic;
        --AXI RX Interface
        m_axis_rx_tdata              : out std_logic_vector(0 to 31);
        m_axis_rx_tkeep              : out std_logic_vector(0 to 3);
        m_axis_rx_tvalid             : out std_logic;
        m_axis_rx_tuser              : out std_logic;
        m_axis_rx_tlast              : out std_logic;
        --Native Flow Control TX Interface
        s_axis_tx_nfc_xoff          : in std_logic;
        m_axis_rx_nfc_xoff          : out std_logic;
        --GT Serial I/O
        rxp                         : in  std_logic;
        rxn                         : in  std_logic;
        txp                         : out std_logic;
        txn                         : out std_logic;
        --GT Reference Clock Interface
        gt_refclk                   : in  std_logic;
        --Error Detection Interface
        hard_err                    : out std_logic;
        soft_err                    : out std_logic;
        frame_err                   : out std_logic;
        --Status
        channel_up                  : out std_logic;
        lane_up                     : out std_logic;
        --System Interface
        init_clk                    : in  std_logic;
        user_clk                    : in  std_logic;
        ext_reset                   : in  std_logic;

        tx_out_clk                  : out std_logic;
        pll_not_locked              : in  std_logic;
        power_down                  : in  std_logic;
        loopback                    : in  std_logic_vector(2 downto 0);

        tx_resetdone                : out std_logic;
        rx_resetdone                : out std_logic;
        drpaddr                     : in  std_logic_vector(8 downto 0);
        drpdi                       : in  std_logic_vector(15 downto 0);
        drpdo                       : out std_logic_vector(15 downto 0);
        drpen                       : in  std_logic;
        drprdy                      : out std_logic;
        drpwe                       : in  std_logic;
        ------------------
        gt_powergood                : out  std_logic;
        bufg_gt_clr                 : out  std_logic;
        tx_lock                     : out  std_logic);
    end component;

    constant CQD                    : time                                  := 1 ns; -- clock to Q delay for Aurora simulation

    signal common_reset_vec         : std_logic_vector(0 to NLANE-1);
    signal gt_powergood             : std_logic_vector(0 to NLANE-1);
    signal bufg_gt_clr              : std_logic_vector(0 to NLANE-1);

    -- COMMON PORTS
    signal gt_refclk_b              : std_logic;
    signal tx_out_clk_b             : std_logic_vector(0 to NLANE-1);

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
        -- Aurora Lane (Transceiver)
        ---------------------------------------------------
        aurora_core_wrap_ins : aurora_core_wrap
        generic map(
            CC_FREQ_FACTOR              => 5,   --  := 5'd12,
            EXAMPLE_SIMULATION          => 0)      
        port map(
            --AXI TX Interface
            s_axis_tx_tdata              => s_axi_tx_tdata(I),              
            s_axis_tx_tkeep              => s_axi_tx_tkeep(I),    
            s_axis_tx_tvalid             => s_axi_tx_tvalid(I),     
            s_axis_tx_tlast              => s_axi_tx_tlast(I),    
            s_axis_tx_tready             => s_axi_tx_tready(I),     
            --AXI RX Interface
            m_axis_rx_tdata              => m_axi_rx_tdata(I),    
            m_axis_rx_tkeep              => m_axi_rx_tkeep(I),    
            m_axis_rx_tvalid             => m_axi_rx_tvalid(I),
            m_axis_rx_tuser              => m_axi_rx_tuser(I),     
            m_axis_rx_tlast              => m_axi_rx_tlast(I),    
            --Native Flow Control TX Interface 
            s_axis_tx_nfc_xoff          => s_axi_tx_nfc_xoff(I),
            m_axis_rx_nfc_xoff          => open,
            --GT Serial I/O
            rxp                         => rxp(I),
            rxn                         => rxn(I),
            txp                         => txp(I),
            txn                         => txn(I),
            --Error Detection Interface
            hard_err                   => hard_err(I), 
            soft_err                   => soft_err(I),
            frame_err                  => frame_err(I),
            --Status                   
            channel_up                 => channel_up(I),
            lane_up                    => lane_up(I),
            --System Interface         
            user_clk                   => user_clk(I),
            init_clk                   => init_clk,
            gt_refclk                  => gt_refclk_b,
            ext_reset                  => ext_reset,
            
            tx_out_clk                 => tx_out_clk(I),
            pll_not_locked             => pll_not_locked,
            power_down                 => power_down(I),
            loopback                   => loopback(I),
            tx_resetdone               => tx_resetdone(I),
            rx_resetdone               => rx_resetdone(I),

            drpaddr                    => drpaddr,
            drpdi                      => drpdi,
            drpdo                      => drpdo(I),
            drpen                      => drpen,
            drprdy                     => drprdy(I),
            drpwe                      => drpwe,
            ------------------         
            gt_powergood               => gt_powergood(I),
            bufg_gt_clr                => bufg_gt_clr(I),
            tx_lock                    => tx_lock(I)
        );

    end generate;

 end behave;
