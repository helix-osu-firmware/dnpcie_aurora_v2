// Aurora CRC generator (for actual CRC see dual_crc16)
// Note that Aurora's "internal" CRC (core_name_CRC_TOP)
// uses "most significant bit is 0" ordering even though
// the actual Aurora core uses "least significant bit" ordering.
// So we keep the bizarre convention here. Thanks so much for the
// amazing stupidity, Xilinx.
// So just connect the [0:31] tdata output to the input here
// and use the output as [0:31] as well.
//
// Note this currently doesn't work if you don't send in an even number
// of non-CRC data words. Working on that.
module aurora_dual_crc16(
        input s_axis_aclk,
        input aresetn,
        input [31:0] s_axis_tdata,
        input [3:0] s_axis_tkeep,
        input s_axis_tuser,
        input s_axis_tlast,
        input s_axis_tvalid,
        output [31:0] m_axis_tdata,
        output [3:0] m_axis_tkeep,
        output m_axis_tuser,
        output m_axis_tlast,
        output m_axis_tvalid,
        output m_axis_length_err,
        output m_axis_crc_pass_fail_n,
        output m_axis_crc_valid
    );
        parameter DEBUG = "FALSE";
    
        // first TVALID after TLAST resets CRC.
        // dear god this is awkward
        localparam FSM_BITS=2;
        localparam [FSM_BITS-1:0] IDLE = 0;
        localparam [FSM_BITS-1:0] DATA_AVAIL = 1;
        localparam [FSM_BITS-1:0] DATA_WAIT = 2;
        localparam [FSM_BITS-1:0] LAST_DATA = 3;
        reg [FSM_BITS-1:0] state = IDLE;
        
        wire [15:0] calculated_crc;
        
        always @(posedge s_axis_aclk) begin
            if (!aresetn) state <= IDLE;
            else case (state)
                IDLE: if (s_axis_tvalid) state <= DATA_AVAIL;
                DATA_AVAIL: if (!s_axis_tvalid) state <= DATA_WAIT;
                            else if (s_axis_tlast) state <= LAST_DATA;
                DATA_WAIT: if (s_axis_tvalid) begin
                    if (s_axis_tlast) state <= LAST_DATA;
                    else state <= DATA_AVAIL;
                end
                LAST_DATA: if (s_axis_tvalid) state <= DATA_AVAIL; else state <= IDLE;
           endcase
        end
        reg [15:0] crc_in = {16{1'b0}};
        reg [31:0] data_hold = {32{1'b0}};
        reg [3:0] tkeep_hold = {4{1'b0}};
        reg tuser_hold = 0;
        reg length_err = 0;
        always @(posedge s_axis_aclk) begin
            if (s_axis_tvalid && s_axis_tlast) crc_in <= s_axis_tdata[31:16];
            if (s_axis_tvalid && !s_axis_tlast) data_hold <= s_axis_tdata;
            if (s_axis_tvalid && !s_axis_tlast) tkeep_hold <= s_axis_tkeep;
            if (s_axis_tvalid && !s_axis_tlast) tuser_hold <= s_axis_tuser;
            // this error is later anded with state == LAST_DATA so that it's only valid
            // at the same time as m_axis_crc_valid.
            if (s_axis_tvalid) length_err <= (s_axis_tkeep != 4'hC);
        end    
        assign m_axis_tvalid = (state == DATA_AVAIL && s_axis_tvalid && !s_axis_tlast) || (state == DATA_WAIT && s_axis_tvalid && !s_axis_tlast) || (state == LAST_DATA);
        assign m_axis_crc_valid = (state == LAST_DATA);
        assign m_axis_length_err = (state == LAST_DATA) && length_err;
        assign m_axis_crc_pass_fail_n = (state == LAST_DATA) && (crc_in == calculated_crc);
        assign m_axis_tlast = (state == LAST_DATA); 
        assign m_axis_tdata = data_hold;
        // Fake the TKEEP output: this will generate a TKEEP error on the last frame if the last frame's TKEEP is not 0xC.
        assign m_axis_tkeep = (s_axis_tlast) ? ((s_axis_tkeep == 4'hC) ? tkeep_hold : 4'h0) : tkeep_hold;
        assign m_axis_tuser = tuser_hold;
        dual_crc16 u_crc(.CRCCLK(s_axis_aclk),.CRCRESET((state == IDLE || state == LAST_DATA) && s_axis_tvalid),.CRCDATAVALID(s_axis_tvalid && !s_axis_tlast),.CRCIN(s_axis_tdata),.CRCOUT(calculated_crc));    
    
        generate
            if (DEBUG == "TRUE") begin : DBG
                int_aurora_debug u_debug(.clk(s_axis_aclk),.probe0(s_axis_tdata),.probe1(s_axis_tkeep),.probe2(s_axis_tlast),.probe3(s_axis_tuser),.probe4(s_axis_tvalid),
                                            .probe5(m_axis_crc_valid),.probe6(m_axis_crc_pass_fail_n),.probe7(m_axis_length_err));
            end
        endgenerate
endmodule