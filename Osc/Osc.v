module Osc(
	input CLK,
	input nBTN,
	input MIDI_IN,
	output nCS,
	output SCK,
	output SDI,
	output [7:0] nHEX0,
	output [7:0] nHEX1	
);

// Clock Prescaler
wire ICLK;
Prescaler prescaler(CLK, ICLK);

// Wave Generator & SPI for DAC
wire [7:0] wavedat;
wire [7:0] outdat;
WaveGen wavegen(CLK, wavedat);
SPI spi(ICLK, outdat, nCS, SDI);
assign SCK = ICLK;

// output the wave when button is pressed
assign outdat = nBTN ? 0 : wavedat;

// MIDI decode
wire [7:0] midi_status;
wire [7:0] midi_data1;
wire [7:0] midi_data2;
wire midi_msg_rdy;
MIDI midi(CLK, MIDI_IN, midi_status, midi_data1, midi_data2, midi_msg_rdy); 

// display MIDI note on LED
NoteDisplay notedisplay(CLK, midi_status, midi_data1, midi_data2, midi_msg_rdy, nHEX0, nHEX1);

endmodule
