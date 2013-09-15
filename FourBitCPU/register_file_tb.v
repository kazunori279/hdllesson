/*

  register_file_tb.v
  
  Tests register_file.v

 */

`include "defines.v"

module register_file_tb;
  
reg clk_cpu;
reg reset;
reg load;
reg [3:0] dat_in;
wire [3:0] dat_out;
integer i;

register_file register_file0(
  .clk_cpu(clk_cpu),
  .reset(reset),
  .load(load),
  .dat_in(dat_in),
  .dat_out(dat_out)
);

// clock
initial
begin
    clk_cpu = 0;
    forever #`HCYCL clk_cpu = !clk_cpu;
end

// test
initial begin
  
  // reset
  repeat(5) @(posedge clk_cpu);
  test_reset();
  
  // load sequential values
  repeat(5) @(posedge clk_cpu);
  dat_in = 0;
  repeat(20) begin
    test_load(dat_in + 1);
  end
  
  // reset
  repeat(5) @(posedge clk_cpu);
  test_reset();
end

// tasks
task test_reset; 
begin
  reset = 1;
  load = 0;
  repeat(5) @(posedge clk_cpu)
    if (dat_out != 4'd0)
      $display("test_reset_register_file: dat_out is not zero");
  reset = 0;
end
endtask

task test_load; 
input [3:0] dat_next;
begin
  @(negedge clk_cpu) begin
    load = 1;
    dat_in = dat_next;
  end
  @(negedge clk_cpu) begin
    load = 0;
    #`HSTRB;
    if (dat_out != dat_in)
      $display("test_load: dat_out is not equal to dat_in");
  end
end
endtask

endmodule