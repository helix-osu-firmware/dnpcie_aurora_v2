`timescale 1ns/1ps
module dnpcie_aurora_reset_v2( input user_clk,
			       input  init_clk,
			       input  buf_refclk,
			       input  ext_reset,
			       output gt_reset,
			       output chan_reset );

   // we're __faster__ than user_clk, so we need to wait longer
   localparam [47:0] GT_RESET_WAIT = 162;
   // Wait to ensure hotplug count expires on link partner.
   localparam [47:0] INIT_CLK_FREQ = 200000000;
      
   reg 				      gt_done_reset = 0;
   reg 				      chan_done_reset = 0;
   assign gt_reset = !gt_done_reset;
   assign chan_reset = !chan_done_reset;

   reg 				      buf_refclk_toggling = 0;
   reg [1:0] 			      buf_refclk_toggling_initclk = {2{1'b0}};

   reg 				      user_clk_toggling = 0;
   reg [1:0] 			      user_clk_toggling_initclk = {2{1'b0}};

   reg 				      reset_toggling = 0;
   always @(posedge init_clk) begin
      reset_toggling <= (state == POWERON || state == POWERON_WAIT_0 || state == POWERON_WAIT_1 || state == RESET_WAIT_ONE_SECOND);
      if (reset_toggling) buf_refclk_toggling_initclk <= 2'b00;
      else buf_refclk_toggling_initclk[1] <= {buf_refclk_toggling_initclk[0], buf_refclk_toggling};

      if (reset_toggling) user_clk_toggling_initclk <= 2'b00;
      else user_clk_toggling_initclk <= { user_clk_toggling_initclk[0], user_clk_toggling };            
   end  
      
   always @(posedge buf_refclk or reset_toggling) begin
      if (reset_toggling) buf_refclk_toggling <= 0;
      else buf_refclk_toggling <= 1'b1;
   end      

   always @(posedge user_clk or reset_toggling) begin
      if (reset_toggling) user_clk_toggling <= 0;
      else user_clk_toggling <= 1;
   end   
   
   localparam FSM_BITS = 3;
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

   
   
endmodule // dnpcie_aurora_reset_v2

