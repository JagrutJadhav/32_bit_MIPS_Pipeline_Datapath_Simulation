`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module ID_EX(
input clk,
input [31:0] PC_pass,
input we_control,
input [1:0] mem_control,
input [4:0] exe_control,
input [31:0] reg_1,
input [31:0] reg_2,
input [31:0] sign_ext,
input [4:0] rt,
input [4:0] rd,
output [31:0] PC_pass_out,
output we_control_out,
output [1:0] mem_control_out,
output [2:0] exe_control_alu,
output  alu_src,
output  reg_dst,
output [31:0] reg_1_out,
output [31:0] reg_2_out,
output [31:0] sign_ext_out,
output [4:0] rt_out,
output [4:0] rd_out
    );
   reg [31:0] reg_2_d; 
   reg [145:0] buffer;
   reg [4:0] rt_buff;
   reg [4:0] rd_buff;
   reg [31:0] pc_pass_buff;
   always @ (posedge clk)
   begin
    rt_buff <= rt;
    rd_buff <= rd;
    reg_2_d <= reg_2;
    pc_pass_buff <= PC_pass;
    buffer <= {we_control,mem_control,exe_control,reg_1,reg_2_d,pc_pass_buff,sign_ext,rt_buff,rd_buff};
   end
assign  we_control_out = buffer[145];        
assign mem_control_out = buffer[144:143];
assign exe_control_alu = buffer[142:140];
assign alu_src = buffer[139];
assign reg_dst = buffer[138];
assign reg_1_out = buffer[137:106];
assign reg_2_out = buffer[105:74];//reg_2;
assign PC_pass_out = buffer[73:42];
assign sign_ext_out = buffer[41:10];
assign rt_out = buffer[9:5];
assign rd_out = buffer[4:0];
endmodule
