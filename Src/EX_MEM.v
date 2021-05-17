`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module EX_MEM(
input clk,
input we_control,
input [1:0] mem_control,
input [31:0] add_branch,
input zero,
input [31:0] result,
input [31:0] write_data,
input [4:0] reg_dst,
output we_control_out,
output mem_control_rd,
output mem_control_wr,
output [31:0] add_branch_out,
output zero_out,
output [31:0] result_out,
output [31:0] write_data_out,
output [4:0] reg_dst_out
    );
    
    reg [104:0] buffer_ex;
    reg we_control_buff;
    reg [1:0] mem_control_buff;
    reg [31:0] write_data_buff;
    reg [4:0] reg_dst_buff;
    always @ (posedge clk)
    begin
    we_control_buff <= we_control;
    mem_control_buff <= mem_control;
    write_data_buff <= write_data;
    reg_dst_buff <= reg_dst;
     buffer_ex <= {we_control_buff,mem_control_buff,add_branch,zero,result,write_data_buff,reg_dst_buff};
    end
assign we_control_out = buffer_ex [104];   
assign mem_control_rd = buffer_ex [103];
assign mem_control_wr = buffer_ex [102];
assign add_branch_out = buffer_ex [101 : 70];
assign zero_out = buffer_ex [69];
assign result_out = buffer_ex [68:37];
assign write_data_out = buffer_ex [36:5];
assign reg_dst_out = buffer_ex [4:0];
endmodule
