/*

  CPU.v
  
  Represents a CPU.
  
 */
  
`include "defines.v"

module CPU (
  input clk_cpu,
  input reset,
  input [7:0] inst,
  input [3:0] io_in,
  output [3:0] pc,
  output [3:0] io_out
);

  // program counter
  reg [3:0] next_pc;
  wire reg_pc_load;
  wire [3:0] alu_data_out;
  register_file register_file_pc(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .load(clk_cpu), 
    .dat_in(next_pc), 
    .dat_out(pc)
  );
  always @(*) begin
    if (reg_pc_load)
      next_pc <= alu_data_out;
    else
      next_pc <= pc + 4'd1;
  end
  
  // ALU
  wire [3:0] alu_data_0_in;
  wire [3:0] alu_data_1_in;
  wire alu_carry_out;
  alu alu0(
    .data_0_in(alu_data_0_in),
    .data_1_in(alu_data_1_in),
    .data_out(alu_data_out),
    .carry_out(alu_carry_out)
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
  
  // io_out register
  wire reg_io_load;
  wire [3:0] reg_io_out;
  register_file register_file_io(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .load(reg_io_load), 
    .dat_in(alu_data_out), 
    .dat_out(reg_io_out)
  );
  assign io_out = reg_io_out;
  
  // data selector
  wire [1:0] alu_data_sel;
  assign alu_data_0_in =
    alu_data_sel == `SEL_A ? reg_a_out :
    alu_data_sel == `SEL_B ? reg_b_out : 
    alu_data_sel == `SEL_I ? io_in :     
    alu_data_sel == `SEL_Z ? 4'd0 : 
    4'd0;
  assign alu_data_1_in = inst[3:0];
  
  // decoder
  decoder decoder0(
    .op_in(inst[7:4]),
    .alu_data_sel(alu_data_sel),
    .reg_a_load(reg_a_load),
    .reg_b_load(reg_b_load),
    .reg_pc_load(reg_pc_load),
    .reg_io_load(reg_io_load)
  );
  
endmodule
