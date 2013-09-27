/*

  alu.v
  
  Represents ALU.
  
  */

`include "defines.v"

module alu (
  input   clk,
  input   reset,
  input   [3:0] data_0_in,
  input   [3:0] data_1_in,
  output  [3:0] data_out,
  output  carry_out
);

  // alu
  wire [4:0] result;
  assign result = data_0_in + data_1_in;
  assign data_out = result[3:0];
  
  // carry flag
  reg carry;
  always @(posedge clk or posedge reset) begin
    if (reset)
      carry <= 0;
    else
      carry <= result[4];
  end
  assign carry_out = carry;

endmodule
