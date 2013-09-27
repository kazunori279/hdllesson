/*
 
  FourBitCPU.v
  
  The top level module for the simple 4 bit CPU.
  
 */

`include "defines.v"

module FourBitCPU (
  input   clk,
  input   btn0_n,
  input   [3:0] io_in,
  output  [3:0] io_out,
  output  [7:0] led0_n,
  output  [7:0] led1_n,
  output  [7:0] led2_n,
  output  [7:0] led3_n
);

  // reset signal
  wire reset;
  chattering_canceler chattering_canceler0(
    .clk(clk), 
    .dat_in_n(btn0_n), 
    .dat_out(reset)
  );

  // cpu clock prescaling
  wire clk_cpu, clk_stp;
  clock_prescaler clock_prescaler0(
    .clk(clk), 
    .reset(reset), 
    .clk_cpu(clk_cpu),
    .clk_stp(clk_stp)
  );
  
  // instruction rom
  wire [7:0] inst;
  wire [3:0] pc;
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
    .io_in(io_in),
    .pc(pc),
    .io_out(io_out)
  );
  
  // LED display (pc and inst)
  led_decoder led_decoder3(pc, clk_cpu, 1'b1, led3_n);
  led_decoder led_decoder2(4'b0000, 1'b0, 1'b0, led2_n);
  led_decoder led_decoder1(inst[7:4], 1'b0, 1'b1, led1_n);
  led_decoder led_decoder0(inst[3:0], 1'b0, 1'b1, led0_n);
  
endmodule