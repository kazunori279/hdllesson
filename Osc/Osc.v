module Osc(
	input CLK,
	input nBTN,
	input MIDI_IN,
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

// MIDI decode
wire [23:0] midi_msg;
wire midi_msg_rdy;
MIDI midi(CLK, MIDI_IN, midi_msg, midi_msg_rdy); 

// Generates 8 polyphonic waves
PolyWaveGen polywavegen(CLK, midi_msg, midi_msg_rdy, outdat, LED);

// display MIDI note on LED
NoteDisplay notedisplay(CLK, midi_msg, midi_msg_rdy, nHEX0, nHEX1);

endmodule
