/*

  register_file.v
  
  Represents one register with specified bit width.
  
  */
  
module register_file (
  input   clk_cpu,
  input   reset,
  input   load,
  input   [`W-1:0] dat_in,
  output  [`W-1:0] dat_out
);

  reg [`W-1:0] register;
  
  always @(posedge clk_cpu or posedge reset) begin
    if (reset) begin
      register <= `W'd0;
    end else if (load) begin
      register <= dat_in;
    end
  end
  
  assign dat_out = register;

endmodule