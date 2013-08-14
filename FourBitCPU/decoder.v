/*

  decoder.v
  
  Represents an instruction decoder.
  
  */

`define OP_NOP        `W'h0
`define OP_ADD_A_IM   `W'h1
`define OP_ADD_B_IM   `W'h2
`define OP_MOV_A_IM   `W'h3
`define OP_MOV_B_IM   `W'h4
`define OP_MOV_A_B    `W'h5
`define OP_MOV_B_A    `W'h6
  
module decoder (
  input   [`W-1:0] inst,
  output  [1:0] alu_data_sel,
  output  reg_a_load,
  output  reg_b_load
);

  // decode operation
  function [3:0]decode_op(
    input [`W-1:0] op
  );
    case (op)
      `OP_NOP:      decode_op = {`SEL_A, 1'b0, 1'b0};
      `OP_ADD_A_IM: decode_op = {`SEL_A, 1'b1, 1'b0};
      `OP_ADD_B_IM: decode_op = {`SEL_B, 1'b0, 1'b1};
      default:      decode_op = {`SEL_A, 1'b0, 1'b0};
    endcase
  endfunction

  // decompose decoded bits into control paths
  wire [3:0] decoded = decode_op(inst);
  assign alu_data_sel = decoded[3:2];
  assign reg_a_load = decoded[1:1];
  assign reg_b_load = decoded[0:0];

endmodule