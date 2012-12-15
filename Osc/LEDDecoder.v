module LEDDecoder (
	input [3:0] NUM,
	input ENABLED,
	output reg [7:0] nHEX
);

always @* begin
	if (ENABLED)
		case (NUM)
			4'h0: nHEX = 8'b11000000;
			4'h1: nHEX = 8'b11111001;
			4'h2: nHEX = 8'b10100100;
			4'h3: nHEX = 8'b10110000;
			4'h4: nHEX = 8'b10011001;
			4'h5: nHEX = 8'b10010010;
			4'h6: nHEX = 8'b10000010;
			4'h7: nHEX = 8'b11011000;
			4'h8: nHEX = 8'b10000000;
			4'h9: nHEX = 8'b10010000;
			4'ha: nHEX = 8'b10001000;
			4'hb: nHEX = 8'b10000011;
			4'hc: nHEX = 8'b11000110;
			4'hd: nHEX = 8'b10100001;
			4'he: nHEX = 8'b10000110;
			4'hf: nHEX = 8'b10001110;
		endcase
	else
		nHEX = 8'b11111111;
end

endmodule