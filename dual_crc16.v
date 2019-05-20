`timescale 1ns / 1ps
// Calculation of 2x CRC-16s in one cycle.
// CRCOUTHIGH is the "halfway-generated" CRC from the "first" 16 bits
// (the high word).
module dual_crc16(
        input CRCCLK,
        input CRCRESET,
        input CRCDATAVALID,
        input CRCDATAWIDTH,
        input [31:0] CRCIN,
        output [15:0] CRCOUT,
        output [15:0] CRCOUTHIGH
    );
    parameter [15:0] CRCINIT = {16{1'b1}};
    parameter [15:0] CRCPOLY = 16'h1021;
    
    function [15:0] crc16_calc;
        input [15:0] data_in;
        input [15:0] crc_in;
        input [15:0] poly;
        reg [16:0] msg;
        integer i;
        begin
            msg = data_in ^ crc_in;
            for (i=0;i<16;i=i+1) begin
                msg = msg << 1;
                if (msg[16] == 1'b1) msg[15:0] = msg[15:0] ^ poly;
            end
            crc16_calc = msg[15:0];
        end
    endfunction
    function [7:0] byte_reverse;
        input [7:0] inval;
        integer i;
        begin
            for (i=0;i<8;i=i+1) byte_reverse[i] = inval[7-i];
        end
    endfunction
    // this is used when we end on an odd number of 16-bit words
    reg [15:0] crc_highval = {16{1'b0}};    
    reg [15:0] crc_val = {16{1'b0}};
    reg [15:0] high_crc_val;    
    reg [15:0] high_crc_input = {16{1'b0}};
    reg [15:0] low_crc_input = {16{1'b0}};
    reg crc_datavalid = 0;
    // combinatorically generate the first CRC
    always @(crc_val or high_crc_input) high_crc_val <= crc16_calc(high_crc_input, crc_val, CRCPOLY);
    // and sequentially generate the second CRC
    always @(posedge CRCCLK) begin : CRC_PROCESS
        if (CRCRESET) crc_val <= CRCINIT;
        else if (crc_datavalid) crc_val <= crc16_calc(low_crc_input, high_crc_val, CRCPOLY);
        // just for consistency
        if (CRCRESET) crc_highval <= CRCINIT;
        else if (crc_datavalid) crc_highval <= high_crc_val;
    end
    // input data and control
    always @(posedge CRCCLK) begin
        crc_datavalid <= CRCDATAVALID;
        low_crc_input[15:8] <= byte_reverse(CRCIN[15:8]);
        low_crc_input[7:0] <= byte_reverse(CRCIN[7:0]);
        high_crc_input[15:8] <= byte_reverse(CRCIN[31:24]);
        high_crc_input[7:0] <= byte_reverse(CRCIN[23:16]);
    end
    assign CRCOUT[7:0] = ~byte_reverse(crc_val[7:0]);
    assign CRCOUT[15:8] = ~byte_reverse(crc_val[15:8]);
    assign CRCOUTHIGH[7:0] = ~byte_reverse(crc_highval[7:0]);
    assign CRCOUTHIGH[15:8] = ~byte_reverse(crc_highval[15:8]);
endmodule
