module SerialIf(
	input CLK,
	input SERIAL_IN,
	output [7:0] BYTE_OUT,
	output BYTE_RDY
);

// sampling clock
// 50MHz / 6 = 8.33Mbps (921.6Kbps x 9 over sampling)
reg [3:0] sp_cnt;
reg sp_clk;
always @(posedge CLK) begin
	if (sp_cnt == 6) begin
		sp_cnt = 0;
		sp_clk = 1;
	end else begin
		sp_cnt = sp_cnt + 1;
		sp_clk = 0;
	end
end

// decoding SERIAL_IN
reg [7:0] dec_cnt;
reg [7:0] dec_reg;
always @(posedge CLK) begin
	if (sp_clk) begin
		case (dec_cnt)
			0, 1, 2, 3: // wait for a start bit
				if (SERIAL_IN) begin
					dec_cnt = 0;
					dec_reg = 0;
				end else
					dec_cnt = dec_cnt + 1;
			11, 19, 27, 35, 42, 50, 58, 66: // sampling data bits
				begin
					dec_reg = {SERIAL_IN, dec_reg[7:1]}; // right shift
					dec_cnt = dec_cnt + 1;
				end
			74: // stop bit
					dec_cnt = 0;
			default:
				dec_cnt = dec_cnt + 1;
		endcase
	end
end
assign BYTE_RDY = sp_clk & dec_cnt == 70;
assign BYTE_OUT = dec_reg;
endmodule