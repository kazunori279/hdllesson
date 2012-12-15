/*
 * Shows MIDI note number on HEX LED Display
 */
module NoteDisplay (
	input CLK,
	input [7:0] MIDI_STATUS,
	input [7:0] MIDI_DATA1,
	input [7:0] MIDI_DATA2,
	input MIDI_MSG_RDY,
	output [7:0] nHEX0,
	output [7:0] nHEX1
);

// captures note on message on MIDI ch 0
reg [7:0] note_number;
reg note_on;
always @(posedge CLK) begin
	if (MIDI_MSG_RDY && MIDI_STATUS == 8'h90) begin
		note_on = 1;
		note_number = MIDI_DATA1;
	end
	if (MIDI_MSG_RDY && MIDI_STATUS == 8'h80) begin
		note_on = 0;
		note_number = 0;
	end
end

// display on LED
LEDDecoder ld_l(note_number[3:0], note_on, nHEX0);
LEDDecoder ld_h(note_number[7:4], note_on, nHEX1);

endmodule
