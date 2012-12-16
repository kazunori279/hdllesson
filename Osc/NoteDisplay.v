/*
 * Shows MIDI note number on HEX LED Display
 */
module NoteDisplay (
	input CLK,
	input [23:0] MIDI_MSG,
	input MIDI_MSG_RDY,
	output [7:0] nHEX0,
	output [7:0] nHEX1
);

// separate MIDI messages
wire [7:0] midi_status = MIDI_MSG[23:16];
wire [7:0] midi_data1 = MIDI_MSG[15:8];
wire [7:0] midi_data2 = MIDI_MSG[7:0];

// captures note on message on MIDI ch 0
reg [7:0] note_number;
reg note_on;
always @(posedge CLK) begin
	if (MIDI_MSG_RDY && midi_status == 8'h90) begin
		note_on = 1;
		note_number = midi_data1;
	end
	if (MIDI_MSG_RDY && midi_status == 8'h80) begin
		note_on = 0;
		note_number = 0;
	end
end

// display on LED
LEDDecoder ld_l(note_number[3:0], note_on, nHEX0);
LEDDecoder ld_h(note_number[7:4], note_on, nHEX1);

endmodule
