///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 1995-2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////

 `timescale 1 ns / 10 ps

(* core_generation_info = "dnpcie_aurora_2,aurora_8b10b_v11_1_5,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTHQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=64000,c_nfc=true,c_nfc_mode=IMM,c_refclk_frequency=200000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=Immediate_NFC,interface_mode=Framing,dataflow_config=Duplex}" *)

 module dnpcie_aurora_2
 (
    // AXI TX Interface
 
input   [0:31]     s_axi_tx_tdata,
input   [0:3]      s_axi_tx_tkeep,
 
input              s_axi_tx_tvalid,
input              s_axi_tx_tlast,

output             s_axi_tx_tready,

    // AXI RX Interface
 
output  [0:31]     m_axi_rx_tdata,
output  [0:3]      m_axi_rx_tkeep,
 
output             m_axi_rx_tvalid,
output             m_axi_rx_tlast,


    // Native Flow Control TX Interface
input              s_axi_nfc_tx_tvalid,
 
input   [0:3]      s_axi_nfc_tx_tdata,

output             s_axi_nfc_tx_tready,

    // Native Flow Control RX Interface
output             m_axi_nfc_rx_tvalid,
 
output  [0:3]      m_axi_nfc_rx_tdata,


    // GT Serial I/O
input              rxp,
input              rxn,

output             txp,
output             txn,

    // GT Reference Clock Interface
input              gt_refclk1,

    // Error Detection Interface
 
output             frame_err,
output             hard_err,
output             soft_err,
    // Status
output             lane_up,
output             channel_up,




    // System Interface
input               user_clk,
input               sync_clk,
input               gt_reset,
input               reset,
output              sys_reset_out,

input              power_down,
input   [2:0]      loopback,
output             tx_lock,

input              init_clk_in,
output             tx_resetdone_out,
output             rx_resetdone_out,
output             link_reset_out,
    //DRP Ports
    input   [8:0]      gt0_drpaddr,
    input   [15:0]     gt0_drpdi,
    output  [15:0]     gt0_drpdo,
    input              gt0_drpen,
    output             gt0_drprdy,
    input              gt0_drpwe,


 output  [0 : 0 ]          gt_powergood,
//------------------{
//------------------}
output             tx_out_clk,
    output         bufg_gt_clr_out,


input              pll_not_locked


 );

 `define DLY #1

 //*********************************Main Body of Code**********************************

//--- Instance of _core module --[
dnpcie_aurora_2_core inst
     (
        // AXI TX Interface
       .s_axi_tx_tdata               (s_axi_tx_tdata),
       .s_axi_tx_tkeep               (s_axi_tx_tkeep),
       .s_axi_tx_tvalid              (s_axi_tx_tvalid),
       .s_axi_tx_tlast               (s_axi_tx_tlast),
       .s_axi_tx_tready              (s_axi_tx_tready),

        // AXI RX Interface
       .m_axi_rx_tdata               (m_axi_rx_tdata),
       .m_axi_rx_tkeep               (m_axi_rx_tkeep),
       .m_axi_rx_tvalid              (m_axi_rx_tvalid),
       .m_axi_rx_tlast               (m_axi_rx_tlast),
        // Native Flow Control TX Interface
       .s_axi_nfc_req                (s_axi_nfc_tx_tvalid),
       .s_axi_nfc_nb                 (s_axi_nfc_tx_tdata),
       .s_axi_nfc_ack                (s_axi_nfc_tx_tready),

        // Native Flow Control RX Interface
       .m_axi_rx_snf                 (m_axi_nfc_rx_tvalid),
       .m_axi_rx_fc_nb               (m_axi_nfc_rx_tdata),


        // GT Serial I/O
       .rxp                          (rxp),
       .rxn                          (rxn),
       .txp                          (txp),
       .txn                          (txn),

        // GT Reference Clock Interface
       .gt_refclk1                   (gt_refclk1),
        // Error Detection Interface
       .frame_err                    (frame_err),

        // Error Detection Interface
       .hard_err                     (hard_err),
       .soft_err                     (soft_err),

        // Status
       .channel_up                   (channel_up),
       .lane_up                      (lane_up),




        // System Interface
       .user_clk                     (user_clk),
       .sync_clk                     (sync_clk),
       .reset                        (reset),
       .sys_reset_out                (sys_reset_out),
       .power_down                   (power_down),
       .loopback                     (loopback),
       .gt_reset                     (gt_reset),
       .tx_lock                      (tx_lock),
       .bufg_gt_clr_out              (bufg_gt_clr_out),
       .init_clk_in                  (init_clk_in),
       .pll_not_locked               (pll_not_locked),
       .tx_resetdone_out             (tx_resetdone_out),
       .rx_resetdone_out             (rx_resetdone_out),
       .link_reset_out               (link_reset_out),
       .gt0_drpaddr_in                   (gt0_drpaddr),
       .gt0_drpen_in                     (gt0_drpen),
       .gt0_drpdi_in                     (gt0_drpdi),
       .gt0_drprdy_out                   (gt0_drprdy),
       .gt0_drpdo_out                    (gt0_drpdo),
       .gt0_drpwe_in                     (gt0_drpwe),
//------------------{
//------------------}
    .gt_powergood          (gt_powergood),
       .tx_out_clk                   (tx_out_clk)
     );

//--- Instance of _core module --]



 endmodule
