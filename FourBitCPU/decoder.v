/*

  decoder.v
  
  Represents an instruction decoder.
  
  */

`include "defines.v"

module decoder (
  input   [3:0] op_in,
  output  [1:0] alu_data_sel,
  output  reg_a_load,
  output  reg_b_load,
  output  [3:0] decoded_out
);

  // decode operation
  function [3:0] decode_op;
    input [3:0] op;
    case (op)
      `OP_NOP:      decode_op = {`SEL_A, 1'b0, 1'b0};
      `OP_ADD_A_IM: decode_op = {`SEL_A, 1'b1, 1'b0};
      `OP_ADD_B_IM: decode_op = {`SEL_B, 1'b0, 1'b1};
      `OP_MOV_A_IM: decode_op = {`SEL_Z, 1'b1, 1'b0};
      `OP_MOV_B_IM: decode_op = {`SEL_Z, 1'b0, 1'b1};
      default:      decode_op = {`SEL_Z, 1'b0, 1'b0};
    endcase
  endfunction

  // decompose decoded bits into control paths
  wire [3:0] decoded = decode_op(op_in);
  assign alu_data_sel = decoded[3:2];
  assign reg_a_load = decoded[1];
  assign reg_b_load = decoded[0];
  assign decoded_out = decoded;

endmodule