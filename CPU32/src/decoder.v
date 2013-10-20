/*

  decoder.v
  
  Represents an instruction decoder. 
  
  */

`include "src/defines.v"

module decoder (
  input   [`WORD] inst,
  output  reg [`CPATH] cpath
);

  wire [5:0] i_op;
  assign i_op = inst[`I_OP];

  always_comb begin
    case (i_op)
      `OP_addi:     cpath = {`REG_WR_T, `ALU_CTRL_ADD, `ALU_SRC_IMM};
      default:      cpath = {`REG_WR_T, `ALU_CTRL_ADD, `ALU_SRC_IMM};
    endcase
  end

endmodule