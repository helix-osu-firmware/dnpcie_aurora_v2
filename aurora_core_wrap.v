// this is the dnpcie_aurora module with the per-core resources merged into each core
// this still has a 32-bit transmit interface, the 16-to-32 bit adapter comes later.
// First step towards a goddamn working solution...
module aurora_core_wrap(
    input init_clk,
    input user_clk,
    input gt_refclk,
    input gt_bufclk,
    input ext_reset,
    // our AXI4S reset
    output          aresetn,    
    // transmit path
    input [0:31]    s_axis_tx_tdata,
    input [0:3]     s_axis_tx_tkeep,
    input           s_axis_tx_tvalid,
    input           s_axis_tx_tlast,
    output          s_axis_tx_tready,
    // sigh, dug-out raw receive path for debugging
    output [0:31]   m_axis_raw_tdata,
    output [0:3]    m_axis_raw_tkeep,
    output          m_axis_raw_tvalid,
    output          m_axis_raw_tlast,        
    // receive path
    output [0:31]   m_axis_rx_tdata,
    output [0:3]    m_axis_rx_tkeep,
    output          m_axis_rx_tvalid,
    output          m_axis_rx_tuser,
    output          m_axis_rx_tlast,
    // flow control
    input           s_axis_tx_nfc_xoff,
    output          m_axis_rx_nfc_xoff,
    // HACKY BULLSHIT
    // ONLY USED IF XOFF_BUSY IS TRUE
    input           busy_reset,
    input           going_full,
    output          trig,
    
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
    output          link_reset_out,
    input [15:0]    gt_reset_len,
    output          reset_busy,
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
    parameter CC_FREQ_FACTOR = 5;
    parameter EXAMPLE_SIMULATION = 0;
    parameter XOFF_BUSY = "FALSE";

    // unbuffered TX output
    wire            tx_out_clk_unbuffered;
    // reset in init_clk space
    wire            fr_gt_reset;
    // reset in user_clk space
    wire            ur_ch_reset;
    
    wire            s_axis_nfc_req;
    wire            s_axis_nfc_ack;
    wire    [0:3]   s_axis_nfc_nb;
    
    
    // OK: This shit maps to tvalid/tdata.
    // Let's see if we can sneaky-sneak steal a way to do it.
    wire            m_axis_rx_snf;
    wire    [0:3]   m_axis_rx_nb;
    
    assign m_nfc_tvalid = m_axis_rx_snf;
    assign m_nfc_tdata = m_axis_rx_nb;
    
    // OK: So the Aurora core handles XOFF entirely internally, converting
    // it into TREADY behavior. So we just use tready here, gated
    // by channel up. If an indefinite XOFF is asserted and *stays* asserted, this will
    // force us to go "stop" mode.
    assign          m_axis_rx_nfc_xoff = !s_axis_tx_tready && channel_up;

    // reset. This is all kinds of screwed up right now, but whatever.
    dnpcie_aurora_reset_v2 u_reset(.init_clk(init_clk),.user_clk(user_clk),.buf_refclk(gt_bufclk),
                                   .hotplug_wait_i( {16'h0000, gt_reset_len, 16'hFFFF } ),
                                   .reset_busy(reset_busy),
                                   .ext_reset(ext_reset),.gt_reset(fr_gt_reset),.chan_reset(ur_ch_reset));    
    //dnpcie_aurora_reset_v2 u_reset(.init_clk(init_clk),.user_clk(user_clk),.buf_refclk(gt_bufclk),.ext_reset(ext_reset),.gt_reset(fr_gt_reset),.chan_reset(ur_ch_reset));
    
    assign aresetn = !ur_ch_reset;
    
    // buffer
    BUFG_GT u_tx_outclk_bufg(.O(tx_out_clk),.CE(1'b1),.CEMASK(1'b0),.CLR(1'b0),.CLRMASK(1'b0),.DIV(3'b000),.I(tx_out_clk_unbuffered));
        
    // generator tuser
    dnpcie_aurora_tuser_generator u_tuser_gen(.user_clk(user_clk),.ur_ch_reset(ur_ch_reset),
                                              .channel_up(channel_up),
                                              .m_axi_rx_tvalid(m_axis_rx_tvalid),
                                              .m_axi_rx_tlast(m_axis_rx_tlast),
                                              .m_axi_rx_tuser(m_axis_rx_tuser));
    // generate XOFF                                                  
    generate
        if (XOFF_BUSY == "TRUE") begin : XOFFBUSY
            xoff_busy_generator u_xoffbusy_gen(.aclk(user_clk),.aresetn(!busy_reset),
                                               .going_full(going_full),
                                               .trig(trig),
                                               .m_axi_nfc_tdata(s_axis_nfc_nb),
                                               .m_axi_nfc_tvalid(s_axis_nfc_req),
                                               .m_axi_nfc_tready(s_axis_nfc_ack),
                                               .s_axi_nfc_tvalid(m_axis_rx_snf),
                                               .s_axi_nfc_tdata(m_axis_rx_nb));
        end else begin : XOFF
            dnpcie_aurora_xoff_generator u_xoff_gen(.user_clk(user_clk),.ur_ch_reset(ur_ch_reset),
                                                    .s_axi_tx_nfc_xoff(s_axis_tx_nfc_xoff),
                                                    .s_axi_nfc_req(s_axis_nfc_req),
                                                    .s_axi_nfc_ack(s_axis_nfc_ack),
                                                    .s_axi_nfc_nb(s_axis_nfc_nb));
        end
    endgenerate
    // instantiate core
    aurora_8b10b_core #(.CC_FREQ_FACTOR(CC_FREQ_FACTOR),.EXAMPLE_SIMULATION(EXAMPLE_SIMULATION))
                u_core(
                        .s_axi_tx_tdata(s_axis_tx_tdata),
                        .s_axi_tx_tkeep(s_axis_tx_tkeep),
                        .s_axi_tx_tvalid(s_axis_tx_tvalid),
                        .s_axi_tx_tlast(s_axis_tx_tlast),
                        .s_axi_tx_tready(s_axis_tx_tready),
                        
                        .m_axi_rx_tdata(m_axis_rx_tdata),
                        .m_axi_rx_tkeep(m_axis_rx_tkeep),
                        .m_axi_rx_tvalid(m_axis_rx_tvalid),
                        .m_axi_rx_tlast(m_axis_rx_tlast),
                        // TX logic
                        .s_axi_nfc_req(s_axis_nfc_req),
                        .s_axi_nfc_nb(s_axis_nfc_nb),
                        .s_axi_nfc_ack(s_axis_nfc_ack),
                        // don't do anything with the receive XOFF logic yet
                        .m_axi_rx_snf(m_axis_rx_snf),
                        .m_axi_rx_fc_nb(m_axis_rx_nb),
                        // GTP
                        .rxp(rxp),.rxn(rxn),
                        .txp(txp),.txn(txn),
                        .gt_refclk1(gt_refclk),
                        // err interface
                        .hard_err(hard_err),
                        .soft_err(soft_err),
                        .frame_err(frame_err),
                        // status
                        .channel_up(channel_up),
                        .lane_up(lane_up),
                        // system
                        .user_clk(user_clk),
                        .sync_clk(user_clk),
                        .reset(ur_ch_reset),
                        .power_down(power_down),
                        .loopback(loopback),
                        .gt_reset(fr_gt_reset),
                        .init_clk_in(init_clk),
                        .pll_not_locked(pll_not_locked),
                        .tx_resetdone_out(tx_resetdone),
                        .rx_resetdone_out(rx_resetdone),
                        .link_reset_out(link_reset_out),
                        .gt0_drpaddr_in(drpaddr),
                        .gt0_drpdi_in(drpdi),
                        .gt0_drpdo_out(drpdo),
                        .gt0_drpen_in(drpen),
                        .gt0_drprdy_out(drprdy),
                        .gt0_drpwe_in(drpwe),
                        .tx_out_clk(tx_out_clk_unbuffered),
                        .gt_powergood(gt_powergood),
                        .bufg_gt_clr_out(bufg_gt_clr),
                        .tx_lock(tx_lock));
endmodule
