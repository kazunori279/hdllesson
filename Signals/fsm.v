/** fsm.v **/

module fsm(
	input clk,
	input reset,
	input traf_a,
	input traf_b,
	output [2:0] lit_a,
	output [2:0] lit_b
);

	// states
	reg [1:0] sig_state, sig_next_state;

	// state changes
	always @(posedge clk, posedge reset) begin
		if (reset)
			sig_state <= `SIG_LA_GREEN;
		else
			sig_state <= sig_next_state;
	end

	// next states
	always @(*)
		case (sig_state)
			`SIG_LA_GREEN:	sig_next_state = traf_a ? `SIG_LA_GREEN : `SIG_LA_YELLOW;
			`SIG_LA_YELLOW: sig_next_state = `SIG_LB_GREEN;
			`SIG_LB_GREEN: 	sig_next_state = traf_b ? `SIG_LB_GREEN : `SIG_LB_YELLOW;
			`SIG_LB_YELLOW: sig_next_state = `SIG_LA_GREEN;
			default:		sig_next_state = `SIG_LA_GREEN;
		endcase
	
	// output light colors by current state
	assign lit_a = 
		(sig_state == `SIG_LA_GREEN) ? `LIT_GREEN :
		(sig_state == `SIG_LA_YELLOW) ? `LIT_YELLOW :
		`LIT_RED;
		
	assign lit_b = 
		(sig_state == `SIG_LB_GREEN) ? `LIT_GREEN :
		(sig_state == `SIG_LB_YELLOW) ? `LIT_YELLOW :
		`LIT_RED;

endmodule
