`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////

module pc_add(
    input clk,
    input [31:0] pc_out, //output of program counter connected to input
    output [31:0] pc_4  //output after adding 4 to program counter
    );
    reg [31:0] pc = 32'd0;
    always @ (posedge clk)
    begin
    pc <= pc_out + 3'b100;   // adding 4 to the current value of pc
    end
    assign pc_4 = pc;
endmodule
