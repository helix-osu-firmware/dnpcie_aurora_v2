-- dnpcie_aurora_CRC16_v2 VHDL template
-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT dnpcie_aurora_2
  PORT (
    gt_refclk       : IN STD_LOGIC;
    init_clk        : IN STD_LOGIC;
    user_clk        : IN STD_LOGIC;
    ext_reset       : IN STD_LOGIC;
    
    s_axi_tx_tdata : IN STD_LOGIC_VECTOR(0 TO 15);
    s_axi_tx_tkeep : IN STD_LOGIC_VECTOR(0 TO 1);
    s_axi_tx_tvalid : IN STD_LOGIC;
    s_axi_tx_tready : OUT STD_LOGIC;
    s_axi_tx_tlast : IN STD_LOGIC;

    m_axi_rx_tdata : OUT STD_LOGIC_VECTOR(0 TO 31);
    m_axi_rx_tkeep : OUT STD_LOGIC_VECTOR(0 TO 3);
    m_axi_rx_tvalid : OUT STD_LOGIC;
    m_axi_rx_tlast : OUT STD_LOGIC;

    s_axi_tx_nfc_xoff : IN STD_LOGIC;
        
    crc_pass_fail_n : OUT STD_LOGIC;
    crc_valid       : OUT STD_LOGIC;
    
    frame_err       : OUT STD_LOGIC;
    hard_err        : OUT STD_LOGIC;
    soft_err        : OUT STD_LOGIC;
    
    channel_up      : OUT STD_LOGIC;
    lane_up         : OUT STD_LOGIC;
    
    tx_out_clk      : OUT STD_LOGIC;
    pll_not_locked  : OUT STD_LOGIC;
    power_down      : IN STD_LOGIC;
    loopback        : IN STD_LOGIC_VECTOR(2 downto 0);
    tx_lock         : OUT STD_LOGIC;
    tx_resetdone    : OUT STD_LOGIC;
    rx_resetdone    : OUT STD_LOGIC;
    link_reset      : OUT STD_LOGIC;
    gt_powergood    : OUT STD_LOGIC;
    bufg_gt_clr_out : OUT STD_LOGIC;
    drpclk          : IN STD_LOGIC;
    drpaddr         : IN STD_LOGIC_VECTOR(8 downto 0);
    drpdi           : IN STD_LOGIC_VECTOR(15 downto 0);
    drpdo           : OUT STD_LOGIC_VECTOR(15 downto 0);
    drpen           : IN STD_LOGIC;
    drprdy          : OUT STD_LOGIC;
    drpwe           : IN STD_LOGIC;
    
    rxp             : IN STD_LOGIC;
    rxn             : IN STD_LOGIC;
    txp             : OUT STD_LOGIC;
    txn             : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------
