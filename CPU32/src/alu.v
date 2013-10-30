/*

  alu.v
  
  Represents ALU.
  
  */

`include "src/defines.v"

module alu (
  input   clk_cpu,
  input   reset,
  input   [`WORD] inst,
  input   [`CPATH] cpath,
  input   [`WORD] src_a,
  input   [`WORD] src_b,
  output  reg [`WORD] alu_result
);

  wire alu_src;
  assign alu_src = cpath[`CP_ALU_SRC];

  always_comb begin
    case (alu_src)
      `ALU_SRC_IMM:   alu_result = src_a + inst[`I_IMM];
      `ALU_SRC_REG:   alu_result = src_a + src_b;
      default:        alu_result = 32'd0;
    endcase
  end
  
endmodule
