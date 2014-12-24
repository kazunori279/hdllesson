module Top 
(
	input clk,
	input reset_n,
	output [9:0] addr,
	inout [7:0] data,
	inout [7:0] data_unused,
	output cs_n,
	output rd_n,
	output wr_n,
	input int_n,
	output res_n,
	input [3:0] brdy,
	output bit16en,
	
	output LED0,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
	output LED6,
	output LED7,
	output LED8,
	output LED9,	
	
	input LINKLED_N,
	input TXLED_N,
	input RXLED_N,
	input COLLED_N,
	input FDXLED_N,
	input SPDLED_N,
	input ACTLED_N,
	
	output [7:0] hex0,
	output [7:0] hex1,
	output [7:0] hex2,
	output [7:0] hex3,
	
	input midi_in
);

// reset
wire reset;
assign reset = ~reset_n;
assign data_unused = 8'bzzzzzzzz;

// WIZ LED etc
assign bit16en = 1'b0;
assign LED9 = !LINKLED_N;
assign LED8 = !TXLED_N;
assign LED7 = !RXLED_N;
assign LED6 = !COLLED_N;
assign LED5 = !FDXLED_N;
assign LED4 = !SPDLED_N;
assign LED3 = !ACTLED_N;
assign LED2 = 1'b0;
assign LED1 = 1'b0;
assign LED0 = 1'b0;

WIZ830MJ_Test wiz0
(
  .clk(clk),
  .reset(reset),
  .class_wiz830mj_0000_ADDR_exp(addr),
  .class_wiz830mj_0000_DATA_exp(data),
  .class_wiz830mj_0000_nCS_exp(cs_n),
  .class_wiz830mj_0000_nRD_exp(rd_n),
  .class_wiz830mj_0000_nWR_exp(wr_n),
  .class_wiz830mj_0000_nINT_exp(int_n),
  .class_wiz830mj_0000_nRESET_exp(res_n),
  .class_wiz830mj_0000_BRDY_exp(brdy),
  .test_req(1'b1),
  .length_out(length),
  .midi_msg_in(midi_msg),
  .midi_msg_we(midi_msg_rdy),
);

// MIDI input
wire [23:0] midi_msg;
wire midi_msg_rdy;
MIDI midi0 (
	.CLK(clk),
	.MIDI_IN(midi_in),
	.MIDI_MSG(midi_msg),
	.MIDI_MSG_RDY(midi_msg_rdy)
);

// length counter display
wire [31:0] length;

led_decoder hex_dec0 (
	.dat_in(length[3:0]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex2)
);

led_decoder hex_dec1 (
	.dat_in(length[7:4]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex3)
);

/**
led_decoder hex_dec2 (
	.dat_in(length[11:8]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex2)
);

led_decoder hex_dec3 (
	.dat_in(length[15:12]),
	.dot_in(1'b0),
	.en(1'b1),
	.led_n(hex3)
);
**/

// midi note display
NoteDisplay note_display0(
	.CLK(clk),
	.MIDI_MSG(midi_msg),
	.MIDI_MSG_RDY(midi_msg_rdy),
	.nHEX0(hex0),
	.nHEX1(hex1)
);



endmodule