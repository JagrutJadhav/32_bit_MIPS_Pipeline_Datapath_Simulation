`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//////////////////////////////////////////////////////////////////////////////////


module register_file(
input clk,
input [4:0] reg_1,
input [4:0] reg_2,
input [4:0] write_reg,
input [31:0] write_data,
output [31:0] reg_1_data,
output [31:0] reg_2_data
    );
    reg [31:0] register [31:0] ;
    reg [31:0] reg_1_d;
    reg [31:0] reg_2_d;
    
    initial 
    begin
    register [5'd0] <= 32'd0;
    ////////intially feeding values 
    register [5'b01001] <= 32'd15;     //$t1 value
    register [5'b01010] <= 32'd20;     //$t2 value
    register [5'b01011] <= 32'd25;     //$t3 value
    register [5'b01110] <= 32'd40;     //$t6 value
    end
    always @ (posedge clk)
    begin
        register[write_reg] <= write_data;
    end
    
    always @ (negedge clk)
    begin
        reg_1_d <= register[reg_1];
        reg_2_d <= register[reg_2];
    end
    
    assign reg_1_data = reg_1_d;
    assign reg_2_data = reg_2_d;
endmodule
