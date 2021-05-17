`timescale 1 ps / 1 ps

module top_level_MIPS
   (clk);
  input clk;

  wire [31:0]ALU_0_result;
  wire ALU_0_zero;
  wire [31:0]EX_MEM_0_add_branch_out;
  wire EX_MEM_0_mem_control_rd;
  wire EX_MEM_0_mem_control_wr;
  wire [4:0]EX_MEM_0_reg_dst_out;
  wire [31:0]EX_MEM_0_result_out;
  wire EX_MEM_0_we_control_out;
  wire [31:0]EX_MEM_0_write_data_out;
  wire EX_MEM_0_zero_out;
  wire [31:0]ID_EX_0_PC_pass_out;
  wire ID_EX_0_alu_src;
  wire [2:0]ID_EX_0_exe_control_alu;
  wire [1:0]ID_EX_0_mem_control_out;
  wire [4:0]ID_EX_0_rd_out;
  wire [31:0]ID_EX_0_reg_1_out;
  wire [31:0]ID_EX_0_reg_2_out;
  wire ID_EX_0_reg_dst;
  wire [4:0]ID_EX_0_rt_out;
  wire [31:0]ID_EX_0_sign_ext_out;
  wire ID_EX_0_we_control_out;
  wire [31:0]IF_ID_0_IF_out_pc_4;
  wire [5:0]IF_ID_0_funct;
  wire [15:0]IF_ID_0_imm_add;
  wire [5:0]IF_ID_0_opcode;
  wire [4:0]IF_ID_0_rd;
  wire [4:0]IF_ID_0_rs;
  wire [4:0]IF_ID_0_rt;
  wire [31:0]Instruction_memory_0_instruction;
  wire [31:0]MEM_WB_0_read_data_out;
  wire [4:0]MEM_WB_0_reg_dst_out;
  wire [31:0]MEM_WB_0_result_out;
  wire MEM_WB_0_we_control_out;
  wire [31:0]Program_counter_0_pc_out;
  wire [31:0]add_ex_0_add;
  wire clk_1;
  wire [4:0]control_unit_0_exe_control;
  wire [1:0]control_unit_0_mem_control;
  wire control_unit_0_we_control;
  wire [31:0]data_mem_0_read_data;
  wire [31:0]left_shift_two_0_left_shift;
  wire [31:0]mux_0_data_out;
  wire [4:0]mux_1_data_out;
  wire [31:0]mux_2_data_out;
  wire [31:0]mux_3_data_out;
  wire [31:0]pc_add_0_pc_4;
  wire [31:0]register_file_0_reg_1_data;
  wire [31:0]register_file_0_reg_2_data;
  wire [31:0]sign_extend_0_imm_add_ext;

  assign clk_1 = clk;
  ALU ALU_0
       (.alu_op(ID_EX_0_exe_control_alu),
        .clk(clk_1),
        .inp_1(ID_EX_0_reg_1_out),
        .inp_2(mux_2_data_out),
        .result(ALU_0_result),
        .zero(ALU_0_zero));
  EX_MEM EX_MEM_0
       (.add_branch(add_ex_0_add),
        .add_branch_out(EX_MEM_0_add_branch_out),
        .clk(clk_1),
        .mem_control(ID_EX_0_mem_control_out),
        .mem_control_rd(EX_MEM_0_mem_control_rd),
        .mem_control_wr(EX_MEM_0_mem_control_wr),
        .reg_dst({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mux_1_data_out}),
        .reg_dst_out(EX_MEM_0_reg_dst_out),
        .result(ALU_0_result),
        .result_out(EX_MEM_0_result_out),
        .we_control(ID_EX_0_we_control_out),
        .we_control_out(EX_MEM_0_we_control_out),
        .write_data(ID_EX_0_reg_2_out),
        .write_data_out(EX_MEM_0_write_data_out),
        .zero(ALU_0_zero),
        .zero_out(EX_MEM_0_zero_out));
  ID_EX ID_EX_0
       (.PC_pass(IF_ID_0_IF_out_pc_4),
        .PC_pass_out(ID_EX_0_PC_pass_out),
        .alu_src(ID_EX_0_alu_src),
        .clk(clk_1),
        .exe_control(control_unit_0_exe_control),
        .exe_control_alu(ID_EX_0_exe_control_alu),
        .mem_control(control_unit_0_mem_control),
        .mem_control_out(ID_EX_0_mem_control_out),
        .rd(IF_ID_0_rd),
        .rd_out(ID_EX_0_rd_out),
        .reg_1(register_file_0_reg_1_data),
        .reg_1_out(ID_EX_0_reg_1_out),
        .reg_2(register_file_0_reg_2_data),
        .reg_2_out(ID_EX_0_reg_2_out),
        .reg_dst(ID_EX_0_reg_dst),
        .rt(IF_ID_0_rt),
        .rt_out(ID_EX_0_rt_out),
        .sign_ext(sign_extend_0_imm_add_ext),
        .sign_ext_out(ID_EX_0_sign_ext_out),
        .we_control(control_unit_0_we_control),
        .we_control_out(ID_EX_0_we_control_out));
  IF_ID IF_ID_0
       (.IF_out_pc_4(IF_ID_0_IF_out_pc_4),
        .clk(clk_1),
        .funct(IF_ID_0_funct),
        .imm_add(IF_ID_0_imm_add),
        .instruction(Instruction_memory_0_instruction),
        .opcode(IF_ID_0_opcode),
        .pc_4(pc_add_0_pc_4),
        .rd(IF_ID_0_rd),
        .rs(IF_ID_0_rs),
        .rt(IF_ID_0_rt));
  Instruction_memory Instruction_memory_0
       (.clk(clk_1),
        .instruction(Instruction_memory_0_instruction),
        .pc_out(Program_counter_0_pc_out));
  MEM_WB MEM_WB_0
       (.clk(clk_1),
        .read_data(data_mem_0_read_data),
        .read_data_out(MEM_WB_0_read_data_out),
        .reg_dst(EX_MEM_0_reg_dst_out),
        .reg_dst_out(MEM_WB_0_reg_dst_out),
        .result(EX_MEM_0_result_out),
        .result_out(MEM_WB_0_result_out),
        .we_control(EX_MEM_0_we_control_out),
        .we_control_out(MEM_WB_0_we_control_out));
  Program_counter Program_counter_0
       (.clk(clk_1),
        .pc_in(mux_0_data_out),
        .pc_out(Program_counter_0_pc_out));
  add_ex add_ex_0
       (.add(add_ex_0_add),
        .clk(clk_1),
        .pc_in(ID_EX_0_PC_pass_out),
        .shift_in(left_shift_two_0_left_shift));
  control_unit control_unit_0
       (.clk(clk_1),
        .exe_control(control_unit_0_exe_control),
        .funct(IF_ID_0_funct),
        .mem_control(control_unit_0_mem_control),
        .opcode(IF_ID_0_opcode),
        .we_control(control_unit_0_we_control));
  data_mem data_mem_0
       (.address(EX_MEM_0_result_out),
        .clk(clk_1),
        .mem_read(EX_MEM_0_mem_control_rd),
        .mem_write(EX_MEM_0_mem_control_wr),
        .read_data(data_mem_0_read_data),
        .write_data(EX_MEM_0_write_data_out));
  left_shift_two left_shift_two_0
       (.left_shift(left_shift_two_0_left_shift),
        .sign_ext(ID_EX_0_sign_ext_out));
  mux mux_0
       (.data_in_1(pc_add_0_pc_4),
        .data_in_2(EX_MEM_0_add_branch_out),
        .data_out(mux_0_data_out),
        .sel(EX_MEM_0_zero_out));
  mux #(5) mux_1
       (.data_in_1(ID_EX_0_rt_out),
        .data_in_2(ID_EX_0_rd_out),
        .data_out(mux_1_data_out),
        .sel(ID_EX_0_reg_dst));
  mux mux_2
       (.data_in_1(ID_EX_0_reg_2_out),
        .data_in_2(ID_EX_0_sign_ext_out),
        .data_out(mux_2_data_out),
        .sel(ID_EX_0_alu_src));
  mux mux_3
       (.data_in_1(MEM_WB_0_read_data_out),
        .data_in_2(MEM_WB_0_result_out),
        .data_out(mux_3_data_out),
        .sel(MEM_WB_0_we_control_out));
  pc_add pc_add_0
       (.clk(clk_1),
        .pc_4(pc_add_0_pc_4),
        .pc_out(Program_counter_0_pc_out));
  register_file register_file_0
       (.clk(clk_1),
        .reg_1(IF_ID_0_rs),
        .reg_1_data(register_file_0_reg_1_data),
        .reg_2(IF_ID_0_rt),
        .reg_2_data(register_file_0_reg_2_data),
        .write_data(mux_3_data_out),
        .write_reg(MEM_WB_0_reg_dst_out));
  sign_extend sign_extend_0
       (.clk(clk_1),
        .imm_add(IF_ID_0_imm_add),
        .imm_add_ext(sign_extend_0_imm_add_ext));
endmodule
