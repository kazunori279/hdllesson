/** Signals.v **/

`include "defines.v"
/**
 
	Traffic Signal simulation by a simple finite state machine
	based on the book "Digital Design and Computer Architecture"
	
 **/

module Signals (
	input clk,
	input n_btn0,
	input n_btn1,
	input n_btn2,
	output [5:0] n_led
);

	// button inputs
	wire reset, traf_a, traf_b;
	button_input BTN0(.clk(clk), .dat_in(n_btn0), .dat_out(reset));
	button_input BTN1(.clk(clk), .dat_in(n_btn1), .dat_out(traf_a));
	button_input BTN2(.clk(clk), .dat_in(n_btn2), .dat_out(traf_b));
	
	// clock prescaler
	parameter PRESCALE_CNT = 32'd10;
	reg [31:0] cnt = 32'd0;
	reg fsm_clk = 0;
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			cnt <= 32'd0;
			fsm_clk <= 1'b0;
		end else begin
			cnt <= cnt == PRESCALE_CNT ? 32'd0 : cnt + 1;
			fsm_clk <= cnt == 32'd0;
		end
	end
	
	// signal FSM
	wire [2:0] lit_a, lit_b;
	fsm FSM_1 (.clk(fsm_clk), .reset(reset), .traf_a(traf_a), .traf_b(traf_b), .lit_a(lit_a), .lit_b(lit_b));
	
	// outputs
	assign n_led = {lit_a, lit_b};


endmodule

