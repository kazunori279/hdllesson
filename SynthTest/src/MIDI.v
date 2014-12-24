module MIDI (
	input CLK,
	input MIDI_IN,
	output [23:0] MIDI_MSG,
	output MIDI_MSG_RDY
);

// sampling clock
// 50MHz / 400 = 125Kbps (31.25Kbps x 4 over sampling)
reg [8:0] sp_cnt;
always @(posedge CLK) begin
	if (sp_cnt == 400)
		sp_cnt = 0;
	else
		sp_cnt = sp_cnt + 1;
end
wire sp_clk;
assign sp_clk = sp_cnt == 0;

// decoding MIDI_IN
reg [5:0] dec_cnt;
reg [7:0] dec_reg;
always @(posedge CLK) begin
	if (sp_clk) begin
		case (dec_cnt)
			0, 1, 2: // wait for a start bit
				if (MIDI_IN) begin
					dec_cnt = 0;
					dec_reg = 0;
				end else
					dec_cnt = dec_cnt + 1;
			6, 10, 14, 18, 22, 26, 30, 34: // sampling data bits
				begin
					dec_reg = {MIDI_IN, dec_reg[7:1]}; // right shift
					dec_cnt = dec_cnt + 1;
				end
			38: // stop bit
					dec_cnt = 0;
			default:
				dec_cnt = dec_cnt + 1;
		endcase
	end
end
wire dec_done; // decoding a byte finished
assign dec_done = sp_clk & dec_cnt == 36;

// construct a MIDI message
reg [1:0] midi_msg_cnt;
reg [7:0] midi_status;
reg [7:0] midi_data1;
reg [7:0] midi_data2;
always @(posedge CLK) begin
	if (dec_done) begin
		case (midi_msg_cnt)
			0: begin
				midi_status = dec_reg;
				midi_msg_cnt = midi_msg_cnt + 1;
			end
			1: begin
				midi_data1 = dec_reg;
				midi_msg_cnt = midi_msg_cnt + 1;
			end
			2: begin
				midi_data2 = dec_reg;
				midi_msg_cnt = 0;
			end
		endcase
	end 
end
assign MIDI_MSG = {midi_status, midi_data1, midi_data2};
assign midi_msg_rdy = dec_cnt == 38 & midi_msg_cnt == 0;

// generate one shot trigger when midi message is ready
reg [8:0] midi_msg_rdy_cnt;
always @(posedge CLK) begin
	if (midi_msg_rdy) begin
		if (midi_msg_rdy_cnt == 400)
			midi_msg_rdy_cnt = 0;
		else
			midi_msg_rdy_cnt = midi_msg_rdy_cnt + 1;
	end else
		midi_msg_rdy_cnt = 0;
end
assign MIDI_MSG_RDY = midi_msg_rdy_cnt == 1;

endmodule
