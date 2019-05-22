module dnpcie_aurora_2_wrap( 
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
    parameter SIMULATION = "FALSE";
    parameter USE_CORE = "TRUE";
    // Main Aurora core. The two XCIs are identical except that one has C_EXAMPLE_SIMULATION set.
    // I so wish there was a better way to do this, but using the core source directly
    // means it doesn't get generated out-of-context and builds are significantly slower.
    generate
        if (USE_CORE == "FALSE") begin : RAW
            dnpcie_aurora_2_core #(.EXAMPLE_SIMULATION(SIMULATION)) u_core(
                 .s_axi_tx_tdata(s_axi_tx_tdata),            // input wire [0 : 31] s_axi_tx_tdata
                .s_axi_tx_tkeep(s_axi_tx_tkeep),            // input wire [0 : 3] s_axi_tx_tkeep
                .s_axi_tx_tlast(s_axi_tx_tlast),            // input wire s_axi_tx_tlast
                .s_axi_tx_tvalid(s_axi_tx_tvalid),          // input wire s_axi_tx_tvalid
                .s_axi_tx_tready(s_axi_tx_tready),          // output wire s_axi_tx_tready
                .s_axi_nfc_tx_tvalid(s_axi_nfc_tx_tvalid),  // input wire s_axi_nfc_tx_tvalid
                .s_axi_nfc_tx_tdata(s_axi_nfc_tx_tdata),    // input wire [0 : 3] s_axi_nfc_tx_tdata
                .s_axi_nfc_tx_tready(s_axi_nfc_tx_tready),  // output wire s_axi_nfc_tx_tready
                .m_axi_rx_tdata(m_axi_rx_tdata),            // output wire [0 : 31] m_axi_rx_tdata
                .m_axi_rx_tkeep(m_axi_rx_tkeep),            // output wire [0 : 3] m_axi_rx_tkeep
                .m_axi_rx_tlast(m_axi_rx_tlast),            // output wire m_axi_rx_tlast
                .m_axi_rx_tvalid(m_axi_rx_tvalid),          // output wire m_axi_rx_tvalid
                .hard_err(hard_err),                        // output wire hard_err
                .soft_err(soft_err),                        // output wire soft_err
                .frame_err(frame_err),                      // output wire frame_err
                .channel_up(channel_up),                    // output wire channel_up
                .lane_up(lane_up),                          // output wire [0 : 0] lane_up
                .txp(txp),                                  // output wire [0 : 0] txp
                .txn(txn),                                  // output wire [0 : 0] txn
                .reset(reset),                              // input wire reset
                .gt_reset(gt_reset),                        // input wire gt_reset
                .loopback(loopback),                        // input wire [2 : 0] loopback
                .rxp(rxp),                                  // input wire [0 : 0] rxp
                .rxn(rxn),                                  // input wire [0 : 0] rxn
                .gt0_drpaddr(gt0_drpaddr),                  // input wire [8 : 0] gt0_drpaddr
                .gt0_drpen(gt0_drpen),                      // input wire gt0_drpen
                .gt0_drpdi(gt0_drpdi),                      // input wire [15 : 0] gt0_drpdi
                .gt0_drprdy(gt0_drprdy),                    // output wire gt0_drprdy
                .gt0_drpdo(gt0_drpdo),                      // output wire [15 : 0] gt0_drpdo
                .gt0_drpwe(gt0_drpwe),                      // input wire gt0_drpwe
                .m_axi_nfc_rx_tvalid(m_axi_nfc_rx_tvalid),  // output wire m_axi_nfc_rx_tvalid
                .m_axi_nfc_rx_tdata(m_axi_nfc_rx_tdata),    // output wire [0 : 3] m_axi_nfc_rx_tdata
                .power_down(power_down),                    // input wire power_down
                .tx_lock(tx_lock),                          // output wire tx_lock
                .tx_resetdone_out(tx_resetdone_out),        // output wire tx_resetdone_out
                .rx_resetdone_out(rx_resetdone_out),        // output wire rx_resetdone_out
                .link_reset_out(link_reset_out),            // output wire link_reset_out
                .init_clk_in(init_clk_in),                  // input wire init_clk_in
                .pll_not_locked(pll_not_locked),            // input wire pll_not_locked
                .tx_out_clk(tx_out_clk),                    // output wire tx_out_clk
                .bufg_gt_clr_out(bufg_gt_clr_out),          // output wire bufg_gt_clr_out
                .sys_reset_out(sys_reset_out),              // output wire sys_reset_out
                .user_clk(user_clk),                        // input wire user_clk
                .sync_clk(sync_clk),                        // input wire sync_clk
                .gt_refclk1(gt_refclk1),                    // input wire gt_refclk1
                .gt_powergood(gt_powergood)                // output wire [0 : 0] gt_powergood
            );
        end else if (SIMULATION == "TRUE") begin : SIM
            dnpcie_aurora_2_sim u_core(
              .s_axi_tx_tdata(s_axi_tx_tdata),            // input wire [0 : 31] s_axi_tx_tdata
              .s_axi_tx_tkeep(s_axi_tx_tkeep),            // input wire [0 : 3] s_axi_tx_tkeep
              .s_axi_tx_tlast(s_axi_tx_tlast),            // input wire s_axi_tx_tlast
              .s_axi_tx_tvalid(s_axi_tx_tvalid),          // input wire s_axi_tx_tvalid
              .s_axi_tx_tready(s_axi_tx_tready),          // output wire s_axi_tx_tready
              .s_axi_nfc_tx_tvalid(s_axi_nfc_tx_tvalid),  // input wire s_axi_nfc_tx_tvalid
              .s_axi_nfc_tx_tdata(s_axi_nfc_tx_tdata),    // input wire [0 : 3] s_axi_nfc_tx_tdata
              .s_axi_nfc_tx_tready(s_axi_nfc_tx_tready),  // output wire s_axi_nfc_tx_tready
              .m_axi_rx_tdata(m_axi_rx_tdata),            // output wire [0 : 31] m_axi_rx_tdata
              .m_axi_rx_tkeep(m_axi_rx_tkeep),            // output wire [0 : 3] m_axi_rx_tkeep
              .m_axi_rx_tlast(m_axi_rx_tlast),            // output wire m_axi_rx_tlast
              .m_axi_rx_tvalid(m_axi_rx_tvalid),          // output wire m_axi_rx_tvalid
              .hard_err(hard_err),                        // output wire hard_err
              .soft_err(soft_err),                        // output wire soft_err
              .frame_err(frame_err),                      // output wire frame_err
              .channel_up(channel_up),                    // output wire channel_up
              .lane_up(lane_up),                          // output wire [0 : 0] lane_up
              .txp(txp),                                  // output wire [0 : 0] txp
              .txn(txn),                                  // output wire [0 : 0] txn
              .reset(reset),                              // input wire reset
              .gt_reset(gt_reset),                        // input wire gt_reset
              .loopback(loopback),                        // input wire [2 : 0] loopback
              .rxp(rxp),                                  // input wire [0 : 0] rxp
              .rxn(rxn),                                  // input wire [0 : 0] rxn
              .gt0_drpaddr(gt0_drpaddr),                  // input wire [8 : 0] gt0_drpaddr
              .gt0_drpen(gt0_drpen),                      // input wire gt0_drpen
              .gt0_drpdi(gt0_drpdi),                      // input wire [15 : 0] gt0_drpdi
              .gt0_drprdy(gt0_drprdy),                    // output wire gt0_drprdy
              .gt0_drpdo(gt0_drpdo),                      // output wire [15 : 0] gt0_drpdo
              .gt0_drpwe(gt0_drpwe),                      // input wire gt0_drpwe
              .m_axi_nfc_rx_tvalid(m_axi_nfc_rx_tvalid),  // output wire m_axi_nfc_rx_tvalid
              .m_axi_nfc_rx_tdata(m_axi_nfc_rx_tdata),    // output wire [0 : 3] m_axi_nfc_rx_tdata
              .power_down(power_down),                    // input wire power_down
              .tx_lock(tx_lock),                          // output wire tx_lock
              .tx_resetdone_out(tx_resetdone_out),        // output wire tx_resetdone_out
              .rx_resetdone_out(rx_resetdone_out),        // output wire rx_resetdone_out
              .link_reset_out(link_reset_out),            // output wire link_reset_out
              .init_clk_in(init_clk_in),                  // input wire init_clk_in
              .pll_not_locked(pll_not_locked),            // input wire pll_not_locked
              .tx_out_clk(tx_out_clk),                    // output wire tx_out_clk
              .bufg_gt_clr_out(bufg_gt_clr_out),          // output wire bufg_gt_clr_out
              .sys_reset_out(sys_reset_out),              // output wire sys_reset_out
              .user_clk(user_clk),                        // input wire user_clk
              .sync_clk(sync_clk),                        // input wire sync_clk
              .gt_refclk1(gt_refclk1),                    // input wire gt_refclk1
              .gt_powergood(gt_powergood)                // output wire [0 : 0] gt_powergood
            );
        end else begin : HW
            dnpcie_aurora_2 u_core(
              .s_axi_tx_tdata(s_axi_tx_tdata),            // input wire [0 : 31] s_axi_tx_tdata
              .s_axi_tx_tkeep(s_axi_tx_tkeep),            // input wire [0 : 3] s_axi_tx_tkeep
              .s_axi_tx_tlast(s_axi_tx_tlast),            // input wire s_axi_tx_tlast
              .s_axi_tx_tvalid(s_axi_tx_tvalid),          // input wire s_axi_tx_tvalid
              .s_axi_tx_tready(s_axi_tx_tready),          // output wire s_axi_tx_tready
              .s_axi_nfc_tx_tvalid(s_axi_nfc_tx_tvalid),  // input wire s_axi_nfc_tx_tvalid
              .s_axi_nfc_tx_tdata(s_axi_nfc_tx_tdata),    // input wire [0 : 3] s_axi_nfc_tx_tdata
              .s_axi_nfc_tx_tready(s_axi_nfc_tx_tready),  // output wire s_axi_nfc_tx_tready
              .m_axi_rx_tdata(m_axi_rx_tdata),            // output wire [0 : 31] m_axi_rx_tdata
              .m_axi_rx_tkeep(m_axi_rx_tkeep),            // output wire [0 : 3] m_axi_rx_tkeep
              .m_axi_rx_tlast(m_axi_rx_tlast),            // output wire m_axi_rx_tlast
              .m_axi_rx_tvalid(m_axi_rx_tvalid),          // output wire m_axi_rx_tvalid
              .hard_err(hard_err),                        // output wire hard_err
              .soft_err(soft_err),                        // output wire soft_err
              .frame_err(frame_err),                      // output wire frame_err
              .channel_up(channel_up),                    // output wire channel_up
              .lane_up(lane_up),                          // output wire [0 : 0] lane_up
              .txp(txp),                                  // output wire [0 : 0] txp
              .txn(txn),                                  // output wire [0 : 0] txn
              .reset(reset),                              // input wire reset
              .gt_reset(gt_reset),                        // input wire gt_reset
              .loopback(loopback),                        // input wire [2 : 0] loopback
              .rxp(rxp),                                  // input wire [0 : 0] rxp
              .rxn(rxn),                                  // input wire [0 : 0] rxn
              .gt0_drpaddr(gt0_drpaddr),                  // input wire [8 : 0] gt0_drpaddr
              .gt0_drpen(gt0_drpen),                      // input wire gt0_drpen
              .gt0_drpdi(gt0_drpdi),                      // input wire [15 : 0] gt0_drpdi
              .gt0_drprdy(gt0_drprdy),                    // output wire gt0_drprdy
              .gt0_drpdo(gt0_drpdo),                      // output wire [15 : 0] gt0_drpdo
              .gt0_drpwe(gt0_drpwe),                      // input wire gt0_drpwe
              .m_axi_nfc_rx_tvalid(m_axi_nfc_rx_tvalid),  // output wire m_axi_nfc_rx_tvalid
              .m_axi_nfc_rx_tdata(m_axi_nfc_rx_tdata),    // output wire [0 : 3] m_axi_nfc_rx_tdata
              .power_down(power_down),                    // input wire power_down
              .tx_lock(tx_lock),                          // output wire tx_lock
              .tx_resetdone_out(tx_resetdone_out),        // output wire tx_resetdone_out
              .rx_resetdone_out(rx_resetdone_out),        // output wire rx_resetdone_out
              .link_reset_out(link_reset_out),            // output wire link_reset_out
              .init_clk_in(init_clk_in),                  // input wire init_clk_in
              .pll_not_locked(pll_not_locked),            // input wire pll_not_locked
              .tx_out_clk(tx_out_clk),                    // output wire tx_out_clk
              .bufg_gt_clr_out(bufg_gt_clr_out),          // output wire bufg_gt_clr_out
              .sys_reset_out(sys_reset_out),              // output wire sys_reset_out
              .user_clk(user_clk),                        // input wire user_clk
              .sync_clk(sync_clk),                        // input wire sync_clk
              .gt_refclk1(gt_refclk1),                    // input wire gt_refclk1
              .gt_powergood(gt_powergood)                // output wire [0 : 0] gt_powergood
            );
        end
    endgenerate
endmodule
