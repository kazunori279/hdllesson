module Osc(
	input CLK,
	input nBTN,
	input MIDI_IN,
	input SERIAL_IN,
	output nCS,
	output SCK,
	output SDI,
	output [7:0] nHEX0,
	output [7:0] nHEX1,
	output [9:0] LED
);

// Clock Prescaler
wire ICLK;
Prescaler prescaler(CLK, ICLK);

// SPI for DAC
wire [11:0] outdat;
SPI spi(ICLK, outdat, nCS, SDI);
assign SCK = ICLK;

// MIDI decoder
wire [23:0] midi_msg;
wire midi_msg_rdy;
MIDI midi(CLK, MIDI_IN, midi_msg, midi_msg_rdy); 

// Serial IF decoder
wire [7:0] sif_byte_in;
wire sif_byte_rdy;
SerialIf serialif(CLK, SERIAL_IN, sif_byte_in, sif_byte_rdy);

// UI Controller
wire [31:0] env_params;
UIController uicontroller(CLK, sif_byte_in, sif_byte_rdy, env_params, LED[0]);
assign LED[1] = 0;

// Generates 8 polyphonic waves
PolyWaveGen polywavegen(CLK, midi_msg, midi_msg_rdy, env_params, outdat, LED[9:2]);

// display MIDI note on LED
NoteDisplay notedisplay(CLK, midi_msg, midi_msg_rdy, nHEX0, nHEX1);

endmodule
