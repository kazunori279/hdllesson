module UIController (
	input CLK,
	input [7:0] BYTE_IN,
	input BYTE_RDY,
	output [31:0] ENV_PARAMS,
	output LED
);

// decoding UI commands
reg [2:0] dec_st; // decode status
reg [7:0] ui_cmd; // UI command byte
reg [31:0] ui_dat; // UI command operand
reg ui_cmd_decoded;
always @(posedge CLK) begin	
	if (BYTE_RDY) begin
		case (dec_st)
		
			0: begin // every command should start with 0xFF
				ui_cmd_decoded <= 0;
				if (BYTE_IN == 8'hFF)
					dec_st <= 1;
			end
					
			1: begin // read UI command
				ui_cmd <= BYTE_IN;
				dec_st <= 2;
			end
			
			default: begin // read UI data (st = 2, 3, 4, 5)
				ui_dat <= {ui_dat[23:0], BYTE_IN};
				if (dec_st != 5)
					dec_st <= dec_st + 1;
				else begin
					dec_st <= 0;
					ui_cmd_decoded = 1;
				end
			end
			
		endcase
	end
end

// generating one-shot trigger for ui_cmd_rdy
reg [1:0] ui_cmd_decoded_shift;
always @(posedge CLK) begin
  ui_cmd_decoded_shift <= {ui_cmd_decoded_shift[0], ui_cmd_decoded};
end
wire ui_cmd_rdy = ui_cmd_decoded_shift[0] & ~ui_cmd_decoded_shift[1];

// executing UI commands
reg [31:0] env_params;
always @(posedge CLK) begin
	if (ui_cmd_rdy)
		case (ui_cmd)
			8'h01: // 0x01 = setting ADSR
				env_params <= ui_dat;
		endcase
end
assign ENV_PARAMS = env_params;

// Blink LED for 0.1s for each UI command execution
reg [23:0] led_cnt;
always @(posedge CLK) begin
	if (ui_cmd_rdy)
		led_cnt <= 5000000;
	else if (led_cnt != 0)
		led_cnt <= led_cnt - 1;
end
assign LED = led_cnt != 0;

endmodule
