`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////

module add_ex(
input clk,
input [31:0] pc_in,
input [31:0] shift_in,
output [31:0] add
    );
    reg [31:0] addition;
    always @ (posedge clk)
    begin
        addition <= pc_in + shift_in;
    end
    assign add = addition;
endmodule
