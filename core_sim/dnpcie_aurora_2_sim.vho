-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:aurora_8b10b:11.1
-- IP Revision: 5

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT dnpcie_aurora_2_sim
  PORT (
    s_axi_tx_tdata : IN STD_LOGIC_VECTOR(0 TO 31);
    s_axi_tx_tkeep : IN STD_LOGIC_VECTOR(0 TO 3);
    s_axi_tx_tlast : IN STD_LOGIC;
    s_axi_tx_tvalid : IN STD_LOGIC;
    s_axi_tx_tready : OUT STD_LOGIC;
    s_axi_nfc_tx_tvalid : IN STD_LOGIC;
    s_axi_nfc_tx_tdata : IN STD_LOGIC_VECTOR(0 TO 3);
    s_axi_nfc_tx_tready : OUT STD_LOGIC;
    m_axi_rx_tdata : OUT STD_LOGIC_VECTOR(0 TO 31);
    m_axi_rx_tkeep : OUT STD_LOGIC_VECTOR(0 TO 3);
    m_axi_rx_tlast : OUT STD_LOGIC;
    m_axi_rx_tvalid : OUT STD_LOGIC;
    hard_err : OUT STD_LOGIC;
    soft_err : OUT STD_LOGIC;
    frame_err : OUT STD_LOGIC;
    channel_up : OUT STD_LOGIC;
    lane_up : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    txp : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    txn : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    reset : IN STD_LOGIC;
    gt_reset : IN STD_LOGIC;
    loopback : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    rxp : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rxn : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gt0_drpaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    gt0_drpen : IN STD_LOGIC;
    gt0_drpdi : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt0_drprdy : OUT STD_LOGIC;
    gt0_drpdo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt0_drpwe : IN STD_LOGIC;
    m_axi_nfc_rx_tvalid : OUT STD_LOGIC;
    m_axi_nfc_rx_tdata : OUT STD_LOGIC_VECTOR(0 TO 3);
    power_down : IN STD_LOGIC;
    tx_lock : OUT STD_LOGIC;
    tx_resetdone_out : OUT STD_LOGIC;
    rx_resetdone_out : OUT STD_LOGIC;
    link_reset_out : OUT STD_LOGIC;
    init_clk_in : IN STD_LOGIC;
    pll_not_locked : IN STD_LOGIC;
    tx_out_clk : OUT STD_LOGIC;
    bufg_gt_clr_out : OUT STD_LOGIC;
    sys_reset_out : OUT STD_LOGIC;
    user_clk : IN STD_LOGIC;
    sync_clk : IN STD_LOGIC;
    gt_refclk1 : IN STD_LOGIC;
    gt_powergood : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : dnpcie_aurora_2_sim
  PORT MAP (
    s_axi_tx_tdata => s_axi_tx_tdata,
    s_axi_tx_tkeep => s_axi_tx_tkeep,
    s_axi_tx_tlast => s_axi_tx_tlast,
    s_axi_tx_tvalid => s_axi_tx_tvalid,
    s_axi_tx_tready => s_axi_tx_tready,
    s_axi_nfc_tx_tvalid => s_axi_nfc_tx_tvalid,
    s_axi_nfc_tx_tdata => s_axi_nfc_tx_tdata,
    s_axi_nfc_tx_tready => s_axi_nfc_tx_tready,
    m_axi_rx_tdata => m_axi_rx_tdata,
    m_axi_rx_tkeep => m_axi_rx_tkeep,
    m_axi_rx_tlast => m_axi_rx_tlast,
    m_axi_rx_tvalid => m_axi_rx_tvalid,
    hard_err => hard_err,
    soft_err => soft_err,
    frame_err => frame_err,
    channel_up => channel_up,
    lane_up => lane_up,
    txp => txp,
    txn => txn,
    reset => reset,
    gt_reset => gt_reset,
    loopback => loopback,
    rxp => rxp,
    rxn => rxn,
    gt0_drpaddr => gt0_drpaddr,
    gt0_drpen => gt0_drpen,
    gt0_drpdi => gt0_drpdi,
    gt0_drprdy => gt0_drprdy,
    gt0_drpdo => gt0_drpdo,
    gt0_drpwe => gt0_drpwe,
    m_axi_nfc_rx_tvalid => m_axi_nfc_rx_tvalid,
    m_axi_nfc_rx_tdata => m_axi_nfc_rx_tdata,
    power_down => power_down,
    tx_lock => tx_lock,
    tx_resetdone_out => tx_resetdone_out,
    rx_resetdone_out => rx_resetdone_out,
    link_reset_out => link_reset_out,
    init_clk_in => init_clk_in,
    pll_not_locked => pll_not_locked,
    tx_out_clk => tx_out_clk,
    bufg_gt_clr_out => bufg_gt_clr_out,
    sys_reset_out => sys_reset_out,
    user_clk => user_clk,
    sync_clk => sync_clk,
    gt_refclk1 => gt_refclk1,
    gt_powergood => gt_powergood
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file dnpcie_aurora_2_sim.vhd when simulating
-- the core, dnpcie_aurora_2_sim. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

