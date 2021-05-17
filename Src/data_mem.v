`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////

module data_mem(
input clk,
input mem_read,
input mem_write,
input [31:0] address,
input [31:0] write_data,
output [31:0] read_data
  );
  
 reg [31:0] DM [63:0];
 reg [31:0] read;
 initial $readmemh("data.mem",DM);
 always @ (posedge clk)
 begin
    if (mem_read == 1'b0 && mem_write == 1'b1)
    begin
        DM[address] <= write_data;
    end
    else if (mem_read == 1'b1 && mem_write == 1'b0)
    begin
        read <= DM[address];
    end      
 end
 assign read_data = read;
endmodule
