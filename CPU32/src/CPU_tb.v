/*
 
  CPU_tb.v
  
  Tests CPU.v
  
 */

`include "src/defines.v"

module CPU_tb;

reg clk_cpu, clk_ram;
reg reset;
wire [31:0] pc, reg_dbg_q;

// CPU
CPU CPU0(
  .clk_cpu(clk_cpu),
  .clk_ram(clk_ram),
  .reset(reset),
  .reg_dbg_adrs(5'b0),
  .reg_dbg_q(reg_dbg_q)
);

// CPU clock
initial begin
  clk_cpu = 0;
  forever #`HCYCL clk_cpu = !clk_cpu;
end

// RAM clock
initial begin
  clk_ram = 0;
  forever #`MCYCL clk_ram = !clk_ram;
end

// test
initial begin
  
  // init regs
  reset = 0;
  
  // reset
  test_reset_button();
  
end

// test reset
task test_reset_button;
begin
  reset = 1;
  repeat(10) @(posedge clk_cpu);
  reset = 0;
end
endtask

endmodule