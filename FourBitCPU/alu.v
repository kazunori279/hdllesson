/*

  alu.v
  
  Represents ALU.
  
  */
  
module alu (
  input   [3:0] data_0_in,
  input   [3:0] data_1_in,
  output  [3:0] data_out,
  output  carry_out
);

  wire [4:0] result;
  assign result = data_0_in + data_1_in;
  assign data_out = result[3:0];
  assign carry_out = result[4];

endmodule
