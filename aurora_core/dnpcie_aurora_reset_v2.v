`timescale 1ns/1ps
// Second version of the Aurora reset.
// This one tacks on a programmable-length
// wait for GT reset assertion.
// hotplug_wait_i is 48 bits, but we only use the middle 16 bits
// which is pretty ideal, as it's an 0.3 ms tick.
// So low bits are all 1, high bits are all 0.
`define DLYFF #1
module dnpcie_aurora_reset_v2( input        user_clk,
			       input 	    init_clk,
			       input 	    buf_refclk,
			       input 	    ext_reset,
			       input [47:0] hotplug_wait_i,
			       
			       output 	    gt_reset,
			       output 	    chan_reset,
			       output 	    reset_busy );

   // we're __faster__ than user_clk, so we need to wait longer
   localparam [47:0] GT_RESET_WAIT = 162;
   // Wait to ensure hotplug count expires on link partner.
   localparam [47:0] INIT_CLK_FREQ = 200000000;

   wire 			      buf_refclk_toggling;
   (* ASYNC_REG = "TRUE" *)
   reg [1:0] 			      buf_refclk_toggling_initclk = {2{1'b0}};

   wire 			      user_clk_toggling;
   (* ASYNC_REG = "TRUE" *)
   reg [1:0] 			      user_clk_toggling_initclk = {2{1'b0}};

   (* ASYNC_REG = "TRUE" *)
   reg [1:0] 			      chan_reset_initclk = {2{1'b0}};			      
   
   reg 				      reset_toggling = 0;

   // This is asynchronous, it **must** be registered.
   reg 			          set_chan_reset = 0;
   wire 			      clear_chan_reset;
   
   reg                    clear_chan_reset_initclk = 0;
   (* ASYNC_REG = "TRUE" *)
   reg [1:0]              clear_chan_reset_userclk = {2{1'b0}};

   // this is synchronous, so it can be combinatoric
   wire                   set_gt_reset;
   // this is synchronous, so it can be combinatoric
   wire                   clear_gt_reset;
   
   wire 			      count_to_gt_reset;
   wire 			      gt_reset_wait_reached;
   
   wire 			      count_to_hp_reset;
   wire 			      hp_reset_wait_reached;
   
   // Just... use primitives to make it more obvious.
   FDCE u_bufrefclk_indicator(.D(1'b1),.C(buf_refclk),.CE(1'b1),.CLR(reset_toggling),.Q(buf_refclk_toggling));
   FDCE u_userclk_indicator(.D(1'b1),.C(user_clk),.CE(1'b1),.CLR(reset_toggling),.Q(user_clk_toggling));
   FDPE #(.INIT(1'b1)) u_chanreset(.D(1'b0),.C(user_clk),.CE(clear_chan_reset),.PRE(set_chan_reset),.Q(chan_reset));
   FDSE #(.INIT(1'b1)) u_gtreset(.D(1'b0),.C(init_clk),.CE(clear_gt_reset),.S(set_gt_reset),.Q(gt_reset));   
							   
   localparam FSM_BITS = 4;
   localparam [FSM_BITS-1:0] POWERON = 0;   
   localparam [FSM_BITS-1:0] POWERON_WAIT_0 = 1;
   localparam [FSM_BITS-1:0] POWERON_WAIT_1 = 2;
   localparam [FSM_BITS-1:0] POWERON_WAIT_2 = 3;   
   localparam [FSM_BITS-1:0] WAIT_POWERON_REFCLK = 4;
   localparam [FSM_BITS-1:0] WAIT_POWERON_0 = 5;
   localparam [FSM_BITS-1:0] WAIT_POWERON_1 = 6;
   localparam [FSM_BITS-1:0] WAIT_POWERON_2 = 7;
   localparam [FSM_BITS-1:0] WAIT_POWERON_USERCLK = 8;
   localparam [FSM_BITS-1:0] WAIT_POWERON_USERCLK_DONE = 9;   
   localparam [FSM_BITS-1:0] READY = 10;
   localparam [FSM_BITS-1:0] RESET_START = 11;
   localparam [FSM_BITS-1:0] RESET_WAIT_TO_GTRESET = 12;
   localparam [FSM_BITS-1:0] RESET_WAIT_ONE_SECOND = 13;
   localparam [FSM_BITS-1:0] WAIT_USERCLK = 14;
   localparam [FSM_BITS-1:0] WAIT_USERCLK_DONE = 15;
   (* safe_fsm_state = "default_state" *)
   reg [FSM_BITS-1:0] state = POWERON;
   always @(posedge init_clk) begin
      // clear the toggling detectors
      reset_toggling <= (state == POWERON || state == POWERON_WAIT_0 || state == POWERON_WAIT_1 || state == RESET_WAIT_ONE_SECOND);

      // CDC
      if (reset_toggling) buf_refclk_toggling_initclk <= `DLYFF 2'b00;
      else buf_refclk_toggling_initclk[1] <= `DLYFF {buf_refclk_toggling_initclk[0], buf_refclk_toggling};
      // CDC
      if (reset_toggling) user_clk_toggling_initclk <= `DLYFF 2'b00;
      else user_clk_toggling_initclk <= `DLYFF { user_clk_toggling_initclk[0], user_clk_toggling };
      // CDC
      chan_reset_initclk <= `DLYFF { chan_reset_initclk[0], chan_reset };      

      // State machine
      case (state)
	POWERON: state <= `DLYFF POWERON_WAIT_0;
	POWERON_WAIT_0: state <= `DLYFF POWERON_WAIT_1;
	POWERON_WAIT_1: state <= `DLYFF POWERON_WAIT_2;
	POWERON_WAIT_2: state <= `DLYFF WAIT_POWERON_REFCLK;
	WAIT_POWERON_REFCLK: if (buf_refclk_toggling_initclk[1]) state <= `DLYFF WAIT_POWERON_0;
	WAIT_POWERON_0: state <= `DLYFF WAIT_POWERON_1;
	WAIT_POWERON_1: state <= `DLYFF WAIT_POWERON_2;
	WAIT_POWERON_2: state <= `DLYFF WAIT_POWERON_USERCLK;
	WAIT_POWERON_USERCLK: if (user_clk_toggling_initclk[1]) state <= `DLYFF WAIT_POWERON_USERCLK_DONE;
	WAIT_POWERON_USERCLK_DONE: if (!chan_reset_initclk[1]) state <= `DLYFF READY;
	READY: if (ext_reset) state <= `DLYFF RESET_START;
	RESET_START: state <= `DLYFF RESET_WAIT_TO_GTRESET;
	RESET_WAIT_TO_GTRESET: if (gt_reset_wait_reached) state <= `DLYFF RESET_WAIT_ONE_SECOND;
	RESET_WAIT_ONE_SECOND: if (hp_reset_wait_reached) state <= `DLYFF WAIT_USERCLK;
	WAIT_USERCLK: if (user_clk_toggling_initclk[1]) state <= `DLYFF WAIT_USERCLK_DONE;
	WAIT_USERCLK_DONE: if (!chan_reset_initclk[1]) state <= `DLYFF READY;
      endcase // case (state)
      
      clear_chan_reset_initclk <= `DLYFF (state == WAIT_POWERON_USERCLK_DONE) || (state == WAIT_USERCLK_DONE);
      
      // chan_reset *starts* at 1, so we only need to set it during a live reset
      // this is async, it *must* be registered in a flop
      set_chan_reset <= (state == RESET_START);
   end // always @ (posedge init_clk)
   
   always @(posedge user_clk) begin
    // CDC
    clear_chan_reset_userclk <= `DLYFF {clear_chan_reset_userclk[0], clear_chan_reset_initclk};
   end
   assign clear_chan_reset = clear_chan_reset_userclk[1];
   
   dsp_counter_terminal_count #(.FIXED_TCOUNT("TRUE"),.FIXED_TCOUNT_VALUE(GT_RESET_WAIT))
       u_gt_reset_counter(.clk_i(init_clk),.rst_i(!count_to_gt_reset),.count_i(count_to_gt_reset),
			  .tcount_i(),
			  .update_tcount_i(),
			  .tcount_reached_o(gt_reset_wait_reached));
   dsp_counter_terminal_count #(.FIXED_TCOUNT("FALSE"),.RESET_TCOUNT_AT_RESET("FALSE"))
       u_hp_reset_counter(.clk_i(init_clk),.rst_i(!count_to_hp_reset),.count_i(count_to_hp_reset),
			  .tcount_i(hotplug_wait_i),
			  .update_tcount_i(state == RESET_START),
			  .tcount_reached_o(hp_reset_wait_reached));
   
   assign count_to_gt_reset = (state == RESET_WAIT_TO_GTRESET);
   assign count_to_hp_reset = (state == RESET_WAIT_ONE_SECOND);
   assign reset_busy = (state != READY);
   
   // gt_reset *starts* at 1, so we only need to set it during a live reset
   assign set_gt_reset = (state == RESET_WAIT_TO_GTRESET && gt_reset_wait_reached);
   // Clear gt_reset right before waiting for user clk
   assign clear_gt_reset = (state == WAIT_POWERON_REFCLK && buf_refclk_toggling_initclk[1]) || (state == RESET_WAIT_ONE_SECOND && hp_reset_wait_reached);
            
endmodule // dnpcie_aurora_reset_v2

