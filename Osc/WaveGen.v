module WaveGen (
	input CLK,
	output [7:0] DAT
);

	// clock for each step
	// 50Mhz / 440Hz / 128 = 887.78 
	reg [11:0] cnt;
	wire stepclk;
	always @(posedge CLK) begin
		if (cnt == 12'd888) 
			cnt = 0;
		else 
			cnt = cnt + 1;
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
	assign DAT = sin(stepcnt);

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
	
endmodule