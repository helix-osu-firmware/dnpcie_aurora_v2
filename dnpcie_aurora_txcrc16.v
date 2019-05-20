module dnpcie_aurora_txcrc16(  input channel_up,
                               input aclk,
                               input aresetn,
                               input [0:15] s_axis_tdata,
                               input [0:1] s_axis_tkeep,
                               input s_axis_tlast,
                               input s_axis_tvalid,
                               output s_axis_tready,
                               
                               output [0:15] m_axis_tdata,
                               output [0:1] m_axis_tkeep,
                               output m_axis_tlast,
                               output m_axis_tvalid,
                               input m_axis_tready );

    // This is the CRC TX portion from the Aurora core. 
    // First we need to adapt the AXI4-Stream signaling to Local Link.
    // (this shim logic is a piece of crap, but whatever, it works).
    // I might eventually replace this with my pure AXI4-Stream version
    // once I can establish it works, since it's faster and simpler.

    // NOTE NOTE NOTE
    // So here's Xilinx's shit bit-order handling for the Aurora core.
    // top-level core: [0:15] tdata [0:1] tkeep
    // adapt to local link: [0:15] data [0:1] rem
    // out of CRC: [0:15] data [0:1] rem
    // and then into the TX_LL.
    // So we maintain [0:15] tdata [0:1] tkeep everywhere,
    // and readapt LL->AXI (using the ll_to_axi shim)
    // to reinsert into the AXI core.
    //
    // LocalLink equivalent of the AXI4-Stream input
    wire    [0:15]  ll_data;
    wire            ll_sof_n;
    wire            ll_eof_n;
    wire    [0:0]   ll_rem;
    wire            ll_src_rdy_n;
    wire            ll_dst_rdy_n;
    // LocalLink output with CRC appended
    wire    [0:15]  ll_crc_data;
    wire            ll_crc_sof_n;
    wire            ll_crc_eof_n;
    wire    [0:0]   ll_crc_rem;
    wire            ll_crc_src_rdy_n;
    wire            ll_crc_dst_rdy_n;
    // shim to Local Link...
    aurora_aux_axi_to_ll #(.DATA_WIDTH(16),.REM_WIDTH(1'b1)) u_axi2ll_shim(.AXI4_S_IP_TX_TVALID(s_axis_tvalid),
                                       .AXI4_S_OP_TX_TREADY(s_axis_tready),
                                       .AXI4_S_IP_TX_TDATA(s_axis_tdata),
                                       .AXI4_S_IP_TX_TKEEP(s_axis_tkeep),
                                       .AXI4_S_IP_TX_TLAST(s_axis_tlast),
                                       // LocalLink output
                                       .LL_OP_DATA(ll_data),
                                       .LL_OP_SOF_N(ll_sof_n),
                                       .LL_OP_EOF_N(ll_eof_n),
                                       .LL_OP_REM(ll_rem),
                                       .LL_OP_SRC_RDY_N(ll_src_rdy_n),
                                       .LL_IP_DST_RDY_N(ll_dst_rdy_n),
                                       // system interface
                                       .USER_CLK(aclk),
                                       .RESET(!aresetn),
                                       .CHANNEL_UP(channel_up));
    // add CRC...
    aurora_aux_TX_CRC u_tx_crc(// upstream
                               .DATA_US(ll_data),
                               .REM_US(ll_rem),
                               .SOF_N_US(ll_sof_n),
                               .EOF_N_US(ll_eof_n),
                               .SRC_RDY_N_US(ll_src_rdy_n),
                               .DST_RDY_N_US(ll_dst_rdy_n),
                               // downstream
                               .DATA_DS(ll_crc_data),
                               .REM_DS(ll_crc_rem),
                               .SOF_N_DS(ll_crc_sof_n),
                               .EOF_N_DS(ll_crc_eof_n),
                               .SRC_RDY_N_DS(ll_crc_src_rdy_n),
                               .DST_RDY_N_DS(ll_crc_dst_rdy_n),
                               // system
                               .RESET(!aresetn),
                               .CLK(aclk));
    // and back to AXI
    aurora_aux_ll_to_axi #(.DATA_WIDTH(16),.REM_WIDTH(1)) u_ll2axi_shim(.AXI4_S_OP_TDATA(m_axis_tdata),
                                       .AXI4_S_OP_TKEEP(m_axis_tkeep),
                                       .AXI4_S_OP_TVALID(m_axis_tvalid),
                                       .AXI4_S_OP_TLAST(m_axis_tlast),
                                       .AXI4_S_IP_TREADY(m_axis_tready),
                                       // locallink
                                       .LL_IP_DATA(ll_crc_data),
                                       .LL_IP_REM(ll_crc_rem),
                                       .LL_IP_SOF_N(ll_crc_sof_n),
                                       .LL_IP_EOF_N(ll_crc_eof_n),
                                       .LL_IP_SRC_RDY_N(ll_crc_src_rdy_n),
                                       .LL_OP_DST_RDY_N(ll_crc_dst_rdy_n));
endmodule