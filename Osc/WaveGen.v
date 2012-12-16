module WaveGen (
	input CLK,
	input [23:0] MIDI_MSG,
	input MIDI_MSG_RDY,
	output MIDI_MSG_THRU,
	output NOTE_ON,
	output [7:0] DAT
);

// separate MIDI messages
wire [7:0] midi_status = MIDI_MSG[23:16];
wire [7:0] midi_data1 = MIDI_MSG[15:8];
wire [7:0] midi_data2 = MIDI_MSG[7:0];

// captures note on message on MIDI ch 0
reg note_on;
reg midi_msg_thru;
reg [15:0] current_steps;
reg [7:0] current_note;
always @(posedge CLK) begin
	if (MIDI_MSG_RDY) begin
		if (midi_status == 8'h90) begin // note-on msg
			if (note_on)
				midi_msg_thru = 1; // if this wg is buzy, pass thru the note-on msg
			else begin
				midi_msg_thru = 0; // if this wg is not busy, take the note-on msg
				note_on = 1; 
				current_note = midi_data1;
				current_steps = steps(midi_data1);
			end
		end
		else if (midi_status == 8'h80 && midi_data1 == current_note) begin // note-off msg
			midi_msg_thru = 1;
			note_on = 0;
		end else
			midi_msg_thru = 1;
	end else
		midi_msg_thru = 0;
end
assign NOTE_ON = note_on;
assign MIDI_MSG_THRU = midi_msg_thru;

// clock for each step
reg [15:0] cnt;
wire stepclk;
always @(posedge CLK) begin
	if (cnt == 0)
		cnt = current_steps;
	else 
		cnt = cnt - 1;
end
assign stepclk = cnt == 0;

// counter for each step
reg [6:0] stepcnt;
always @(posedge stepclk) begin
	if (stepcnt == 7'd127)
		stepcnt = 0;
	else
		stepcnt = stepcnt + 1;
end
assign DAT = note_on ? sin(stepcnt) : 0;

// sin table
function [7:0] sin;
	input [7:0] step;
	begin
		case (step)
			8'd0: sin=8'd128;
			8'd1: sin=8'd134;
			8'd2: sin=8'd140;
			8'd3: sin=8'd146;
			8'd4: sin=8'd152;
			8'd5: sin=8'd159;
			8'd6: sin=8'd165;
			8'd7: sin=8'd171;
			8'd8: sin=8'd176;
			8'd9: sin=8'd182;
			8'd10: sin=8'd188;
			8'd11: sin=8'd193;
			8'd12: sin=8'd199;
			8'd13: sin=8'd204;
			8'd14: sin=8'd209;
			8'd15: sin=8'd213;
			8'd16: sin=8'd218;
			8'd17: sin=8'd222;
			8'd18: sin=8'd226;
			8'd19: sin=8'd230;
			8'd20: sin=8'd234;
			8'd21: sin=8'd237;
			8'd22: sin=8'd240;
			8'd23: sin=8'd243;
			8'd24: sin=8'd246;
			8'd25: sin=8'd248;
			8'd26: sin=8'd250;
			8'd27: sin=8'd252;
			8'd28: sin=8'd253;
			8'd29: sin=8'd254;
			8'd30: sin=8'd255;
			8'd31: sin=8'd255;
			8'd32: sin=8'd255;
			8'd33: sin=8'd255;
			8'd34: sin=8'd255;
			8'd35: sin=8'd254;
			8'd36: sin=8'd253;
			8'd37: sin=8'd252;
			8'd38: sin=8'd250;
			8'd39: sin=8'd248;
			8'd40: sin=8'd246;
			8'd41: sin=8'd243;
			8'd42: sin=8'd240;
			8'd43: sin=8'd237;
			8'd44: sin=8'd234;
			8'd45: sin=8'd230;
			8'd46: sin=8'd226;
			8'd47: sin=8'd222;
			8'd48: sin=8'd218;
			8'd49: sin=8'd213;
			8'd50: sin=8'd209;
			8'd51: sin=8'd204;
			8'd52: sin=8'd199;
			8'd53: sin=8'd193;
			8'd54: sin=8'd188;
			8'd55: sin=8'd182;
			8'd56: sin=8'd176;
			8'd57: sin=8'd171;
			8'd58: sin=8'd165;
			8'd59: sin=8'd159;
			8'd60: sin=8'd152;
			8'd61: sin=8'd146;
			8'd62: sin=8'd140;
			8'd63: sin=8'd134;
			8'd64: sin=8'd127;
			8'd65: sin=8'd121;
			8'd66: sin=8'd115;
			8'd67: sin=8'd109;
			8'd68: sin=8'd102;
			8'd69: sin=8'd96;
			8'd70: sin=8'd90;
			8'd71: sin=8'd84;
			8'd72: sin=8'd78;
			8'd73: sin=8'd73;
			8'd74: sin=8'd67;
			8'd75: sin=8'd62;
			8'd76: sin=8'd56;
			8'd77: sin=8'd51;
			8'd78: sin=8'd46;
			8'd79: sin=8'd42;
			8'd80: sin=8'd37;
			8'd81: sin=8'd33;
			8'd82: sin=8'd29;
			8'd83: sin=8'd25;
			8'd84: sin=8'd21;
			8'd85: sin=8'd18;
			8'd86: sin=8'd15;
			8'd87: sin=8'd12;
			8'd88: sin=8'd9;
			8'd89: sin=8'd7;
			8'd90: sin=8'd5;
			8'd91: sin=8'd3;
			8'd92: sin=8'd2;
			8'd93: sin=8'd1;
			8'd94: sin=8'd0;
			8'd95: sin=8'd0;
			8'd96: sin=8'd0;
			8'd97: sin=8'd0;
			8'd98: sin=8'd0;
			8'd99: sin=8'd1;
			8'd100: sin=8'd2;
			8'd101: sin=8'd3;
			8'd102: sin=8'd5;
			8'd103: sin=8'd7;
			8'd104: sin=8'd9;
			8'd105: sin=8'd12;
			8'd106: sin=8'd15;
			8'd107: sin=8'd18;
			8'd108: sin=8'd21;
			8'd109: sin=8'd25;
			8'd110: sin=8'd29;
			8'd111: sin=8'd33;
			8'd112: sin=8'd37;
			8'd113: sin=8'd42;
			8'd114: sin=8'd46;
			8'd115: sin=8'd51;
			8'd116: sin=8'd56;
			8'd117: sin=8'd62;
			8'd118: sin=8'd67;
			8'd119: sin=8'd73;
			8'd120: sin=8'd79;
			8'd121: sin=8'd84;
			8'd122: sin=8'd90;
			8'd123: sin=8'd96;
			8'd124: sin=8'd103;
			8'd125: sin=8'd109;
			8'd126: sin=8'd115;
			8'd127: sin=8'd121;
			default: sin=8'd128;
		endcase
	end
endfunction

// pitch table
function [15:0] steps;
	input [7:0] note;
	begin
		case (note)
			0: steps=47778;
			1: steps=45096;
			2: steps=42565;
			3: steps=40176;
			4: steps=37921;
			5: steps=35793;
			6: steps=33784;
			7: steps=31888;
			8: steps=30098;
			9: steps=28409;
			10: steps=26814;
			11: steps=25309;
			12: steps=23889;
			13: steps=22548;
			14: steps=21282;
			15: steps=20088;
			16: steps=18960;
			17: steps=17896;
			18: steps=16892;
			19: steps=15944;
			20: steps=15049;
			21: steps=14204;
			22: steps=13407;
			23: steps=12654;
			24: steps=11944;
			25: steps=11274;
			26: steps=10641;
			27: steps=10044;
			28: steps=9480;
			29: steps=8948;
			30: steps=8446;
			31: steps=7972;
			32: steps=7524;
			33: steps=7102;
			34: steps=6703;
			35: steps=6327;
			36: steps=5972;
			37: steps=5637;
			38: steps=5320;
			39: steps=5022;
			40: steps=4740;
			41: steps=4474;
			42: steps=4223;
			43: steps=3986;
			44: steps=3762;
			45: steps=3551;
			46: steps=3351;
			47: steps=3163;
			48: steps=2986;
			49: steps=2818;
			50: steps=2660;
			51: steps=2511;
			52: steps=2370;
			53: steps=2237;
			54: steps=2111;
			55: steps=1993;
			56: steps=1881;
			57: steps=1775;
			58: steps=1675;
			59: steps=1581;
			60: steps=1493;
			61: steps=1409;
			62: steps=1330;
			63: steps=1255;
			64: steps=1185;
			65: steps=1118;
			66: steps=1055;
			67: steps=996;
			68: steps=940;
			69: steps=887;
			70: steps=837;
			71: steps=790;
			72: steps=746;
			73: steps=704;
			74: steps=665;
			75: steps=627;
			76: steps=592;
			77: steps=559;
			78: steps=527;
			79: steps=498;
			80: steps=470;
			81: steps=443;
			82: steps=418;
			83: steps=395;
			84: steps=373;
			85: steps=352;
			86: steps=332;
			87: steps=313;
			88: steps=296;
			89: steps=279;
			90: steps=263;
			91: steps=249;
			92: steps=235;
			93: steps=221;
			94: steps=209;
			95: steps=197;
			96: steps=186;
			97: steps=176;
			98: steps=166;
			99: steps=156;
			100: steps=148;
			101: steps=139;
			102: steps=131;
			103: steps=124;
			104: steps=117;
			105: steps=110;
			106: steps=104;
			107: steps=98;
			108: steps=93;
			109: steps=88;
			110: steps=83;
			111: steps=78;
			112: steps=74;
			113: steps=69;
			114: steps=65;
			115: steps=62;
			116: steps=58;
			117: steps=55;
			118: steps=52;
			119: steps=49;
			120: steps=46;
			121: steps=44;
			122: steps=41;
			123: steps=39;
			124: steps=37;
			125: steps=34;
			126: steps=32;
			127: steps=31;
		endcase
	end
endfunction	
endmodule