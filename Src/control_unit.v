`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Project - ECE690
//Maker - Jagrut Jadhav
//ALU OP codes - 
//001 - add
//010 - sub
//011 - and
//100 - or
//110 - beq      
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
input clk,
input [5:0] opcode,
input [5:0] funct,
output we_control,
output[1:0] mem_control,
output [4:0] exe_control
    );
    reg we_cntrl;
    reg mem_rd;
    reg mem_wr;
    reg [2:0] alu_op;
    reg alusrc;
    reg regdst;
   always @ (posedge clk)
   begin
    if (opcode == 6'b000000 && funct == 6'b100000)     //add inst
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b001 ;
    alusrc <= 1'b0;
    regdst <= 1'b1;
    end
    else if (opcode == 6'b000000 && funct == 6'b100010)  //sub
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b010 ;
    alusrc <= 1'b0;
    regdst <= 1'b1;
    end
    else if (opcode == 6'b000000 && funct == 6'b100100) //and
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b011 ;
    alusrc <= 1'b0;
    regdst <= 1'b1;
    end
    else if (opcode == 6'b000000 && funct == 6'b100101)//or
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b100 ;
    alusrc <= 1'b0;
    regdst <= 1'b1;
    end
    else if (opcode == 6'b001000)  //addi
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b001;
    alusrc <= 1'b1;
    regdst <= 1'b0;
  end
    
    else if (opcode == 6'b100011) //lw
    begin
    we_cntrl <= 1'b1;
    mem_rd <= 1'b1;
    mem_wr <= 1'b0;
    alu_op <= 3'b001 ;
    alusrc <= 1'b1;
    regdst <= 1'b0;
    end
    
    else if (opcode == 6'b101011) //sw
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b1;
    alu_op <= 3'b001 ;
    alusrc <= 1'b1;
    regdst <= 1'b0;
    end
    
    else if (opcode == 6'b000100) //beq
    begin
    we_cntrl <= 1'b0;
    mem_rd <= 1'b0;
    mem_wr <= 1'b0;
    alu_op <= 3'b110 ;
    alusrc <= 1'b1;
    regdst <= 1'b0;
    end
    
    else
    begin
    we_cntrl <= 1'bx;
    mem_rd <= 1'bx;
    mem_wr <= 1'bx;
    alu_op <= 3'bxxx ;
    alusrc <= 1'bx;
    regdst <= 1'bx;
    end
   end
   assign we_control = we_cntrl;
   assign mem_control = {mem_rd,mem_wr};
   assign exe_control = {alu_op,alusrc,regdst};
endmodule
