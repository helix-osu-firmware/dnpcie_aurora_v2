// Full implementation of a single Aurora link from the master merger to the merger.
// This is a 16-bit transmit path, 32-bit receive path implementation, with 16-bit CRC.
//
// The receive path is *unbuffered* - that is, it has no tready input.
//
// Known issues:
// -- I don't handle TKEEP != 0x3 at all.
//
module dnpcie_aurora_core(
    input init_clk,
    input user_clk,
    input gt_refclk,
    input ext_reset,
    // 16-bit transmit path.
    input [0:15]    s_axis_tx_tdata,
    input [0:1]     s_axis_tx_tkeep,
    input           s_axis_tx_tvalid,
    input           s_axis_tx_tlast,
    output          s_axis_tx_tready,
    // sigh, dug-out raw receive path for debugging
    output [0:31]   m_axis_raw_tdata,
    output [0:3]    m_axis_raw_tkeep,
    output          m_axis_raw_tvalid,
    output          m_axis_raw_tlast,    
    // 32-bit receive path
    output [0:31]   m_axis_rx_tdata,
    output [0:3]    m_axis_rx_tkeep,
    output          m_axis_rx_tvalid,
    output          m_axis_rx_tuser,
    output          m_axis_rx_tlast,
    output          m_axis_crc_pass_fail_n,
    output          m_axis_crc_valid,
    output          m_axis_length_err,
    // flow control
    input           s_axis_tx_nfc_xoff,
    output          m_axis_rx_nfc_xoff,
    // errors
    output          frame_err,
    output          hard_err,
    output          soft_err,
    output          channel_up,
    output          lane_up,
        // system interface
    output          tx_out_clk,
    input           pll_not_locked,
    input           power_down,
    input [2:0]     loopback,
    output          tx_lock,
    output          tx_resetdone,
    output          rx_resetdone,
    output          bufg_gt_clr,
    output          gt_powergood,
    // DRP interface
    input           drpclk,
    input [8:0]     drpaddr,
    input [15:0]    drpdi,
    output [15:0]   drpdo,
    input           drpen,
    output          drprdy,
    input           drpwe,
    // GTP pins
    input           rxp,
    input           rxn,
    output          txp,
    output          txn
    );
    parameter   CC_FREQ_FACTOR = 5;
    parameter   EXAMPLE_SIMULATION = 0;
    parameter   LANE = 0;
    parameter   [7:0] DEBUG_MASK = 8'h00;
    
    localparam DEBUG = (DEBUG_MASK[LANE] == 1) ? "TRUE" : "FALSE";
    
    // Internal AXI4-Stream transmit bus. This is after CRC insertion
    // and width adaption. Again, insane bit ordering convention.
    wire [0:31] axis_postcrc_tx_tdata;
    wire [0:3] axis_postcrc_tx_tkeep;
    wire axis_postcrc_tx_tuser;
    wire axis_postcrc_tx_tlast;
    wire axis_postcrc_tx_tvalid;
    wire axis_postcrc_tx_tready;

    // Internal AXI4-Stream receive bus. This is before CRC checking.
    // Again, insane bit ordering convention.
    wire [0:31] axis_precrc_rx_tdata;
    wire [0:3] axis_precrc_rx_tkeep;
    wire axis_precrc_rx_tuser;
    wire axis_precrc_rx_tlast;
    wire axis_precrc_rx_tvalid;

    wire aresetn_local;

    // 16-to-32 bit path + CRC insertion
    dnpcie_aurora_tx_path_adapter u_tx_path(.aclk(user_clk),.aresetn(aresetn_local),.channel_up(channel_up),
                                            .s_axis_tdata(s_axis_tx_tdata),
                                            .s_axis_tkeep(s_axis_tx_tkeep),
                                            .s_axis_tlast(s_axis_tx_tlast),
                                            .s_axis_tvalid(s_axis_tx_tvalid),
                                            .s_axis_tready(s_axis_tx_tready),
                                            .m_axis_tdata(axis_postcrc_tx_tdata),
                                            .m_axis_tkeep(axis_postcrc_tx_tkeep),
                                            .m_axis_tlast(axis_postcrc_tx_tlast),
                                            .m_axis_tvalid(axis_postcrc_tx_tvalid),
                                            .m_axis_tready(axis_postcrc_tx_tready));

    aurora_core_wrap #(.CC_FREQ_FACTOR(CC_FREQ_FACTOR),
                       .EXAMPLE_SIMULATION(EXAMPLE_SIMULATION)) u_core_wrapper(
                       .init_clk(init_clk),
                       .user_clk(user_clk),
                       .gt_refclk(gt_refclk),
                       .ext_reset(ext_reset),
                       .aresetn(aresetn_local),
                       .s_axis_tx_tdata(axis_postcrc_tx_tdata),
                       .s_axis_tx_tkeep(axis_postcrc_tx_tkeep),
                       .s_axis_tx_tvalid(axis_postcrc_tx_tvalid),
                       .s_axis_tx_tlast(axis_postcrc_tx_tlast),
                       .s_axis_tx_tready(axis_postcrc_tx_tready),
                       
                       .m_axis_rx_tdata(axis_precrc_rx_tdata),
                       .m_axis_rx_tkeep(axis_precrc_rx_tkeep),
                       .m_axis_rx_tvalid(axis_precrc_rx_tvalid),
                       .m_axis_rx_tuser(axis_precrc_rx_tuser),
                       .m_axis_rx_tlast(axis_precrc_rx_tlast),
                       
                       .s_axis_tx_nfc_xoff(s_axis_tx_nfc_xoff),
                       .m_axis_rx_nfc_xoff(m_axis_rx_nfc_xoff),
                       
                       .frame_err(frame_err),
                       .hard_err(hard_err),
                       .soft_err(soft_err),
                       .channel_up(channel_up),
                       .lane_up(lane_up),
                       
                       .tx_out_clk(tx_out_clk),
                       .pll_not_locked(pll_not_locked),
                       .power_down(power_down),
                       .loopback(loopback),
                       .tx_lock(tx_lock),
                       .tx_resetdone(tx_resetdone),
                       .rx_resetdone(rx_resetdone),
                       .bufg_gt_clr(bufg_gt_clr),
                       .gt_powergood(gt_powergood),
                       .drpclk(drpclk),
                       .drpaddr(drpaddr),
                       .drpdi(drpdi),
                       .drpdo(drpdo),
                       .drpen(drpen),
                       .drprdy(drprdy),
                       .drpwe(drpwe),
                       
                       .rxp(rxp),
                       .rxn(rxn),
                       .txp(txp),
                       .txn(txn));
    
    // tuser is generated, so we don't need to grab it.                   
    assign m_axis_raw_tdata = axis_precrc_rx_tdata;
    assign m_axis_raw_tkeep = axis_precrc_rx_tkeep;
    assign m_axis_raw_tvalid = axis_precrc_rx_tvalid;
    assign m_axis_raw_tlast = axis_precrc_rx_tlast;

    // receive CRC check
    aurora_dual_crc16 #(.DEBUG(DEBUG)) u_crc16(.s_axis_aclk(user_clk),
                              .aresetn(aresetn_local),
                              // input AXI4S data from Aurora
                              .s_axis_tdata(axis_precrc_rx_tdata),
                              .s_axis_tkeep(axis_precrc_rx_tkeep),
                              .s_axis_tvalid(axis_precrc_rx_tvalid),
                              .s_axis_tuser(axis_precrc_rx_tuser),
                              .s_axis_tlast(axis_precrc_rx_tlast),
                              // output AXI4S data with CRC validated and stripped
                              .m_axis_tdata(m_axis_rx_tdata),
                              .m_axis_tkeep(m_axis_rx_tkeep),
                              .m_axis_tvalid(m_axis_rx_tvalid),
                              .m_axis_tuser(m_axis_rx_tuser),
                              .m_axis_tlast(m_axis_rx_tlast),
                              .m_axis_crc_pass_fail_n(m_axis_crc_pass_fail_n),
                              .m_axis_crc_valid(m_axis_crc_valid),
                              .m_axis_length_err(m_axis_length_err));    

endmodule

    