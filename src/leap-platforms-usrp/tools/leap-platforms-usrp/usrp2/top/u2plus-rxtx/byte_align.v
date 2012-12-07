`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module byte_align
  (   
   input ser_rx_clk_i,
   input ser_rx_rst_n,
   input [15:0] ser_r_i,
   input ser_rklsb_i,
   input ser_rkmsb_i,

   output [15:0] ser_r_o,
   output ser_rklsb_o,
   output ser_rkmsb_o
      );

   reg  [15:0] ser_r_int;
   reg 	       ser_rklsb_int, ser_rkmsb_int;
   reg         rx_odd_aligned;
   reg  last_rklsb;
   reg  last_rkmsb;
   reg  [15:0] last_rxdata;
   wire [1:0]  rxcharisk0_i;
   wire [15:0] rx_odd_aligned_data;
   wire [15:0] rx_aligned_data;
   wire [15:0] rxdata0_i;
   wire [1:0] rx_aligned_charisk ;

   
   assign rxdata0_i = ser_r_int;
   assign rxcharisk0_i = {ser_rkmsb_int, ser_rklsb_int}; 
  // assign rx_odd_aligned_data = {last_rxdata[7:0],ser_r_int[15:8]};
  // assign rx_odd_aligned_charisk = {last_rklsb,  ser_rkmsb_int};
   assign rx_odd_aligned_data = {ser_r_int[7:0],last_rxdata[15:8]};
   assign rx_odd_aligned_charisk = {  ser_rklsb_int, last_rkmsb};
   assign rx_aligned_data = (rx_odd_aligned == 1'b1) ? rx_odd_aligned_data : rxdata0_i;
   assign rx_aligned_charisk = (rx_odd_aligned == 1'b1) ? rx_odd_aligned_charisk : rxcharisk0_i;
   assign ser_r_o = rx_aligned_data;
   assign ser_rklsb_o = rx_aligned_charisk[0];
   assign ser_rkmsb_o = rx_aligned_charisk[1];

   always @(posedge ser_rx_clk_i)
     begin
        if (!ser_rx_rst_n)
          begin
             rx_odd_aligned <= 0;
          end
        else
          begin
             ser_r_int <= ser_r_i;
	     ser_rklsb_int <= ser_rklsb_i;
	     ser_rkmsb_int <= ser_rkmsb_i;
             last_rklsb <= ser_rklsb_int;
	     last_rkmsb <= ser_rkmsb_int;
	     last_rxdata <= ser_r_int;
	     
             if (rxcharisk0_i == 2'b11 && rxdata0_i == 16'h3C3C) // assume comma is only 3C
               begin
                  rx_odd_aligned <= 1'b0;
               end
             else
               if (rxcharisk0_i == 2'b01 && rxdata0_i[7:0] == 8'h3c)
                 begin
                    rx_odd_aligned <= 1'b1;
                 end
               else
                 begin
                    rx_odd_aligned <= rx_odd_aligned;
                 end
          end
     end

endmodule // u2_rev2
