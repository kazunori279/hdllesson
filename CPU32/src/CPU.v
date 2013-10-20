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
  wire [`WORD] alu_result;
  wire [`CPATH] cpath;
  wire [`WORD] q_a, q_b;
  
  // program counter
  always_ff @(posedge clk_cpu, posedge reset) begin
    if (reset) begin
      pc <= 32'h00400000;
    end else begin
      pc <= pc + 32'd4;
    end
  end
  assign pc_out = pc;
  
  // register file
  register_file register_file0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .rd_adrs_a(inst[`I_RS]),
    .rd_adrs_b(inst[`I_RT]),
    .wr_adrs(inst[`I_RT]),
    .wr_data(alu_result),
    .wr_en(cpath[`CP_REG_WR]),
    .q_a(q_a),
    .q_b(q_b)
  );

  // ALU
  alu alu0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .inst(inst),
    .cpath(cpath),
    .src_a(q_a),
    .src_b(q_b),
    .alu_result(alu_result)
  );
  
  // decoder
  decoder decoder0(
    .inst(inst),
    .cpath(cpath)
  );
    
endmodule
