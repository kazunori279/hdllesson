/*

  decoder.v
  
  Represents an instruction decoder.
  
  */

`include "defines.v"

module decoder (
  input   [3:0] op_in,
  input   alu_carry,
  output  [1:0] alu_data_sel,
  output  reg_a_load,
  output  reg_b_load,
  output  reg_pc_load,
  output  reg_io_load
);

  // decode operation and generate control path signals
  // format = {data selector for ALU, a_load, b_load, pc_load, io_load}
  function [5:0] decode_op;
    input [3:0] op;
    input alu_carry_in;
    case (op)
      `OP_NOP:      decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b0, 1'b0};
      `OP_ADD_A_IM: decode_op = {`SEL_A, 1'b1, 1'b0, 1'b0, 1'b0};
      `OP_ADD_B_IM: decode_op = {`SEL_B, 1'b0, 1'b1, 1'b0, 1'b0};
      `OP_MOV_A_IM: decode_op = {`SEL_Z, 1'b1, 1'b0, 1'b0, 1'b0};
      `OP_MOV_B_IM: decode_op = {`SEL_Z, 1'b0, 1'b1, 1'b0, 1'b0};
      `OP_MOV_A_B:  decode_op = {`SEL_A, 1'b0, 1'b1, 1'b0, 1'b0};
      `OP_MOV_B_A:  decode_op = {`SEL_B, 1'b1, 1'b0, 1'b0, 1'b0};
      `OP_IN_A:     decode_op = {`SEL_I, 1'b1, 1'b0, 1'b0, 1'b0};
      `OP_IN_B:     decode_op = {`SEL_I, 1'b0, 1'b1, 1'b0, 1'b0};
      `OP_OUT_IM:   decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b0, 1'b1};
      `OP_OUT_B:    decode_op = {`SEL_B, 1'b0, 1'b0, 1'b0, 1'b1};
      `OP_JMP_IM:   decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b1, 1'b0};
      `OP_JNC_IM:   
        if (~alu_carry_in)
                    decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b1, 1'b0};
        else
                    decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b0, 1'b0};
      default:      decode_op = {`SEL_Z, 1'b0, 1'b0, 1'b0, 1'b0};
    endcase
  endfunction

  // decompose decoded bits into control paths
  reg [5:0] decoded;
  always @ (op_in or alu_carry) begin
    decoded = decode_op(op_in, alu_carry);
  end
  assign alu_data_sel = decoded[5:4];
  assign reg_a_load = decoded[3];
  assign reg_b_load = decoded[2];
  assign reg_pc_load = decoded[1];
  assign reg_io_load = decoded[0];

endmodule