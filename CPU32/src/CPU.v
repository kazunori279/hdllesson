/*

  CPU.v
  
  Represents a CPU.
  
 */
  
`include "src/defines.v"

module CPU (
  input clk_cpu,
  input reset,
  input [31:0] inst,
  input [4:0] reg_dbg_adrs,
  output reg [31:0] pc,
  output reg [31:0] reg_dbg_q
);

  // wires and regs
  wire [63:0] alu_result;
  wire [`CPATH] cpath;
  wire [31:0] reg_rd_data_rs, reg_rd_data_rt;
  wire [31:0] ram_rd_data;
  wire [63:0] reg_rd_data_hilo;
  
  // program counter
  program_counter program_counter0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .inst(inst),
    .cpath(cpath),
    .alu_result(alu_result),
    .pc(pc)
  );
  
  // mux for register write destination
  wire [4:0] reg_wr_adrs;
  assign reg_wr_adrs = 
    cpath[`CP_REG_DST] === `REG_DST_RT ? inst[`I_RT] :
    cpath[`CP_REG_DST] === `REG_DST_RD ? inst[`I_RD] :
    5'b0;

  // mux for register write source
  wire [31:0] reg_wr_data;
  assign reg_wr_data = 
    cpath[`CP_REG_SRC] === `REG_SRC_ALU ? alu_result[31:0] : 
    cpath[`CP_REG_SRC] === `REG_SRC_RAM ? ram_rd_data :
    32'b0;
  
  // register file
  register_file register_file0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .rd_adrs_a(inst[`I_RS]),
    .rd_adrs_b(inst[`I_RT]),
	 .rd_adrs_c(reg_dbg_adrs),
    .wr_adrs(reg_wr_adrs),
    .wr_data(reg_wr_data),
    .wr_en(cpath[`CP_REG_WR]),
    .q_a(reg_rd_data_rs),
    .q_b(reg_rd_data_rt),
	 .q_c(reg_dbg_q)
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
    .rs(reg_rd_data_rs),
    .rt(reg_rd_data_rt),
    .hilo_q(reg_rd_data_hilo),
    .result(alu_result),
    .hilo_wr_en(reg_hilo_wr_en)
  );
  
  // decoder
  decoder decoder0(
    .inst(inst),
    .cpath(cpath)
  );
  
  // memory controller
  memory_controller memory_controller0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .pc(pc),
    .adrs(alu_result[31:0]),
    .data(reg_rd_data_rt),
    .inst(inst),
    .q(ram_rd_data)
  );
  
endmodule
