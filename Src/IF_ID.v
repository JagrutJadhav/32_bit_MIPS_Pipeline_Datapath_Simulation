`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module IF_ID(
input clk,
input [31:0] pc_4,
input [31:0] instruction,
output [31:0] IF_out_pc_4,
output [5:0] opcode,       //output of 6 bit opcode
output [4:0] rs,           
output [4:0] rt,
output [4:0] rd,
output [4:0] shant,
output [5:0] funct,
output [15:0] imm_add
    );
    
    reg [31:0] IF_ID;
    reg [31:0] pc_IF;
    always @(posedge clk)
    begin
    IF_ID <= instruction;
    pc_IF <= pc_4;
    end
    // dividing the bits to decode the instruction
    assign opcode = IF_ID[31:26];
    assign rs = IF_ID[25:21];
    assign rt = IF_ID[20:16];
    assign rd = IF_ID[15:11];
    assign shant = IF_ID[10:6];
    assign funct = IF_ID[5:0];
    assign imm_add = {rd,shant,funct};
    assign IF_pc_4 = pc_IF;
endmodule
