`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module MEM_WB(
input clk,
input we_control,
input [31:0] read_data,
input [31:0] result,
input [4:0] reg_dst,
output we_control_out,
output [31:0] read_data_out,
output [31:0] result_out,
output [4:0] reg_dst_out
    );
    reg [69:0] buffer_wb;
    reg we_control_buff;
    reg [31:0] result_buff;
    reg [4:0] reg_dst_buff;
    always @ (posedge clk)
    begin
      we_control_buff <= we_control;
      result_buff <= result ;
      reg_dst_buff <= reg_dst;
      buffer_wb <= {we_control_buff,read_data,result_buff,reg_dst_buff}; 
    end
assign we_control_out = !(buffer_wb[69]);
assign read_data_out= buffer_wb[68:37];
assign result_out = buffer_wb[36:5];
assign  reg_dst_out = buffer_wb[4:0];  
   
endmodule
