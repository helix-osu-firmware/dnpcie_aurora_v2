// This module is a single-link Aurora as used in HELIX with a
// "receive 16 bit as 32 bit" and "transmit 32 bit as 16 bit"
// data path.
//
// It mostly follows the dnpcie_aurora.vhd port mappings, just a single-lane version of them.
module dnpcie_aurora_CRC16_v2(
    // gigabit transceiver clock
    input gt_refclk,
    // free-running initialization clock
    input init_clk,
    // Aurora logic clock
    input user_clk,
    // external reset
    input ext_reset,
    // Outbound path. 16-bit only! Gets adapted to 32-bit internally. WAY EASIER this way.
    input   [0:15]      s_axi_tx_tdata,
    input   [0:1]       s_axi_tx_tkeep,
    input               s_axi_tx_tvalid,
    output              s_axi_tx_tready,
    input               s_axi_tx_tlast,
    // Inbound path. Note that this is "word big-endian" and needs to be swapped.
    // ([31:16]->[15:0] and viceversa).
    // Also note that I have no effing clue how tkeep behaves so for now let's just
    // assume tkeep is always 0xF (data is always sent in even numbers of 16-bit
    // words.
    output  [0:31]      m_axi_rx_tdata,
    output  [0:3]       m_axi_rx_tkeep,
    output              m_axi_rx_tvalid,
    // no tready
    output              m_axi_rx_tlast,
    output              m_axi_rx_tuser,
    // generate an NFC XOFF
    input               s_axi_tx_nfc_xoff,
    // CRC output
    output              crc_pass_fail_n,
    output              crc_valid,
    // Error outputs
    output              frame_err,
    output              hard_err,
    output              soft_err,
    // Status
    output              channel_up,
    output              lane_up,
    // System interfaces
    output              tx_out_clk,
    input               pll_not_locked,
    input               power_down,
    input   [2:0]       loopback,
    output              tx_lock,
    output              tx_resetdone,
    output              rx_resetdone,
    // additional status ports not in original dnpcie_aurora.vhd
    // basically goes high for a brief bit when link is unplugged
    output              link_reset,
    // goes high when power is OK and GTP clock is about to become OK
    // see GTH transceiver datasheet (GTPOWERGOOD)
    output              gt_powergood,
    // goes high when TX is resetting PMA, and low when it's complete.
    output              bufg_gt_clr_out,
    // DRP port
    input               drpclk,
    input   [8:0]       drpaddr,
    input   [15:0]      drpdi,
    output  [15:0]      drpdo,
    input               drpen,
    output              drprdy,
    input               drpwe,
    // GTP I/O
    input               rxp,
    input               rxn,
    output              txp,
    output              txn    
    );

    // 
    parameter CONNECT_GT_CLR = "TRUE";
    parameter SIM_SPDUP = "TRUE";
    parameter USE_CORE = "TRUE";
    
    // XOFF internal signals
    wire axis_nfc_tx_tvalid;
    wire axis_nfc_tx_tready;
    wire [0:3] axis_nfc_tx_tdata;
    wire axis_nfc_rx_tvalid;
    wire [0:3] axis_nfc_rx_tdata;
    // Reset internal signals
    wire gt_reset_init_clk;
    wire ch_reset_user_clk;
    // Unbuffered TX output clock
    wire tx_out_clk_unbuffered;
    
    // Internal AXI4-Stream receive bus. The output is actually
    // connected to the custom CRC checker. Note that
    // we keep the inane "most-significant bit is 0"
    // ordering here just by convention so that we
    // look like a slightly-wrapped Aurora core.
    // (also we use the axis_ prefix here because it's AXI4-Stream, regardless of
    //  Xilinx's naming convention disaster)
    wire [0:31] axis_precrc_rx_tdata;
    wire [0:3] axis_precrc_rx_tkeep;
    wire axis_precrc_rx_tuser;
    wire axis_precrc_rx_tlast;
    wire axis_precrc_rx_tvalid;
    
    // Internal AXI4-Stream transmit bus. This is after CRC insertion
    // and width adaption. Again, insane bit ordering convention.
    wire [0:31] axis_postcrc_tx_tdata;
    wire [0:3] axis_postcrc_tx_tkeep;
    wire axis_postcrc_tx_tuser;
    wire axis_postcrc_tx_tlast;
    wire axis_postcrc_tx_tvalid;
    wire axis_postcrc_tx_tready;
    
    // Not sure if this should be connected or not: Xilinx says it should be, but Brandon didn't
    // in the dnpcie_aurora design. My guess is that it probably doesn't matter since the clock
    // isn't divided.
    wire tx_out_clk_bufg_clr = (CONNECT_GT_CLR == "TRUE") ? bufg_gt_clr_out : 1'b0;
    
    // Buffer the TX out clock.
    BUFG_GT u_bufg(.I(tx_out_clk_unbuffered),.O(tx_out_clk),
                   .CE(1'b1),.CEMASK(1'b0),.CLR(tx_out_clk_bufg_clr),.CLRMASK(1'b0),.DIV(3'b000));
    
    // Reset generator    
    dnpcie_aurora_reset u_aurora_reset(.init_clk(init_clk),.user_clk(user_clk),.ext_reset(ext_reset),
                                       .gt_reset(gt_reset_init_clk),
                                       .chan_reset(ch_reset_user_clk));

    // Adapt the transmit path (insert CRC and convert to 32-bit width)
    dnpcie_aurora_tx_path_adapter u_tx_path(.aclk(user_clk),.aresetn(ch_reset_user_clk),.channel_up(channel_up),
                                            .s_axis_tdata(s_axi_tx_tdata),
                                            .s_axis_tkeep(s_axi_tx_tkeep),
                                            .s_axis_tlast(s_axi_tx_tlast),
                                            .s_axis_tvalid(s_axi_tx_tvalid),
                                            .s_axis_tready(s_axi_tx_tready),
                                            .m_axis_tdata(axis_postcrc_tx_tdata),
                                            .m_axis_tkeep(axis_postcrc_tx_tkeep),
                                            .m_axis_tlast(axis_postcrc_tx_tlast),
                                            .m_axis_tvalid(axis_postcrc_tx_tvalid),
                                            .m_axis_tready(axis_postcrc_tx_tready));                                            
    // Main core, with the simulation select wrapper.
    dnpcie_aurora_2_wrap #(.SIMULATION(SIM_SPDUP),.USE_CORE(USE_CORE)) u_aurora(
                                            // AXI outbound interface
                                            .s_axi_tx_tdata(axis_postcrc_tx_tdata),
                                            .s_axi_tx_tkeep(axis_postcrc_tx_tkeep),
                                            .s_axi_tx_tvalid(axis_postcrc_tx_tvalid),
                                            .s_axi_tx_tlast(axis_postcrc_tx_tlast),
                                            .s_axi_tx_tready(axis_postcrc_tx_tready),
                                            // AXI inbound interface
                                            .m_axi_rx_tdata(axis_precrc_rx_tdata),
                                            .m_axi_rx_tkeep(axis_precrc_rx_tkeep),
                                            .m_axi_rx_tvalid(axis_precrc_rx_tvalid),
                                            .m_axi_rx_tlast(axis_precrc_rx_tlast),
                                            // NFC transmit interface (for sending XOFF)
                                            .s_axi_nfc_tx_tvalid(axis_nfc_tx_tvalid),
                                            .s_axi_nfc_tx_tdata(axis_nfc_tx_tdata),
                                            .s_axi_nfc_tx_tready(axis_nfc_tx_tready),
                                            // NFC receive interface (for receiving XOFF)
                                            .m_axi_nfc_rx_tvalid(axis_nfc_rx_tvalid),
                                            .m_axi_nfc_rx_tdata(axis_nfc_rx_tdata),
                                            // GTP Serial I/O
                                            .rxp(rxp),.rxn(rxn),
                                            .txp(txp),.txn(txn),
                                            // GTP reference clk
                                            .gt_refclk1(gt_refclk),
                                            // Error interface
                                            .hard_err(hard_err),
                                            .soft_err(soft_err),
                                            .frame_err(frame_err),
                                            // Status
                                            .channel_up(channel_up),
                                            .lane_up(lane_up),
                                            // System interface
                                            .user_clk(user_clk),
                                            .sync_clk(user_clk),
                                            .reset(ch_reset_user_clk),
                                            .power_down(power_down),
                                            .loopback(loopback),
                                            .gt_reset(gt_reset_init_clk),
                                            .pll_not_locked(pll_not_locked),
                                            .tx_resetdone_out(tx_resetdone),
                                            .rx_resetdone_out(rx_resetdone),
                                            .link_reset_out(link_reset),
                                            .gt_powergood(gt_powergood),
                                            .bufg_gt_clr_out(bufg_gt_clr_out),
                                            .tx_lock(tx_lock),
                                            .sys_reset_out());
    // Generate TUSER.
    dnpcie_aurora_tuser_generator u_tuser(.user_clk(user_clk),.ur_ch_reset(ch_reset_user_clk),
                                          .channel_up(channel_up),
                                          .m_axi_rx_tvalid(axis_precrc_rx_tvalid),
                                          .m_axi_rx_tlast(axis_precrc_rx_tlast),
                                          .m_axi_rx_tuser(axis_precrc_rx_tuser));                  
    // Generate XOFF.
    dnpcie_aurora_xoff_generator u_xoff(.user_clk(user_clk),.ur_ch_reset(ch_reset_user_clk),
                                        .s_axi_tx_nfc_xoff(s_axi_tx_nfc_xoff),
                                        .s_axi_tx_nfc_req(axis_nfc_tx_tvalid),
                                        .s_axi_tx_nfc_ack(axis_nfc_tx_tready),
                                        .s_axi_tx_nfc_nb(axis_nfc_tx_tdata));
    // Check the CRC for received messages.
    aurora_dual_crc16 u_crc16(.s_axis_aclk(user_clk),
                              .reset(ch_reset_user_clk),
                              // input AXI4S data from Aurora
                              .s_axis_tdata(axis_precrc_rx_tdata),
                              .s_axis_tkeep(axis_precrc_rx_tkeep),
                              .s_axis_tvalid(axis_precrc_rx_tvalid),
                              .s_axis_tuser(axis_precrc_rx_tuser),
                              .s_axis_tlast(axis_precrc_rx_tlast),
                              // output AXI4S data with CRC validated and stripped
                              .m_axis_tdata(m_axi_rx_tdata),
                              .m_axis_tkeep(m_axi_rx_tkeep),
                              .m_axis_tvalid(m_axi_rx_tvalid),
                              .m_axis_tuser(m_axi_rx_tuser),
                              .m_axis_tlast(m_axi_rx_tlast),
                              .m_axis_crc_pass_fail_n(crc_pass_fail_n),
                              .m_axis_crc_valid(crc_valid));
endmodule