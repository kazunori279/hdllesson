/*
 
  FourBitCPU_tb.v
  
  Tests FourBitCPU.v
  
 */

`include "defines.v"

module FourBitCPU_tb;

reg clk;
reg btn0_n;

// CPU instance
FourBitCPU FourBitCPU0(
  .clk(clk),
  .btn0_n(btn0_n)
);

// clock
initial begin
    clk = 0;
    forever #`HCYCL clk = !clk;
end

// test
initial begin
  
  // init regs
  btn0_n = 1;
  
  // reset
  test_reset_button();
  
end

// tasks
task test_reset_button;
begin
  btn0_n = 0;
  repeat(20) @(posedge clk);
  btn0_n = 1;
end
endtask

endmodule