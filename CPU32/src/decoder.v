/*

  decoder.v
  
  Represents an instruction decoder. 
  
  */

`include "src/defines.v"

module decoder (
  input   [`WORD] inst,
  output  reg [`CPATH] cpath
);

  // set control path
  always_comb begin
    case (inst[`I_OP])
      `OP_R:        cpath = {`REG_SRC_ALU, `REG_DST_RD, `REG_WR_T, inst[`I_FUNC], `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_bltz:     cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_add, `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_beq:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_sub, `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_bne:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_sub, `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_blez:     cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_add, `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_bgtz:     cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_add, `ALU_SRC_REG, `RAM_WR_F, `EXCP_F};
      `OP_addi:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_addiu:    cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_slti:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_slt, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_sltiu:    cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_sltu,`ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_andi:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_and, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_ori:      cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_or,  `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_xori:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_xor, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lui:      cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lb:       cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lh:       cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lw:       cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lbu:      cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_lhu:      cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `R_add, `ALU_SRC_IMM, `RAM_WR_F, `EXCP_F};
      `OP_sw:       cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_add, `ALU_SRC_IMM, `RAM_WR_T, `EXCP_F};
      `OP_j:        cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_x,   `ALU_SRC_X,   `RAM_WR_F, `EXCP_F};
      default:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `R_x,   `ALU_SRC_X,   `RAM_WR_F, `EXCP_T};
    endcase
  end

endmodule