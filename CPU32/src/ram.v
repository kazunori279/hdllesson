/*

  ram.v
  
  Represents a dual-port RAM.
  
  */

`include "src/defines.v"

module ram (
  input clk_cpu,
  input reset,
  input [`WORD] rd_adrs,
  input [`WORD] wr_adrs,
  input [`WORD] wr_data,
  input wr_en,
  output [`WORD] q
);

  // registers for RAM (the size defined by `N_RAM)
  reg [`WORD] ram[0:`N_RAM - 1];

  // reset and write data
  integer i;  
  always_ff @(posedge clk_cpu, posedge reset) begin
    if (reset) begin
      for (i = 0; i < `N_RAM; i = i + 1) begin
        ram[i] <= `B_WORD'd0;
      end
    end else 
      if (wr_en)
        ram[wr_adrs] <= wr_data;
  end

  // read ports  
  assign q = ram[rd_adrs];
  
endmodule
