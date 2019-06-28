// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//

//
//  FRAME GEN
//
//
//
//  Description: This module is a pattern generator to test the Aurora
//               designs in hardware. It generates data and passes it
//               through the Aurora channel. If connected to a framing
//               interface, it generates frames of varying size and
//               separation. LFSR is used to generate the pseudo-random
//               data and lower bits of LFSR are connected to REM bus

`timescale 1 ns / 1 ps
`define DLY #1

module aurora_8b10b_FRAME_GEN
(
    // User Interface
    TX_D, 
    TX_REM,    
    TX_SOF_N,      
    TX_EOF_N,
    TX_SRC_RDY_N,
    TX_DST_RDY_N,

    // Native Flow Control Interface
    NFC_REQ_N,
    NFC_NB,
    NFC_ACK_N,  

    // System Interface
    USER_CLK,      
    RESET,
    CHANNEL_UP
);
//*****************************Parameter Declarations****************************
    parameter            NFC_IFG         = 255; //NFC Inter Frame Gap

//***********************************Port Declarations*******************************

   // User Interface
output  [0:31]     TX_D;
output  [0:1]      TX_REM;
output             TX_SOF_N;
output             TX_EOF_N;
output             TX_SRC_RDY_N;
input              TX_DST_RDY_N;

    // Native Flow Control Interface
output             NFC_REQ_N;
output  [0:3]      NFC_NB;
input              NFC_ACK_N;

      // System Interface
input              USER_CLK;
input              RESET; 
input              CHANNEL_UP;

//***************************External Register Declarations***************************

reg                TX_SRC_RDY_N;
reg                TX_SOF_N;
reg                TX_EOF_N;    

//***************************Internal Register Declarations***************************

reg     [0:15]     data_lfsr_r;    
reg     [0:7]      frame_size_r;
reg     [0:7]      bytes_sent_r;
reg     [0:8]      ifg_size_r;
   
    //State registers for one-hot state machine
reg                idle_r;
reg                single_cycle_frame_r;
reg                sof_r;
reg                data_cycle_r;
reg                eof_r;    
   
wire               reset_c;
//*********************************Wire Declarations**********************************
  
wire               ifg_done_c;
   
    //Next state signals for one-hot state machine
wire               next_idle_c;
wire               next_single_cycle_frame_c;
wire               next_sof_c;
wire               next_data_cycle_c;
wire               next_eof_c;

  //State registers for NFC FSM
reg                nfc_ifg_r;
reg                nfc_msg_r;
reg                nfc_xoff_r;
reg                nfc_xoff_nxt_r;
reg                nfc_xon_r;

wire               next_nfc_ifg_c;
wire               next_nfc_msg_c;
wire               next_nfc_xoff_c;
wire               next_nfc_xoff_nxt_c;
wire               next_nfc_xon_c;

   //NFC interface signals
reg                NFC_REQ_N;
reg     [0:3]      nfc_nb_cnt;



    wire       dly_data_xfer;
    reg [4:0]  channel_up_cnt;

//*********************************Main Body of Code**********************************

  always @ (posedge USER_CLK)
  begin
    if(RESET)
        channel_up_cnt <= `DLY 5'd0;
    else if(CHANNEL_UP)
      if(&channel_up_cnt)
        channel_up_cnt <= `DLY channel_up_cnt;
      else 
        channel_up_cnt <= `DLY channel_up_cnt + 1'b1;
    else
      channel_up_cnt <= `DLY 5'd0;
  end

  assign dly_data_xfer = (&channel_up_cnt);

  //Generate RESET signal when Aurora channel is not ready
  assign reset_c = RESET || !dly_data_xfer;

    //______________________________ Transmit Data  __________________________________   
    //Generate random data using XNOR feedback LFSR
    always @(posedge USER_CLK)
        if(reset_c)
        begin
            data_lfsr_r          <=  `DLY    16'hABCD;  //random seed value
        end
        else if(!TX_DST_RDY_N && !idle_r)
        begin
            data_lfsr_r          <=  `DLY    {!{data_lfsr_r[3]^data_lfsr_r[12]^data_lfsr_r[14]^data_lfsr_r[15]},
                                data_lfsr_r[0:14]};
        end
  
 
  
    //Connect TX_D to the DATA LFSR
    assign  TX_D    =   {2{data_lfsr_r}};
  
    //Tie DATA LFSR to REM to generate random words
    assign  TX_REM  = data_lfsr_r[0:1];
  

    //Use a counter to determine the size of the next frame to send
    always @(posedge USER_CLK)
        if(reset_c)  
            frame_size_r    <=  `DLY    8'h00;
        else if(single_cycle_frame_r || eof_r)
            frame_size_r    <=  `DLY    frame_size_r + 1;
           
    //Use a second counter to determine how many bytes of the frame have already been sent
    always @(posedge USER_CLK)
        if(reset_c)
            bytes_sent_r    <=  `DLY    8'h00;
        else if(sof_r)
            bytes_sent_r    <=  `DLY    8'h01;
        else if(!TX_DST_RDY_N && !idle_r)
            bytes_sent_r    <=  `DLY    bytes_sent_r + 1;
   
   
    //Use a freerunning counter to determine the IFG
    always @(posedge USER_CLK)
        if(reset_c)
            ifg_size_r      <=  `DLY    9'h0;
        else
            ifg_size_r      <=  `DLY    ifg_size_r + 1;
           
   
    //IFG is done when ifg_size register is 0
    assign  ifg_done_c  =   (ifg_size_r[6:8] == 3'h0);
   
    //_____________________________ Framing State machine______________________________
    //Use a state machine to determine whether to start a frame, end a frame, send
    //data or send nothing
   
    //State registers for 1-hot state machine
    always @(posedge USER_CLK)
        if(reset_c)
        begin
            idle_r                  <=  `DLY    1'b1;
            single_cycle_frame_r    <=  `DLY    1'b0;
            sof_r                   <=  `DLY    1'b0;
            data_cycle_r            <=  `DLY    1'b0;
            eof_r                   <=  `DLY    1'b0;
        end
        else if(!TX_DST_RDY_N)
        begin
            idle_r                  <=  `DLY    next_idle_c;
            single_cycle_frame_r    <=  `DLY    next_single_cycle_frame_c;
            sof_r                   <=  `DLY    next_sof_c;
            data_cycle_r            <=  `DLY    next_data_cycle_c;
            eof_r                   <=  `DLY    next_eof_c;
        end
       
       
    //Nextstate logic for 1-hot state machine
    assign  next_idle_c                 =   !ifg_done_c &&
                                            (single_cycle_frame_r || eof_r || idle_r);
   
    assign  next_single_cycle_frame_c   =   (ifg_done_c && (frame_size_r == 0)) &&
                                            (idle_r || single_cycle_frame_r || eof_r);
                                           
    assign  next_sof_c                  =   (ifg_done_c && (frame_size_r != 0)) &&
                                            (idle_r || single_cycle_frame_r || eof_r);
                                           
    assign  next_data_cycle_c           =   (frame_size_r != bytes_sent_r) &&
                                            (sof_r || data_cycle_r);
                                           
    assign  next_eof_c                  =   (frame_size_r == bytes_sent_r) &&
                                            (sof_r || data_cycle_r);
   
   
    //Output logic for 1-hot state machine
    always @(posedge USER_CLK)
        if(reset_c)
        begin
            TX_SOF_N        <=  `DLY    1'b1;
            TX_EOF_N        <=  `DLY    1'b1;
            TX_SRC_RDY_N    <=  `DLY    1'b1;   
        end
        else if(!TX_DST_RDY_N)
        begin
            TX_SOF_N        <=  `DLY    !(sof_r || single_cycle_frame_r);
            TX_EOF_N        <=  `DLY    !(eof_r || single_cycle_frame_r);
            TX_SRC_RDY_N    <=  `DLY    idle_r;
        end  
        
   
 /*************************** NFC data generation *********************************/

    //NFC State machine
    always @(posedge USER_CLK)
      if(reset_c)
        begin
            nfc_ifg_r                <=  `DLY    1'b1;
            nfc_msg_r                <=  `DLY    1'b0;
            nfc_xoff_r               <=  `DLY    1'b0;
            nfc_xoff_nxt_r           <=  `DLY    1'b0;
            nfc_xon_r                <=  `DLY    1'b0;
        end
      else
        begin
            nfc_ifg_r                <=  `DLY    next_nfc_ifg_c;
            nfc_msg_r                <=  `DLY    next_nfc_msg_c;
            nfc_xoff_r               <=  `DLY    next_nfc_xoff_c;
            nfc_xoff_nxt_r           <=  `DLY    next_nfc_xoff_nxt_c;
            nfc_xon_r                <=  `DLY    next_nfc_xon_c;
        end
	
  //NFC Inter frame gap specified by NFC_IFG parameter			
  assign next_nfc_ifg_c       = (nfc_msg_r && !NFC_ACK_N) || 
                                (nfc_ifg_r && !(ifg_size_r==NFC_IFG));

  //Send NFC_NB value along with NFC_REQ_N
  assign next_nfc_msg_c       = (nfc_xon_r && !NFC_ACK_N) ||
	                        (nfc_ifg_r && (ifg_size_r==NFC_IFG) && !(nfc_nb_cnt==4'd9)) ||
                                (nfc_msg_r && NFC_ACK_N);

  //NFC XOFF mode. Placing NFC_REQ_N signal   			
  assign next_nfc_xoff_c      = (nfc_ifg_r && (ifg_size_r==NFC_IFG) && (nfc_nb_cnt==4'd9)) ||
                                (nfc_xoff_r && NFC_ACK_N);

  //IFG is created when NFC FSM is in XOFF mode			
  assign next_nfc_xoff_nxt_c  = (nfc_xoff_r && !NFC_ACK_N) ||
                                (nfc_xoff_nxt_r && !(ifg_size_r==NFC_IFG));

  //NFC XON Mode. Placing NFC_REQ_N signal  	
  assign next_nfc_xon_c       = (nfc_xoff_nxt_r && (ifg_size_r==NFC_IFG)) ||
                                (nfc_xon_r && NFC_ACK_N);

  //Counter for NFC_NB.
  //NFC_NB = 0000 --> XON mode
  //NFC_NB = 1111 --> XOFF mode
  //NFC_NB = 1001 to 1110 --> reserved
  always @ (posedge USER_CLK)
    if(reset_c)
      nfc_nb_cnt     <= `DLY  4'd1;
    else if(nfc_xoff_r)
      nfc_nb_cnt     <= `DLY  4'd15;
    else if(!NFC_ACK_N)
      nfc_nb_cnt     <= `DLY  nfc_nb_cnt + 1;
    else if(nfc_xon_r)
      nfc_nb_cnt     <= `DLY  4'd0;
   
  //Send NFC PAUSE Value while it is in NFC XON mode otherwise send zeros
  assign NFC_NB = nfc_nb_cnt;

  //Logic for NFC_REQ_N signal
  always @ (posedge USER_CLK)
    if(reset_c || (!NFC_ACK_N))
      NFC_REQ_N     <= `DLY  1'b1;
    else if(nfc_xon_r || nfc_msg_r || nfc_xoff_r)
      NFC_REQ_N     <= `DLY  1'b0;

               

endmodule
