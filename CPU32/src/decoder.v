/*

  decoder.v
  
  Represents an instruction decoder. 
  
  */

`include "src/defines.v"

module decoder (
  input   [`WORD] inst,
  output  reg [`CPATH] cpath
);

  always_comb begin
    case (inst[`I_OP])
      `OP_R:        cpath = {`REG_SRC_ALU, `REG_DST_RD, `REG_WR_T, inst[`I_FUNC], `ALU_SRC_REG, `RAM_WR_F, `JMP_F};
      `OP_beq:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_sub, `ALU_SRC_REG, `RAM_WR_F, `JMP_T};
      `OP_bne:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_sub, `ALU_SRC_REG, `RAM_WR_F, `JMP_T};
      `OP_addi:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `JMP_F};
      `OP_lw:       cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `JMP_F};
      `OP_sw:       cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_add, `ALU_SRC_IMM, `RAM_WR_T, `JMP_F};
      `OP_j:        cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_x,   `ALU_SRC_X,   `RAM_WR_F, `JMP_T};
      default:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_x,   `ALU_SRC_X,   `RAM_WR_F, `JMP_F};
    endcase
  end

endmodule