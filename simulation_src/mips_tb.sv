`timescale 1ns / 1ps

module mips_TB();
logic clk;
int count = 0;
//Fetch stage ///////////////////////////
logic [31:0] Fetch_PC;
logic [31:0] Fetch_PC_adder;
logic [31:0] Fetch_instruction;

//Decode stage///////////////////////////
//control unit
logic [5:0] opcode;
logic [5:0] funct;
logic we_cont;
logic [1:0] mem_cont;
logic [4:0] exe_cont;
//Register file
logic [4:0] reg1_inp;
logic [4:0] reg2_inp;
logic [31:0] reg1_data;
logic [31:0] reg2_data;
logic [4:0] reg_write_add;
logic [31:0] reg_write_data;
//sign ext
logic [15:0] sign_ext_inp;
logic [31:0] sign_ext_out;
//register/op
logic [4:0] rt_reg;
logic [4:0] rd_reg;

//Execution stage ////////////////////////
logic [31:0] add_exe;
//left shift 2
logic [31:0] sign_ext;
//MUX 2
logic alu_src;
logic [31:0] mux_2_in_1;
logic [31:0] mux_2_in_2;
logic [31:0] mux_2_out;
//MUX 1
logic [4:0] rt_bypass;
logic [4:0] rd_bypass;
logic [4:0] mux_1_data_out;
logic reg_dest;
//ALU
logic [31:0] inp_1;
logic [31:0] inp_2;
logic [2:0] alu_sel;
logic [31:0] result;
logic zero;

//MEM stage ////////////////////////
//data memory
logic mem_read;
logic mem_write;
logic [31:0] address;
logic [31:0] write_data;
logic [31:0] read_data;

//Wb stage
logic we_control;
logic [31:0] mem_data;
logic [31:0] alu_result;
logic [4:0] reg_dst;
logic [31:0] wb_out;

top_level_MIPS DUT(.clk(clk));
initial 
clk <= 1'b0;

always @ (posedge clk)
begin
$display("         ");
$display("         ");
$display("Cycle count: %0d //////////////////////////////////////////////////", count/2);
fetch_stage();
decode_stage();
execute_stage();
memory_stage();
writeback_stage();

end

always @ (posedge clk)
begin
count = count + 1;
if (count == 21)
    $stop;
end


function int fetch_stage();

//Fetch stage signals////////////////////////////
$display("/////////////Fetch Stage////////////////");
Fetch_PC <= DUT.Program_counter_0.pc_out;
$display("A = %0d", Fetch_PC);
Fetch_PC_adder <= DUT.pc_add_0.pc_4;
$display("B = %0d", Fetch_PC_adder);
Fetch_instruction <= DUT.Instruction_memory_0.instruction;
$display("Instruction = %0h",Fetch_instruction);
endfunction

function int decode_stage();

//Decode stage//////////////////////////////
///control unit
$display("/////////////Decode Stage////////////////");
opcode <= DUT.control_unit_0.opcode;
$display("C (opcode and funct)= %0h and %0h", opcode,funct);
funct <= DUT.control_unit_0.funct;
we_cont <= DUT.control_unit_0.we_control;
mem_cont <= DUT.control_unit_0.mem_control;
exe_cont <= DUT.control_unit_0.exe_control;
////register file
reg1_inp <= DUT.register_file_0.reg_1;
$display("D = %0h",reg1_inp);
reg2_inp <= DUT.register_file_0.reg_2;
$display("E = %0h",reg2_inp);
reg1_data <= DUT.register_file_0.reg_1_data;
$display("reg_1 output data = %0d",reg1_data);
reg2_data <= DUT.register_file_0.reg_2_data;
$display("reg_2 outout data = %0d",reg2_data);
reg_write_add <= DUT.register_file_0.write_reg;
$display("F = %0h",reg_write_add);
reg_write_data <= DUT.register_file_0.write_data;
$display("G = %0d",reg_write_data);
//re and rd
rt_reg <= DUT.IF_ID_0.rt;
$display("I = %0h",rt_reg);
rd_reg <= DUT.IF_ID_0.rd;
$display("J = %0h",rd_reg);
//sign_ext
sign_ext_inp <=  DUT.sign_extend_0.imm_add;
sign_ext_out <= DUT.sign_extend_0.imm_add_ext;
$display("H = %0h and after sign extend we get %0h",sign_ext_inp,sign_ext);

endfunction

function int execute_stage();
//Execution stage ////////////////////////
$display("/////////////Execute Stage////////////////");
add_exe <=  DUT.add_ex_0.add;
$display("N = %0h",add_exe);
//left shift 2
sign_ext <= DUT.left_shift_two_0.sign_ext;
//MUX 2
alu_src <= DUT.mux_2.sel;
mux_2_in_1 <= DUT.mux_2.data_in_1;
$display("L = %0d",mux_2_in_1);
mux_2_in_2 <= DUT.mux_2.data_in_2;
$display("M = %0d",mux_2_in_2);
mux_2_out <= DUT.mux_2.data_out;
//MUX 1
rt_bypass <= DUT.mux_1.data_in_1;
rd_bypass <= DUT.mux_1.data_in_2;
mux_1_data_out <= DUT.mux_1.data_out;
reg_dest <= DUT.mux_1.sel;
$display("P = %0h",mux_1_data_out);
//ALU
inp_1 <= DUT.ALU_0.inp_1_dat;
$display("K = %0d",inp_1);
inp_2 <= DUT.ALU_0.inp_2;
alu_sel <= DUT.ALU_0.alu_op;
result <= DUT.ALU_0.result;
$display("O = %0d",result);
zero <= DUT.ALU_0.zero;
endfunction


function int memory_stage();
$display("/////////////Memory Stage////////////////");
//MEM stage ////////////////////////
mem_read <= DUT.data_mem_0.mem_read;
mem_write <= DUT.data_mem_0.mem_write;
address <= DUT.data_mem_0.address;
$display("Q = %0d",address);
write_data <= DUT.data_mem_0.write_data;
$display("R = %0d",write_data);
read_data <= DUT.data_mem_0.read_data;
endfunction

function int writeback_stage();
$display("/////////////Write Back Stage////////////////");
//WB stage /////////////////////////
we_control <= DUT.MEM_WB_0.we_control_out;
mem_data <= DUT.MEM_WB_0.read_data_out;
$display("S = %0d",mem_data);
alu_result <= DUT.MEM_WB_0.result_out;
$display("T = %0d",alu_result);
reg_dst <= DUT.MEM_WB_0.reg_dst_out;
$display("U = %0h",reg_dst);
wb_out <= DUT.mux_3.data_out;
endfunction

always 
begin
clk = ~clk; #5;
end
endmodule
