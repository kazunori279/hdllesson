/*

  alu.v
  
  Represents ALU.
  
  */
  
module alu (
  input   [`W-1:0] data_0_in,
  input   [`W-1:0] data_1_in,
  output  [`W-1:0] data_out,
  output  carry_out
);

  wire [`W:0] result;
  assign result = data_0_in + data_1_in;
  assign data_out = result[`W-1:0];
  assign carry_out = result[`W];

endmodule
  