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
      `OP_R:
        case (inst[`I_FUNCT])
          `R_add:   cpath = {`REG_SRC_ALU, `REG_DST_RD, `REG_WR_T, `ALU_CTRL_ADD, `ALU_SRC_REG, `RAM_WR_F, `JMP_F};
          default:  cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `ALU_CTRL_X,   `ALU_SRC_X,   `RAM_WR_F, `JMP_F};
        endcase
      `OP_addi:     cpath = {`REG_SRC_ALU, `REG_DST_RT, `REG_WR_T, `ALU_CTRL_ADD, `ALU_SRC_IMM, `RAM_WR_F, `JMP_F};
      `OP_lw:       cpath = {`REG_SRC_RAM, `REG_DST_RT, `REG_WR_T, `ALU_CTRL_ADD, `ALU_SRC_IMM, `RAM_WR_F, `JMP_F};
      `OP_sw:       cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `ALU_CTRL_ADD, `ALU_SRC_IMM, `RAM_WR_T, `JMP_F};
      `OP_j:        cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `ALU_CTRL_X,   `ALU_SRC_X,   `RAM_WR_F, `JMP_T};
      default:      cpath = {`REG_SRC_X,   `REG_DST_X,  `REG_WR_F, `ALU_CTRL_X,   `ALU_SRC_X,   `RAM_WR_F, `JMP_F};
    endcase
  end

endmodule