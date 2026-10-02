`timescale 1ns / 1ps
// this is the master trigger's XOFF interface.
// We use the NFC path as a sideband interface rather than a true xoff
module xoff_busy_generator(
        input aclk,
        input aresetn,
        output [3:0] m_axi_nfc_tdata,
        output       m_axi_nfc_tvalid,
        input        m_axi_nfc_tready,
        
        input s_axi_nfc_tvalid,
        input [3:0] s_axi_nfc_tdata,
        
        input going_full,
        output trig        
    );
    // update to add reset hackery
    localparam [3:0] BUSY_VAL = 4'h4;
    localparam [3:0] NOT_BUSY_VAL = 4'h2;
    localparam [3:0] RESET_VAL = 4'h8;
    
    reg areset_rereg = 0;
    wire reset = !aresetn && !areset_rereg;
    
    assign trig = (s_axi_nfc_tvalid && s_axi_nfc_tdata == 4'h2);
    
    reg trig_and_going_full_seen = 0;
    
    always @(posedge aclk) begin
        areset_rereg <= !aresetn;
    end
    
    localparam FSM_BITS=3;
    localparam [FSM_BITS-1:0] SEND_RESET = 0;
    localparam [FSM_BITS-1:0] IDLE = 1;
    localparam [FSM_BITS-1:0] SEND_NOT_BUSY = 2;
    localparam [FSM_BITS-1:0] SEND_BUSY = 3;
    localparam [FSM_BITS-1:0] WAIT_BUSY = 4;
    reg [FSM_BITS-1:0] state = IDLE;
    
    always @(posedge aclk) begin
        // This is functionally our "busy" state.
        // We only go 'busy' when a trigger comes in, so the "going_full" should be set when there's
        // still space left (which there is, in the buffer network).
        if (reset || state == SEND_BUSY || state == WAIT_BUSY) trig_and_going_full_seen <= 0;
        else if (going_full && trig) trig_and_going_full_seen <= 1;
        
        // we always signal NOT_BUSY 
        if (reset) state <= SEND_RESET;
        else case (state)
            SEND_RESET: if (m_axi_nfc_tready) state <= IDLE;
            IDLE: if (trig_and_going_full_seen) state <= SEND_BUSY;
            SEND_NOT_BUSY: if (m_axi_nfc_tready) state <= IDLE;
            SEND_BUSY: if (m_axi_nfc_tready) state <= WAIT_BUSY;
            WAIT_BUSY: if (!going_full) state <= SEND_NOT_BUSY;
        endcase
    end

    nfc_ila u_nfcila(.clk(aclk),
                     .probe0( aresetn ),
                     .probe1( going_full ),
                     .probe2( state ),
                     .probe3( m_axi_nfc_tready) ,
                     .probe4( s_axi_nfc_tvalid) ,
                     .probe5( s_axi_nfc_tdata),
                     .probe6( trig ) );
    
    
    assign m_axi_nfc_tdata = (state == SEND_RESET) ? RESET_VAL : ((state == SEND_BUSY) ? BUSY_VAL : NOT_BUSY_VAL);
    assign m_axi_nfc_tvalid = (state == SEND_BUSY || state == SEND_NOT_BUSY);
    
endmodule
