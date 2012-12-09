module SPI (
	input ICLK,
	input [7:0] DAT,
	output nCS,
	output SDI
);

	// base 18 counter
	reg [4:0] cnt;
	always @(posedge ICLK) begin
		if (cnt == 5'd17)
			cnt = 0;
		else
			cnt = cnt + 1;
	end

	// CS
	reg cs;
	always @(negedge ICLK) begin
		if (cnt == 5'd17)
			cs = 1'b1;
		if (cnt == 5'd15)
			cs = 1'b0;			
	end
	assign nCS = ~cs;
	
	// 16 bit shift register
	reg [15:0] sreg;
	always @(negedge ICLK) begin
		if (cnt == 5'd17) begin
			// load command and data into sreg
			sreg = {4'b1111, DAT, 4'b0000};
		end
		else begin
			// shift
			sreg = {sreg[14:0], 1'b0};
		end
	end
	
	// SDI
	assign SDI = sreg[15];

endmodule
