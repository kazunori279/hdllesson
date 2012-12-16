module PolyWaveGen(
	input CLK,
	input [23:0] MIDI_MSG,
	input MIDI_MSG_RDY,
	output [11:0] OUTDAT,
	output [9:0] NOTE_ON_LED
);

// generates 8 polyphonic waves
wire [7:0] midi_msg_thru;
wire [7:0] wg_dat0, wg_dat1, wg_dat2, wg_dat3, wg_dat4, wg_dat5, wg_dat6, wg_dat7;
WaveGen wg0(CLK, MIDI_MSG, MIDI_MSG_RDY, midi_msg_thru[0], NOTE_ON_LED[9], wg_dat0);
WaveGen wg1(CLK, MIDI_MSG, midi_msg_thru[0], midi_msg_thru[1], NOTE_ON_LED[8], wg_dat1);
WaveGen wg2(CLK, MIDI_MSG, midi_msg_thru[1], midi_msg_thru[2], NOTE_ON_LED[7], wg_dat2);
WaveGen wg3(CLK, MIDI_MSG, midi_msg_thru[2], midi_msg_thru[3], NOTE_ON_LED[6], wg_dat3);
WaveGen wg4(CLK, MIDI_MSG, midi_msg_thru[3], midi_msg_thru[4], NOTE_ON_LED[5], wg_dat4);
WaveGen wg5(CLK, MIDI_MSG, midi_msg_thru[4], midi_msg_thru[5], NOTE_ON_LED[4], wg_dat5);
WaveGen wg6(CLK, MIDI_MSG, midi_msg_thru[5], midi_msg_thru[6], NOTE_ON_LED[3], wg_dat6);
WaveGen wg7(CLK, MIDI_MSG, midi_msg_thru[6], midi_msg_thru[7], NOTE_ON_LED[2], wg_dat7);
assign OUTDAT = wg_dat0 + wg_dat1 + wg_dat2 + wg_dat3 + wg_dat4 + wg_dat5 + wg_dat6 + wg_dat7;
assign NOTE_ON_LED[1] = 0;
assign NOTE_ON_LED[0] = 0;

endmodule
