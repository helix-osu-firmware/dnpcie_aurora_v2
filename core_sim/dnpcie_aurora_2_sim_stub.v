// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon May 20 10:20:09 2019
// Host        : PHY-NC188089 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               V:/helix-mmerger-test/hdl/dnpcie_aurora_v2/core_sim/dnpcie_aurora_2_sim_stub.v
// Design      : dnpcie_aurora_2_sim
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku035-ffva1156-1-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dnpcie_aurora_2_sim(s_axi_tx_tdata, s_axi_tx_tkeep, 
  s_axi_tx_tvalid, s_axi_tx_tlast, s_axi_tx_tready, m_axi_rx_tdata, m_axi_rx_tkeep, 
  m_axi_rx_tvalid, m_axi_rx_tlast, s_axi_nfc_tx_tvalid, s_axi_nfc_tx_tdata, 
  s_axi_nfc_tx_tready, m_axi_nfc_rx_tvalid, m_axi_nfc_rx_tdata, rxp, rxn, txp, txn, gt_refclk1, 
  frame_err, hard_err, soft_err, lane_up, channel_up, user_clk, sync_clk, gt_reset, reset, 
  sys_reset_out, power_down, loopback, tx_lock, init_clk_in, tx_resetdone_out, 
  rx_resetdone_out, link_reset_out, gt0_drpaddr, gt0_drpdi, gt0_drpdo, gt0_drpen, gt0_drprdy, 
  gt0_drpwe, gt_powergood, tx_out_clk, bufg_gt_clr_out, pll_not_locked)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:31],s_axi_tx_tkeep[0:3],s_axi_tx_tvalid,s_axi_tx_tlast,s_axi_tx_tready,m_axi_rx_tdata[0:31],m_axi_rx_tkeep[0:3],m_axi_rx_tvalid,m_axi_rx_tlast,s_axi_nfc_tx_tvalid,s_axi_nfc_tx_tdata[0:3],s_axi_nfc_tx_tready,m_axi_nfc_rx_tvalid,m_axi_nfc_rx_tdata[0:3],rxp,rxn,txp,txn,gt_refclk1,frame_err,hard_err,soft_err,lane_up,channel_up,user_clk,sync_clk,gt_reset,reset,sys_reset_out,power_down,loopback[2:0],tx_lock,init_clk_in,tx_resetdone_out,rx_resetdone_out,link_reset_out,gt0_drpaddr[8:0],gt0_drpdi[15:0],gt0_drpdo[15:0],gt0_drpen,gt0_drprdy,gt0_drpwe,gt_powergood[0:0],tx_out_clk,bufg_gt_clr_out,pll_not_locked" */;
  input [0:31]s_axi_tx_tdata;
  input [0:3]s_axi_tx_tkeep;
  input s_axi_tx_tvalid;
  input s_axi_tx_tlast;
  output s_axi_tx_tready;
  output [0:31]m_axi_rx_tdata;
  output [0:3]m_axi_rx_tkeep;
  output m_axi_rx_tvalid;
  output m_axi_rx_tlast;
  input s_axi_nfc_tx_tvalid;
  input [0:3]s_axi_nfc_tx_tdata;
  output s_axi_nfc_tx_tready;
  output m_axi_nfc_rx_tvalid;
  output [0:3]m_axi_nfc_rx_tdata;
  input rxp;
  input rxn;
  output txp;
  output txn;
  input gt_refclk1;
  output frame_err;
  output hard_err;
  output soft_err;
  output lane_up;
  output channel_up;
  input user_clk;
  input sync_clk;
  input gt_reset;
  input reset;
  output sys_reset_out;
  input power_down;
  input [2:0]loopback;
  output tx_lock;
  input init_clk_in;
  output tx_resetdone_out;
  output rx_resetdone_out;
  output link_reset_out;
  input [8:0]gt0_drpaddr;
  input [15:0]gt0_drpdi;
  output [15:0]gt0_drpdo;
  input gt0_drpen;
  output gt0_drprdy;
  input gt0_drpwe;
  output [0:0]gt_powergood;
  output tx_out_clk;
  output bufg_gt_clr_out;
  input pll_not_locked;
endmodule
