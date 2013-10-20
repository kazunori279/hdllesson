/*

  rom.v
  
  ROM for "Ramen Timer" instruction code.
  
 */

`include "src/defines.v"

module rom (
  input   clk_cpu,
  input   reset,
  input   [31:0] adrs,
  output  [31:0] dat_out
);

endmodule