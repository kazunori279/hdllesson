/*
 * clock_prescaler.v
 */


module clock_prescaler (
  input   clk,
  input   reset,
  output  clk_cpu
);

  reg [31:0] cnt = 32'd0;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      cnt <= 32'd0;
    end else if (cnt == `CPU_CLK_PRESCALE) begin
      cnt <= 32'd0;
    end else begin
      cnt <= cnt + 32'd1;
    end
  end
  
  assign clk_cpu = (cnt == 32'd0);

endmodule