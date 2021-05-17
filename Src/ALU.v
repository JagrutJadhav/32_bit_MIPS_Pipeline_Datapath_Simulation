`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//ALU OP codes - 
//001 - add
//010 - sub
//011 - and
//100 - or
//110 - beq 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
input clk,
input [31:0] inp_1,
input [31:0] inp_2,
input [2:0] alu_op,
output [31:0] result,
output zero
    );
    reg [31:0] calc;
    wire [31:0] inp_2_dat;
    reg zero_op = 1'b0;
    reg [31:0] inp_1_dat;
    always @ (posedge clk)
    begin
    inp_1_dat <= inp_1;
    if (alu_op == 3'b001)
     calc <= inp_1_dat + inp_2_dat;
    else if (alu_op == 3'b010)
     calc <= inp_1_dat - inp_2_dat;
    else if (alu_op == 3'b011)
     calc <= inp_1_dat & inp_2_dat;
    else if (alu_op == 3'b100)
     calc <= inp_1_dat | inp_2_dat;
    else if (alu_op == 3'b110)
     zero_op <= (inp_1_dat - inp_2_dat)? 1'b1 : 1'b0;
    else 
    begin
     calc <= 31'dx;
     zero_op <= 1'b0;
    end
    end
    assign inp_2_dat = inp_2;
    assign result = calc;
    assign zero = zero_op; 
endmodule
