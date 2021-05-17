`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module Instruction_memory(
input clk,
input [31:0] pc_out,              //output from program counter 
output reg [31:0] instruction     //output 32 bit instruction from instruction memory
    );
    reg [7:0] IM [63:0];
    initial $readmemh("instru.mem",IM);
    always @ (posedge clk)
    begin
    instruction[7:0]    <= IM[pc_out];      // inserting data from instruction memory
    instruction[15:8]   <= IM[pc_out + 1];
    instruction[23:16]  <= IM[pc_out + 2];
    instruction[31:24]  <= IM[pc_out + 3];
    end
endmodule
