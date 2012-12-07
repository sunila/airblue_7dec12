`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module my_serdes_tx
  (   
      // Clocks
      input dsp_clk,
      input dsp_rst,
      
   // guarded input interface 
      input  [15:0] tx_dat_i,
      input  tx_klsb_i,
      input  tx_kmsb_i,
      input  tx_en,     // enq data to tx pipeline (en only when rdy)
      output tx_rdy,    // rdy to tx
      
      
      // SERDES   
      output ser_tx_clk,
      output reg [15:0] ser_t,
      output reg ser_tklsb,
      output reg ser_tkmsb,

      output [7:0] debug
      );

   parameter  FIFOSIZE = 4;
   parameter  CNTR_WIDTH = 2;

   reg [15:0]  switch_countdown; 
   reg         send_comma;
   reg        ser_tklsb_int, ser_tkmsb_int;
   reg [15:0] ser_t_int;
   wire        dsp_rst_n;
   wire [17:0] fifo_d_out;
   wire        fifo_deq_en;
   wire        fifo_deq_rdy;
   reg         parity; // This parity represents the sample level parity
   reg  [1:0]  state;

   localparam SEND_DATA = 0;
   localparam SEND_COMMA = 1;
   localparam SEND_SYNC = 2;   
   
   assign     dsp_rst_n = !dsp_rst;
   assign     ser_tx_clk = dsp_clk;
   
   SizedFIFO #(.p1width(18),
               .p2depth(FIFOSIZE),
               .p3cntr_width(CNTR_WIDTH)) fifo_buf
     (.CLK(dsp_clk),
      .RST_N(dsp_rst_n),
      .CLR(),
      .D_IN({tx_kmsb_i,tx_klsb_i,tx_dat_i}),
      .ENQ(tx_en),
      .FULL_N(tx_rdy),
      .D_OUT(fifo_d_out),
      .DEQ(fifo_deq_en),
      .EMPTY_N(fifo_deq_rdy));   

   assign      fifo_deq_en   = ((state == SEND_DATA) && fifo_deq_rdy);

   always@(*)
     begin
	ser_t_int = {8'd60,8'd60};
	ser_tkmsb_int = 1;
	ser_tklsb_int = 1;
	
	if(state == SEND_SYNC)
	  begin
	     ser_t_int = {8'd156,8'd156};
	    // else do nothing, so as not to confuse other side
	  end
	else if (fifo_deq_en)
	  begin
	     ser_t_int = fifo_d_out[15:0];
	     ser_tkmsb_int = 0;
	     ser_tklsb_int = 0;
	  end
     end // always@ (*)
   
   always @(posedge ser_tx_clk)
     begin
	if(~dsp_rst_n)
	  begin
	     parity <= 0;
	     switch_countdown <= 65535;
	     state <= SEND_DATA;	     
	  end
	else
	  begin	    
	     ser_tklsb <= ser_tklsb_int;
	     ser_tkmsb <= ser_tkmsb_int;
             ser_t     <= ser_t_int;
	     
	     case (state)
	       SEND_DATA:
		 begin		    
		    if(fifo_deq_en)
		      begin
			 parity <= ~parity;
		      end
		    // We can transition if we want
		    if(switch_countdown == 0)
		      begin
			 if((parity == 0) && !fifo_deq_en)
			   begin
			      state <= SEND_COMMA; 
			   end
		      end
		    else
		      begin
			 switch_countdown <= switch_countdown - 1;
    		      end
		 end
	       SEND_SYNC:
		 begin
		    parity <= ~parity;
		    if(parity == 1)
		      begin
			 state <= SEND_DATA;			 
		      end
		    switch_countdown <= 65535;		    
		 end
	       SEND_COMMA:
		 begin
                    parity <= ~parity;
		    if(parity == 1)
		      begin
			 state <= SEND_SYNC;			
		      end
		    switch_countdown <= 65535;		     
		 end
	       default:
		 state <= SEND_DATA;	       
	     endcase
          end
     end

   assign debug = {1'b0, ser_tkmsb_int, ser_tklsb_int, fifo_deq_rdy, 
		   fifo_deq_en, parity, state};
   

endmodule // u2_rev2
