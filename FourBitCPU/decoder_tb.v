/*

  decoder_tb.v
  
  Tests decoder.v

 */

`include "defines.v"

module decoder_tb;

reg clk_cpu;

reg [3:0] op_in;
wire [1:0] alu_data_sel;
wire reg_a_load;
wire reg_b_load;
wire [3:0] decoded_out;

// decoder instance
decoder decoder0(
  .op_in(op_in),
  .alu_data_sel(alu_data_sel),
  .reg_a_load(reg_a_load),
  .reg_b_load(reg_b_load),
  .decoded_out(decoded_out)
);
  
// clock
initial begin
    clk_cpu = 0;
    forever #`HCYCL clk_cpu = !clk_cpu;
end

// test
initial begin
  test_op(`OP_NOP, {`SEL_A, 1'b0, 1'b0});
  test_op(`OP_ADD_A_IM, {`SEL_A, 1'b1, 1'b0});
  test_op(`OP_ADD_B_IM, {`SEL_B, 1'b0, 1'b1});
end

// tasks
task test_op;
input [3:0] test_op_in;
input [3:0] test_decoded_out;
begin
  @(posedge clk_cpu) begin
    op_in = test_op_in;
    #`HSTRB;
    if ({alu_data_sel, reg_a_load, reg_b_load} != test_decoded_out)
      $display("test_op: decoded_out mismatch");
  end
end
endtask

endmodule

