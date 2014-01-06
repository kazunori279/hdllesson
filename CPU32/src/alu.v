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
  input   [`WORD] rs,
  input   [`WORD] rt,
  input   [`DWORD] hilo_q,
  output  reg [`DWORD] result,
  output  reg hilo_wr_en
);

  // mux to switch rt or imm
  reg [`WORD] rt_or_imm;
  always_comb begin
    case (cpath[`CP_ALU_SRC])
      `ALU_SRC_IMM: rt_or_imm = {{16{inst[15]}}, inst[`I_IMM]}; // sign extended immediate
      `ALU_SRC_REG: rt_or_imm = rt;
      default:      rt_or_imm = `B_WORD'bx;
    endcase
  end
  
  // arithmetic operations
  always_comb begin
    case (cpath[`CP_ALU_CTRL])
      `R_sll:     result = rt_or_imm << inst[`I_SHFT];
      `R_srl:     result = rt_or_imm >> inst[`I_SHFT];
      `R_sra:     result = $signed(rt_or_imm) >>> inst[`I_SHFT];
      `R_sllv:    result = rt_or_imm << rs[4:0];
      `R_srlv:    result = rt_or_imm >> rs[4:0];
      `R_srav:    result = $signed(rt_or_imm) >>> rs[4:0];
      `R_jr:      result = {rs, `B_WORD'b0 };        // jump to [rs]
      `R_jalr:    result = {rs, (pc + `B_WORD'd8) }; // jump to [rs], $ra = PC + 8 (incl. delay slot)
      `R_mfhi:    result = hilo_q[63:32];
      `R_mthi:    result = {rs, hilo_q[31:0]};
      `R_mflo:    result = hilo_q[31:0];
      `R_mtlo:    result = {hilo_q[63:32], rs};
      `R_mult:    result = $signed(rs) * $signed(rt_or_imm);
      `R_multu:   result = $unsigned(rs) * $unsigned(rt_or_imm);
      `R_div:     result = {$signed(rs) % $signed(rt_or_imm), $signed(rs) / $signed(rt_or_imm)};
      `R_divu:    result = {$unsigned(rs) % $unsigned(rt_or_imm), $unsigned(rs) / $unsigned(rt_or_imm)};
      `R_add:     result = $signed(rs) + $signed(rt_or_imm);
      `R_addu:    result = $unsigned(rs) + $unsigned(rt_or_imm);
      `R_sub:     result = $signed(rs) - $signed(rt_or_imm);
      `R_subu:    result = $unsigned(rs) - $unsigned(rt_or_imm);
      `R_and:     result = rs & rt_or_imm;
      `R_or:      result = rs | rt_or_imm;
      `R_xor:     result = rs ^ rt_or_imm;
      `R_nor:     result = ~(rs | rt_or_imm);
      `R_slt:     result = $signed(rs) < $signed(rt_or_imm) ? 32'b1 : 32'b0;
      `R_sltu:    result = $unsigned(rs) < $unsigned(rt_or_imm) ? 32'b1 : 32'b0;
      `R_lui:     result = {32'b0, rt_or_imm, 16'b0};
      default:    result = `B_DWORD'bx; // unsupported operation
    endcase
  end
  
  // hilo register write operations
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
