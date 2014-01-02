/*

  CPU.v
  
  Represents a CPU.
  
 */
  
`include "src/defines.v"

module CPU (
  input clk_cpu,
  input reset,
  input [`WORD] inst,
  output reg [`WORD] pc
);

  // wires and regs
  wire [`DWORD] alu_result;
  wire [`CPATH] cpath;
  wire [`WORD] reg_rd_data_rs, reg_rd_data_rt, reg_wr_data;
  wire [`WORD] ram_rd_data;
  wire [`DWORD] reg_rd_data_hilo;
  
  // program counter
  program_counter program_counter0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .inst(inst),
    .cpath(cpath),
    .alu_result(alu_result),
    .pc(pc)
  );
  
  // mux for register write
  wire [4:0] reg_dst;
  assign reg_dst = cpath[`CP_REG_DST] == `REG_DST_RT ? inst[`I_RT] : inst[`I_RD];
  assign reg_wr_data = cpath[`CP_REG_SRC] == `REG_SRC_ALU ? alu_result[`WORD] : ram_rd_data;
  
  // register file
  register_file register_file0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .rd_adrs_a(inst[`I_RS]),
    .rd_adrs_b(inst[`I_RT]),
    .wr_adrs(reg_dst),
    .wr_data(reg_wr_data),
    .wr_en(cpath[`CP_REG_WR]),
    .q_a(reg_rd_data_rs),
    .q_b(reg_rd_data_rt)
  );

  // hilo register
  wire reg_hilo_wr_en;
  hilo_register hilo_register0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .wr_en(reg_hilo_wr_en),
    .wr_data(alu_result),
    .q(reg_rd_data_hilo)
  );
    
  // ALU
  alu alu0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .pc(pc),
    .inst(inst),
    .cpath(cpath),
    .src_rs(reg_rd_data_rs),
    .src_rt(reg_rd_data_rt),
    .hilo_q(reg_rd_data_hilo),
    .result(alu_result),
    .hilo_wr_en(reg_hilo_wr_en)
  );
  
  // decoder
  decoder decoder0(
    .inst(inst),
    .cpath(cpath)
  );
  
  // RAM
  ram ram0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .rd_adrs(alu_result),
    .wr_adrs(alu_result),
    .wr_data(reg_rd_data_b),
    .wr_en(cpath[`CP_RAM_WR]),
    .q(ram_rd_data)
  );
    
endmodule
