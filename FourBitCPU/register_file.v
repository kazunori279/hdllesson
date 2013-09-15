/*

  register_file.v
  
  Represents one register with specified bit width.
  
  */

`include "defines.v"

module register_file (
  input   clk_cpu,
  input   reset,
  input   load,
  input   [3:0] dat_in,
  output  [3:0] dat_out
);

  reg [3:0] register;
  
  always @(posedge clk_cpu or posedge reset) begin
    if (reset) begin
      register <= 4'd0;
    end else if (load) begin
      register <= dat_in;
    end
  end
  
  assign dat_out = register;

endmodule