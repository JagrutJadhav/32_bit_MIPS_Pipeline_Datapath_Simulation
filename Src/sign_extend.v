`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module sign_extend(
input clk,
input [15:0] imm_add,
output [31:0] imm_add_ext
    );
integer i;  
reg [15:0] ext_l; 
reg [15:0] ext_h; 
wire bit;
    always @ (posedge clk) 
   begin
    ext_l <= imm_add;
    for (i = 0 ; i< 16; i=i+1)
    begin
       ext_h[i] <=  bit;
    end
   end
   assign bit = imm_add[15];
   assign imm_add_ext = {ext_h,ext_l};
endmodule
