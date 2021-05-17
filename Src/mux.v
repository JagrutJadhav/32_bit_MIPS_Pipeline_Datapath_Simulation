`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module mux #(parameter inp = 32)
(
input sel,
input [inp-1 : 0] data_in_1,
input [inp-1 : 0] data_in_2,
output [inp-1 : 0] data_out 
    );
    
    assign data_out = (sel)? data_in_2 : data_in_1;
endmodule
