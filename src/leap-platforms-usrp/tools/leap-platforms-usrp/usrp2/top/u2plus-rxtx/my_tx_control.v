
`define DSP_CORE_TX_BASE 128

module my_tx_control
  #(parameter FIFOSIZE = 10)
    (input clk, input rst,
     input set_stb, input [7:0] set_addr, input [31:0] set_data,
     
     input [31:0] master_time, 
     output underrun,
     
     // To FIFO interface from Buffer Pool
     input [31:0] rd_dat_i,
     input [3:0] rd_flags_i,
     input rd_ready_i,
     output rd_ready_o,
     
     // To DSP Core
     output [31:0] sample,
     output run,
     input strobe,

     // FIFO Levels
     output [15:0] fifo_occupied,
     output fifo_full,
     output fifo_empty,

     // Debug
     output [31:0] debug, 
     output reg [15:0] packetLength
     );

   wire 	   rd_sop_i  = rd_flags_i[0];  // Unused
   wire 	   rd_eop_i  = rd_flags_i[1];
   wire 	   rd_occ_i = rd_flags_i[3:2]; // Unused, should always be 0

   // Buffer interface to internal FIFO
   wire     write_data, write_ctrl, full_data, full_ctrl;
   wire     read_data, read_ctrl, empty_data, empty_ctrl;
   reg      clear_state;
   reg [1:0] xfer_state;
   reg [2:0] held_flags;


   
   
   localparam XFER_IDLE = 0;
   localparam XFER_CTRL = 1;
   localparam XFER_PKT = 2;
   // Add underrun state?
   
   always @(posedge clk)
     if(rst)
       xfer_state <= XFER_IDLE;
     else if(clear_state)
       xfer_state <= XFER_IDLE;
     else
       if(rd_ready_i & rd_ready_o)
	 case(xfer_state)
	   XFER_IDLE :
	     begin
		held_flags <= rd_dat_i[2:0];
		if(rd_dat_i[31:16] == 16'hdead)
		  begin
		     xfer_state <= XFER_CTRL;
		  end
	     end
   	   XFER_CTRL :
	     if(rd_dat_i[31:16] == 16'hcafe)
	       begin
		  xfer_state <= XFER_PKT;
	       end
	     else
	       begin
		  xfer_state <= XFER_IDLE;
	       end
	   XFER_PKT :
	     if(rd_eop_i)
	       xfer_state <= XFER_IDLE;
	 endcase // case(xfer_state)

   wire have_data_space;
   assign full_data   = ~have_data_space;
   
   assign write_data  = (xfer_state == XFER_PKT) & rd_ready_i & rd_ready_o;

   assign rd_ready_o  = ~full_data & rd_ready_i & ~clear_state; // need to follow bluespec protocol
   
   wire [31:0] data_o;
   wire        eop_o, eob, sob, send_imm;
   wire [31:0] sendtime;
   wire [4:0]  occ_ctrl;
/*   
   cascadefifo2 #(.WIDTH(33),.SIZE(FIFOSIZE)) txctrlfifo
     (.clk(clk),.rst(rst),.clear(clear_state),
      .datain({rd_eop_i,rd_dat_i[31:0]}), .write(write_data), .full(full_data),
      .dataout({eop_o,data_o}), .read(read_data), .empty(empty_data),
      .space(), .occupied(fifo_occupied) );
*/
   wire        have_data;
   assign empty_data  = ~have_data;
   
   fifo_cascade #(.WIDTH(33),.SIZE(FIFOSIZE)) txctrlfifo
     (.clk(clk),.reset(rst),.clear(clear_state),
      .datain({rd_eop_i,rd_dat_i[31:0]}), .src_rdy_i(write_data), .dst_rdy_o(have_data_space),
      .dataout({eop_o,data_o}), .src_rdy_o(have_data), .dst_rdy_i(read_data),
      .space(), .occupied(fifo_occupied) );
   assign      fifo_full = full_data;
   assign      fifo_empty = empty_data;

   // Internal FIFO to DSP interface
   reg [2:0]   ibs_state;
   
   localparam  IBS_IDLE = 0;
   localparam  IBS_WAIT = 1;
   localparam  IBS_RUNNING = 2;
   localparam  IBS_CONT_BURST = 3;
   localparam  IBS_UNDERRUN = 7;

   always @(posedge clk)
     if(rst)
       begin
	  packetLength <= 0;
	  ibs_state <= IBS_IDLE;
	  clear_state <= 0;	  
       end
     else 
       case(ibs_state)
	 IBS_IDLE :
	   begin
	      clear_state <= 0;	      
	      packetLength <= 0;       	      
	      if(~empty_data & ~clear_state)	      
		ibs_state <= IBS_WAIT;
	   end
	 IBS_WAIT :
	     ibs_state <= IBS_RUNNING;
	 IBS_RUNNING :
	   if(strobe)
	     if(empty_data)
	       ibs_state <= IBS_UNDERRUN; // This can happen but is bad
	     else if(eop_o)
	       begin
		  packetLength <= packetLength + 1;		    
		  ibs_state <= IBS_IDLE;		
	       end
	 IBS_UNDERRUN :   // FIXME Should probably clean everything out
	   begin
	      ibs_state <= IBS_IDLE;
	      clear_state <= 1; // Something bad happened... reset ourselves
	   end
       endcase // case(ibs_state)

   assign      read_data = (ibs_state == IBS_RUNNING) & strobe & ~empty_data;
   assign      run = (ibs_state == IBS_RUNNING);
   assign      underrun = 0;
   assign      underrun_dbg = ibs_state == IBS_UNDERRUN ; 
   assign      underrun = 0;

   wire [7:0]  interp_rate;

   assign      sample = (ibs_state == IBS_RUNNING)?data_o:0; // zero things out when not running...

/*   assign      debug = { {12'b0}, 
	
			 { occ_ctrl, eop_o, clear_state, underrun},
         		 { read_data, write_data, read_ctrl, write_ctrl, xfer_state[1:0],full_ctrl,empty_ctrl },
                         full_data, ibs_state };*/
                   //        1       1           1    1      2             3       1            1       1 =  12
   assign debug = {20'b0,rd_eop_i,underrun_dbg,eop_o,eob, xfer_state, ibs_state,full_data,clear_state,read_data};
   
   
endmodule // tx_control
