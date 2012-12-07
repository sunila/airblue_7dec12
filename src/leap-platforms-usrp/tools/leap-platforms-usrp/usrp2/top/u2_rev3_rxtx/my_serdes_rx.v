`define DSP_CORE_TX_BASE 128

module my_serdes_rx
    (
        // Clocks
        input dsp_clk,
        input dsp_rst,
        input set_stb, input [7:0] set_addr, input [31:0] set_data,
     
        // guarded input interface
        output [31:0] tx_data,
        output [3:0] tx_flags,
        input  tx_pop_en,
        output tx_pop_rdy, 

        // SERDES
        input ser_rx_clk,
        input [15:0] ser_r,
        input ser_rklsb,
        input ser_rkmsb,
        output [31:0] debug
     );

   wire 	   tx_data_pop_rdy, tx_flags_pop_rdy;
   wire [1:0] 	   tx_ctrl; // Denotes the control nature of this symbol 	   
   wire            rdy_ctrl, rdy_data;
   reg             enq_enable;
   wire [31:0] 	   sw_enable;
  //  2 4 1 1 16 = 24 
   wire [15:0] 	   ser_r_reg;
   wire  	   ser_rklsb_reg;   
   wire		   ser_rkmsb_reg;
   wire dsp_rst_n; 
   assign     dsp_rst_n = ~dsp_rst;

   
   assign tx_pop_rdy = tx_data_pop_rdy && tx_flags_pop_rdy;
   assign tx_flags = {2'b0,tx_ctrl[0]&tx_ctrl[1],1'b0}; // Assemble the flags

  

   
// gotta solve rst issue
 /*  always@(posedge ser_rx_clk or negedge dsp_rst)
     begin
	if(dsp_rst)
	  begin
	     dsp_rst_n <= 0;
	     hold <= 0;	     
	  end
	else
	  begin
	     if(hold == 2'b11)
	       begin
   		  dsp_rst_n <= 1;
	       end
	     else
	       begin
		  hold <= hold + 1;		 
	       end
	  end
     end*/

  byte_align ba
  (   
   .ser_rx_clk_i(ser_rx_clk),
   .ser_rx_rst_n(dsp_rst_n),
   .ser_r_i(ser_r),
   .ser_rklsb_i(ser_rklsb),
   .ser_rkmsb_i(ser_rkmsb),
   .ser_r_o(ser_r_reg),
   .ser_rklsb_o(ser_rklsb_reg),
   .ser_rkmsb_o(ser_rkmsb_reg)
  );

   

   
   mkFIFO16to32ToCC datafifo(.CLK_sClk(ser_rx_clk),
			     .RST_N_sRst(dsp_rst_n),
			     .CLK(dsp_clk),
			     .RST_N(dsp_rst_n),
			     .enq_bits(ser_r_reg),
			     .EN_enq(enq_enable),
			     .RDY_enq(rdy_data), //Should be always ready
			     .EN_pop(tx_pop_en),
			     .pop(tx_data),
			     .RDY_pop(tx_data_pop_rdy));


   mkFIFO1to2ToCC ctrlfifo(.CLK_sClk(ser_rx_clk),
			   .RST_N_sRst(dsp_rst_n),
			   .CLK(dsp_clk),
			   .RST_N(dsp_rst_n),
			   .enq_bits(ser_rklsb_reg && ser_rkmsb_reg),
			   .EN_enq(enq_enable),
			   .RDY_enq(rdy_ctrl), //Should be always ready
			   .EN_pop(tx_pop_en),
			   .pop(tx_ctrl),
			   .RDY_pop(tx_flags_pop_rdy));

/*   reg [15:0] 	   packetCount;
   
   always@(posedge dsp_clk)
     begin
	packetCount <= packetCount;
	
	if(dsp_rst)
	  begin
             packetCount <= 0;	   
	  end
	else
	  begin
	     if((tx_data == {8'd124,8'd124,8'd124,8'd124}) && (tx_ctrl[0] == 1) && 
                (tx_ctrl[1] == 1) && (tx_pop_en) && (tx_flags_pop_rdy))
	       begin
		  packetCount <= packetCount + 1;
	       end
	  end
     end

 	*/						 

   // We seem to need to re-synchronize ourselves occasionally
   reg 		   odd_parity;
   reg [3:0]	   odd_parity_past;
 
   
   always@(posedge ser_rx_clk)
     begin
	if(~dsp_rst_n)
	  begin
             odd_parity <= 0;
	  end
	else
	  begin
	     odd_parity_past <= {odd_parity_past[2:0],odd_parity};
 
	     if(enq_enable)
	       begin
		  odd_parity <= !odd_parity;		  
	       end
	     else
	       begin
		  odd_parity <= odd_parity;		  
	       end
	  end
     end
 
   // No state here - pure combinational function.
   // We could possibly introduce
   
   always@(*)
     begin
        if((((ser_rklsb_reg == 1) && (ser_rkmsb_reg == 1) && (ser_r_reg[7:0] == {8'd124}) && (ser_r_reg[15:8] == {8'd124})) ||
	   ((ser_rklsb_reg == 1) && (ser_rkmsb_reg == 1) && (ser_r_reg[7:0] == {8'd156}) && (ser_r_reg[15:8] == {8'd156}) && (odd_parity)) || // This one will fix odd parity 
           ((ser_rklsb_reg == 0) && (ser_rkmsb_reg == 0)))
            && rdy_ctrl && rdy_data)
          begin
             enq_enable = 1;
//sw_enable[0]; // did sw turn us on?
	  end
        else
	  begin
             enq_enable = 0;
	  end
     end

   assign debug = {8'b0,rdy_ctrl,odd_parity, rdy_data, enq_enable, ser_rkmsb_reg, ser_rklsb_reg, tx_pop_en, tx_pop_rdy, ser_r_reg} ;
   
endmodule

   