`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////

module Program_counter(
input clk,
input [31:0] pc_in,
output [31:0] pc_out
    );
    reg [31:0] add = 32'd0; //set initial address to zero 
    always @ (posedge clk)
    begin
    add <= pc_in; //adding programcounter address to register
    end 
    assign pc_out = add;
endmodule
