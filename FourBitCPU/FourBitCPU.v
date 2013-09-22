/*
 
  FourBitCPU.v
  
  The top level module for the simple 4 bit CPU.
  
 */

`include "defines.v"

module FourBitCPU (
  input   clk,
  input   btn0_n
);

  // reset signal
  wire reset;
  chattering_canceler chattering_canceler0(
    .clk(clk), 
    .dat_in_n(btn0_n), 
    .dat_out(reset)
  );

  // cpu clock prescaling
  wire clk_cpu;
  clock_prescaler clock_prescaler0(
    .clk(clk), 
    .reset(reset), 
    .clk_cpu(clk_cpu)
  );
  
  // instruction rom
  wire [7:0] inst;
  rom rom0(
    .clk_cpu(clk_cpu), 
    .reset(reset), 
    .adrs(pc), 
    .dat_out(inst)
  );
  
  // CPU
  CPU CPU0(
    .clk_cpu(clk_cpu),
    .reset(reset),
    .inst(inst),
    .pc(pc)
  );
endmodule