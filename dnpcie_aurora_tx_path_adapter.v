// This is a transmit path adapter for the DNPCIe Aurora design,
// which takes a 16-bit AXI4-Stream path, adds a CRC at the end,
// and then shoves it through an AXI4-Stream data width
// conversion to up it to 32-bits overall.
//
// Note: Xilinx doesn't understand that endianness (byte ordering)
// is different than bit-endianness (bit ordering) and so everything
// here is just a giant mess.
//
// This works if you only ever feed in full 16-bit words (i.e. tkeep is always 3)
// Only do that.
//
module  dnpcie_aurora_tx_path_adapter( input channel_up,
                                       input aclk,
                                       input aresetn,
                                       input [0:15] s_axis_tdata,
                                       input [0:1] s_axis_tkeep,
                                       input s_axis_tlast,
                                       input s_axis_tvalid,
                                       output s_axis_tready,
                                       
                                       output [0:31] m_axis_tdata,
                                       output [0:3] m_axis_tkeep,
                                       output m_axis_tlast,
                                       output m_axis_tvalid,
                                       input m_axis_tready );
    // AXI4-Stream connection from CRC->width adapter
    wire    [0:15]  axis_crc_tdata;
    wire    [0:1]   axis_crc_tkeep;
    wire            axis_crc_tlast;
    wire            axis_crc_tvalid;
    wire            axis_crc_tready;
    // Temporary AXI4-Stream connection output from width adapter
    wire    [0:31]  axis_wa_tdata;
    wire    [0:3]   axis_wa_tkeep;
    wire            axis_wa_tlast;
    wire            axis_wa_tvalid;
    wire            axis_wa_tready;
    // insert CRC
    dnpcie_aurora_txcrc16 u_crc_inserter(.channel_up(channel_up),.aclk(aclk),.aresetn(aresetn),
                                         .s_axis_tdata(s_axis_tdata),
                                         .s_axis_tkeep(s_axis_tkeep),
                                         .s_axis_tlast(s_axis_tlast),
                                         .s_axis_tvalid(s_axis_tvalid),
                                         .s_axis_tready(s_axis_tready),
                                         // inserted path
                                         .m_axis_tdata(axis_crc_tdata),
                                         .m_axis_tkeep(axis_crc_tkeep),
                                         .m_axis_tlast(axis_crc_tlast),
                                         .m_axis_tvalid(axis_crc_tvalid),
                                         .m_axis_tready(axis_crc_tready));
      // adapt width
      axis_dwidth_converter_0 u_width_adapter(.aclk(aclk),.aresetn(aresetn),                                  
                                              .s_axis_tdata(axis_crc_tdata),
                                              .s_axis_tkeep(axis_crc_tkeep),
                                              .s_axis_tlast(axis_crc_tlast),
                                              .s_axis_tvalid(axis_crc_tvalid),
                                              .s_axis_tready(axis_crc_tready),
                                              .m_axis_tdata(axis_wa_tdata),
                                              .m_axis_tkeep(axis_wa_tkeep),
                                              .m_axis_tlast(axis_wa_tlast),
                                              .m_axis_tvalid(axis_wa_tvalid),
                                              .m_axis_tready(axis_wa_tready));
      // Because Aurora's a network protocol, symbol ordering is big-endian.
      // AXI4-Stream is little endian, so we have to swap them.
      // Since it's a 16-bit to 32-bit adapter, we swap word endianness.
      assign m_axis_tdata[0:15] = axis_wa_tdata[16:31];
      assign m_axis_tdata[16:31] = axis_wa_tdata[0:15];
      assign m_axis_tkeep[0:1] = axis_wa_tkeep[2:3];
      assign m_axis_tkeep[2:3] = axis_wa_tkeep[0:1];
      assign m_axis_tvalid = axis_wa_tvalid;
      assign m_axis_tlast = axis_wa_tlast;      
      assign axis_wa_tready = m_axis_tready;
endmodule

                                       