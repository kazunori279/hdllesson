/*
 * clock_prescaler.v
 */

`include "src/defines.v"

module clock_prescaler (
  input   clk,
  output  reg clk_cpu,
  output  reg clk_stp
);

  reg [31:0] cnt = 32'd0;
  
  always @(posedge clk) begin
    if (cnt == `CPU_CLK_PRESCALE) begin
      cnt <= 32'd0;
    end else begin
      cnt <= cnt + 32'd1;
    end
  end

  // clk_cpu register (clock for cpu)
  always @(posedge clk) begin
    clk_cpu <= cnt < (`CPU_CLK_PRESCALE / 2);
  end
  
  // clk_stp register (clock for SignalTap)
  always @(posedge clk) begin
    clk_stp <= cnt[21:21];
  end
  

endmodule