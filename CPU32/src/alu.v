/*

  alu.v
  
  Represents ALU.
  
  */

`include "src/defines.v"

module alu (
  input   clk_cpu,
  input   reset,
  input   [`WORD] pc,
  input   [`WORD] inst,
  input   [`CPATH] cpath,
  input   [`WORD] src_rs,
  input   [`WORD] src_rt,
  input   [`DWORD] hilo_q,
  output  reg [`DWORD] result,
  output  reg hilo_wr_en
);

  // ALU SrcB will be the sign extended immediate or rt
  wire [`WORD] alu_src;
  assign alu_src = cpath[`CP_ALU_SRC] === `ALU_SRC_IMM ? {{16{inst[15]}}, inst[`I_IMM]} : src_rt;

  always_comb begin
    case (cpath[`CP_ALU_CTRL])
      `R_sll:     result = src_rt << inst[`I_SHFT];
      `R_srl:     result = src_rt >> inst[`I_SHFT];
      `R_sra:     result = $signed(src_rt) >>> inst[`I_SHFT];
      `R_sllv:    result = src_rt << src_rs[4:0];
      `R_srlv:    result = src_rt >> src_rs[4:0];
      `R_srav:    result = $signed(src_rt) >>> src_rs[4:0];
      `R_jr:      result = { src_rs, `B_WORD'b0 };        // jump to [rs]
      `R_jalr:    result = { src_rs, (pc + `B_WORD'd8) }; // jump to [rs], $ra = PC + 8 (incl. delay slot)
      `R_mfhi:    result = hilo_q[63:32];
      `R_mthi:    result = {src_rs, hilo_q[31:0]};
      `R_mflo:    result = hilo_q[31:0];
      `R_mtlo:    result = {hilo_q[63:32], src_rs};
      `R_mult:    result = $signed(src_rs) * $signed(src_rt);
      `R_multu:   result = $unsigned(src_rs) * $unsigned(src_rt);
      `R_div:     result = {$signed(src_rs) % $signed(src_rt), $signed(src_rs) / $signed(src_rt)};
      `R_divu:    result = {$unsigned(src_rs) % $unsigned(src_rt), $unsigned(src_rs) / $unsigned(src_rt)};
      `R_add:     result = $signed(src_rs) + $signed(alu_src);
      `R_addu:    result = $unsigned(src_rs) + $unsigned(alu_src);
      `R_sub:     result = $signed(src_rs) - $signed(alu_src);
      `R_subu:    result = $unsigned(src_rs) - $unsigned(alu_src);
      `R_and:     result = src_rs & src_rt;
      `R_or:      result = src_rs | src_rt;
      `R_xor:     result = src_rs ^ src_rt;
      `R_nor:     result = ~(src_rs | src_rt);
      `R_slt:     result = $signed(src_rs) < $signed(src_rt) ? 32'b1 : 32'b0;
      `R_sltu:    result = $unsigned(src_rs) < $unsigned(src_rt) ? 32'b1 : 32'b0;
      default:    result = `B_DWORD'bx; // unsupported operation
    endcase
  end
  
  // operations to write hilo reg
  always_comb begin
    case (cpath[`CP_ALU_CTRL])
      `R_mthi:  hilo_wr_en = 1'b1;
      `R_mtlo:  hilo_wr_en = 1'b1;
      `R_mult:  hilo_wr_en = 1'b1;
      `R_multu: hilo_wr_en = 1'b1;
      `R_div:   hilo_wr_en = 1'b1;
      `R_divu:  hilo_wr_en = 1'b1;
      default:  hilo_wr_en = 1'b0;
    endcase
  end
  
endmodule
