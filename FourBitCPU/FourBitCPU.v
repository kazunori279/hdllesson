/*
 
  FourBitCPU.v
  
  The top level module for the simple 4 bit CPU.
  
 */

`include "defines.v"

module FourBitCPU (
  input   clk,
  input   btn0_n,
  output  d_clk_cpu,
  output  [3:0] d_pc,
  output  [7:0] d_inst,
  output  [3:0] d_reg_a_out,
  output  [3:0] d_reg_b_out,
  output  [3:0] d_alu_data_out,
  output  d_alu_carry_out,
  output  [1:0] d_alu_data_sel,
  output  d_reg_a_load,
  output  d_reg_b_load,
  output  d_decoded_out
);

  // reset signal
  wire reset;
  chattering_canceler chattering_canceler0(
    .clk(clk), 
    .dat_in_n(btn0_n), 
    .dat_out(reset)
  );

  // cpu clock prescaling
  wire clk_cpu;
  clock_prescaler clock_prescaler0(
    .clk(clk), 
    .reset(reset), 
    .clk_cpu(clk_cpu)
  );
  
  // program counter
  wire [3:0] pc;
  register_file register_file_pc(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .load(clk_cpu), 
    .dat_in(next_pc), 
    .dat_out(pc)
  );
  reg [3:0] next_pc;
  always @(*) begin
    next_pc <= pc + 4'd1;
  end
  
  // instruction rom
  
  wire [7:0] inst;
  rom rom0(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .adrs(pc), 
    .dat_out(inst)
  );
  
  // register A
  wire reg_a_load;
  wire [3:0] reg_a_out;
  register_file register_file_a(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .load(reg_a_load), 
    .dat_in(alu_data_out), 
    .dat_out(reg_a_out)
  );
  
  // register B
  wire reg_b_load;
  wire [3:0] reg_b_out;
  register_file register_file_b(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .load(reg_b_load), 
    .dat_in(alu_data_out), 
    .dat_out(reg_b_out)
  );
  
  // data selector
  wire [1:0] alu_data_sel;
  assign alu_data_0_in =
    alu_data_sel == `SEL_A ? reg_a_out :
    alu_data_sel == `SEL_B ? reg_b_out : 
    3'd0;
  assign alu_data_1_in = inst[3:0];
  
  // ALU
  wire [3:0] alu_data_0_in;
  wire [3:0] alu_data_1_in;
  wire [3:0] alu_data_out;
  wire alu_carry_out;
  alu alu0(
    .data_0_in(alu_data_0_in),
    .data_1_in(alu_data_1_in),
    .data_out(alu_data_out),
    .carry_out(alu_carry_out)
  );
  
  // decoder
  decoder decoder0(
    .op_in(inst[7:4]),
    .alu_data_sel(alu_data_sel),
    .reg_a_load(reg_a_load),
    .reg_b_load(reg_b_load),
    .decoded_out(d_decoded_out)
  );
  
  // dummy output
  assign d_clk_cpu = clk_cpu;
  assign d_pc = pc;
  assign d_inst = inst;
  assign d_reg_a_out = reg_a_out;
  assign d_reg_b_out = reg_b_out;
  assign d_alu_data_out = alu_data_out;
  assign d_alu_carry_out = alu_carry_out;
  assign d_alu_data_sel = alu_data_sel;
  assign d_reg_a_load = reg_a_load;
  assign d_reg_b_load = reg_b_load;
  
endmodule