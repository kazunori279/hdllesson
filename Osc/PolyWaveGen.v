module PolyWaveGen(
	input CLK,
	input [23:0] MIDI_MSG,
	input MIDI_MSG_RDY,
	input [31:0] ENV_PARAMS,
	output [11:0] OUTDAT,
	output [7:0] NOTE_ON_LED
);

// generates 8 polyphonic waves
wire [7:0] midi_msg_thru;
wire [7:0] wg_dat0, wg_dat1, wg_dat2, wg_dat3, wg_dat4, wg_dat5, wg_dat6, wg_dat7;
wire [31:0] env_params = ENV_PARAMS;
WaveGen wg0(CLK, MIDI_MSG, MIDI_MSG_RDY, env_params, midi_msg_thru[0], NOTE_ON_LED[7], wg_dat0);
WaveGen wg1(CLK, MIDI_MSG, midi_msg_thru[0], env_params, midi_msg_thru[1], NOTE_ON_LED[6], wg_dat1);
WaveGen wg2(CLK, MIDI_MSG, midi_msg_thru[1], env_params, midi_msg_thru[2], NOTE_ON_LED[5], wg_dat2);
WaveGen wg3(CLK, MIDI_MSG, midi_msg_thru[2], env_params, midi_msg_thru[3], NOTE_ON_LED[4], wg_dat3);
WaveGen wg4(CLK, MIDI_MSG, midi_msg_thru[3], env_params, midi_msg_thru[4], NOTE_ON_LED[3], wg_dat4);
WaveGen wg5(CLK, MIDI_MSG, midi_msg_thru[4], env_params, midi_msg_thru[5], NOTE_ON_LED[2], wg_dat5);
WaveGen wg6(CLK, MIDI_MSG, midi_msg_thru[5], env_params, midi_msg_thru[6], NOTE_ON_LED[1], wg_dat6);
WaveGen wg7(CLK, MIDI_MSG, midi_msg_thru[6], env_params, midi_msg_thru[7], NOTE_ON_LED[0], wg_dat7);
assign OUTDAT = wg_dat0 + wg_dat1 + wg_dat2 + wg_dat3 + wg_dat4 + wg_dat5 + wg_dat6 + wg_dat7;

endmodule
