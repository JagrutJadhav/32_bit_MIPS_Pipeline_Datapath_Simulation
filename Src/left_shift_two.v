`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module left_shift_two(
input [31:0] sign_ext,
output [31:0] left_shift
    );  
    
    assign left_shift = sign_ext << 2;
endmodule