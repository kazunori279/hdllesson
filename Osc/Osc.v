module Osc(
	input CLK,
	input nBTN,
	output nCS,
	output SCK,
	output SDI
);

wire ICLK;
wire [7:0] WAVEDAT;
wire [7:0] OUTDAT;

Prescaler prescaler(CLK, ICLK);
WaveGen wavegen(CLK, WAVEDAT);
SPI spi(ICLK, OUTDAT, nCS, SDI);
assign SCK = ICLK;

// output the wave when button is pressed
assign OUTDAT = nBTN ? 0 : WAVEDAT;

endmodule
