module Top
(
  input  clk,
  input  reset_n,
  input  btn1_n,
  input  btn2_n,
  output [7:0] hex0,
  output [7:0] hex1,
  output [7:0] hex2,
  output [7:0] hex3
);

// Fibonacci Main

wire signed [31:0] result;
wire reset;
assign reset = ~reset_n;

com_example_fib_Main main0
(
  .clk(clk),
  .reset(reset),
  .result_return(result)
);

// Timer

reg [31:0] timer;

always @(posedge clk or posedge reset) begin
  if (reset) begin;
    timer <= 32'd0;
  end else if (result != 32'd267914296) begin // fib(42) = 267914296
	   timer <= timer + 32'd1;
  end
end

// LED display for Timer

wire [15:0] value;

assign value = (btn1_n ? timer : result) >> (btn2_n ? 0 : 16);

led_decoder hex_dec0 (
	.dat_in(value[3:0]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex0)
);

led_decoder hex_dec1 (
	.dat_in(value[7:4]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex1)
);

led_decoder hex_dec2 (
	.dat_in(value[11:8]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex2)
);

led_decoder hex_dec3 (
	.dat_in(value[15:12]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex3)
);

endmodule
