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
  wire [`WORD] reg_rd_data_a, reg_rd_data_b, reg_wr_data;
  wire [`WORD] ram_rd_data;
  
  // for direct jump
  wire [`WORD] jmp_addr;
  assign jmp_addr = inst[`I_ADDR] << 2;
  
  // program counter
  always_ff @(posedge clk_cpu, posedge reset) begin
    if (reset) begin
      pc <= `START_ADRS;
    end else begin
      if (cpath[`CP_JMP])
        pc <= {pc[31:28], jmp_addr[27:0]}; // direct jump
      else
        pc <= pc + 32'd4;
    end
  end

  // mux for register write
  wire [4:0] reg_dst;
  assign reg_dst = cpath[`CP_REG_DST] == `REG_DST_RT ? inst[`I_RT] : inst[`I_RD];
  assign reg_wr_data = cpath[`CP_REG_SRC] == `REG_SRC_ALU ? alu_result : ram_rd_data;
  
  // register file
  register_file register_file0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .rd_adrs_a(inst[`I_RS]),
    .rd_adrs_b(inst[`I_RT]),
    .wr_adrs(reg_dst),
    .wr_data(reg_wr_data),
    .wr_en(cpath[`CP_REG_WR]),
    .q_a(reg_rd_data_a),
    .q_b(reg_rd_data_b)
  );

  // ALU
  alu alu0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .inst(inst),
    .cpath(cpath),
    .src_a(reg_rd_data_a),
    .src_b(reg_rd_data_b),
    .alu_result(alu_result)
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
