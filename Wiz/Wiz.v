module Wiz (

	RST_N,
	CLK,
	
	LED0,
	LED1,
	LED2,
	LED3,
	LED4,
	LED5,
	LED6,
	LED7,
	LED8,
	LED9,
	
	SDRAM_DQ,
	SDRAM_ADDR,
	SDRAM_LDQM,
	SDRAM_UDQM,
	SDRAM_WE_N,
	SDRAM_CAS_N,
	SDRAM_RAS_N,
	SDRAM_CS_N,
	SDRAM_BA_0,
	SDRAM_BA_1,
	SDRAM_CLK,
	SDRAM_CKE,
	
	WIZ_RESET_N,
	WIZ_BRDY,
	
	WIZ_LINKLED_N,
	WIZ_TXLED_N,
	WIZ_RXLED_N,
	WIZ_COLLED_N,
	WIZ_FDXLED_N,
	WIZ_SPDLED_N,
	WIZ_ACTLED_N,

	WIZ_BIT16EN,
	WIZ_A,
	WIZ_D,
	WIZ_CS_N,
	WIZ_RD_N,
	WIZ_WR_N,
	WIZ_INT_N
);

input		CLK, RST_N;
output 	LED0;
output 	LED1;
output 	LED2;
output 	LED3;
output 	LED4;
output 	LED5;
output 	LED6;
output 	LED7;
output 	LED8;
output 	LED9;

inout [15:0] SDRAM_DQ;
output [11:0] SDRAM_ADDR;
output	SDRAM_LDQM;
output	SDRAM_UDQM;
output	SDRAM_WE_N;
output	SDRAM_CAS_N;
output	SDRAM_RAS_N;
output	SDRAM_CS_N;
output	SDRAM_BA_0;
output	SDRAM_BA_1;
output	SDRAM_CLK;
output	SDRAM_CKE;

output	WIZ_RESET_N;
input	[3:0]	WIZ_BRDY;
	
input		WIZ_LINKLED_N;
input		WIZ_TXLED_N;
input		WIZ_RXLED_N;
input		WIZ_COLLED_N;
input		WIZ_FDXLED_N;
input		WIZ_SPDLED_N;
input		WIZ_ACTLED_N;

output	WIZ_BIT16EN;
output [9:0]	WIZ_A;
inout [15:0]	WIZ_D;
output	WIZ_CS_N;
output	WIZ_RD_N;
output	WIZ_WR_N;
input		WIZ_INT_N;

// WIZ wirings
assign WIZ_BIT16EN = 1'b1; // 16 bit mode
assign WIZ_RESET_N = RST_N; // reset
assign LED9 = !WIZ_LINKLED_N;
assign LED8 = !WIZ_TXLED_N;
assign LED7 = !WIZ_RXLED_N;
assign LED6 = !WIZ_COLLED_N;
assign LED5 = !WIZ_FDXLED_N;
assign LED4 = !WIZ_SPDLED_N;
assign LED3 = !WIZ_ACTLED_N;
assign LED2 = 1'b0;
assign LED1 = 1'b0;
assign LED0 = 1'b0;

// nios2
nios2e u0 (
	.clk_clk (CLK),
	.reset_reset_n (RST_N),

	.sdram_0_wire_dq		(SDRAM_DQ),
	.sdram_0_wire_addr 	(SDRAM_ADDR),
	.sdram_0_wire_dqm 	({SDRAM_UDQM, SDRAM_LDQM}),
	.sdram_0_wire_we_n 	(SDRAM_WE_N),
	.sdram_0_wire_cas_n 	(SDRAM_CAS_N),
	.sdram_0_wire_ras_n 	(SDRAM_RAS_N),
	.sdram_0_wire_cs_n 	(SDRAM_CS_N),
	.sdram_0_wire_ba 		({SDRAM_BA_1, SDRAM_BA_0}),
	.sdram_0_wire_cke 	(SDRAM_CKE),
	
	.wiz0_address		(WIZ_A),
	.wiz0_write			(wiz_wr),
	.wiz0_read			(wiz_rd),
	.wiz0_readdata		(wiz_readdata),
	.wiz0_writedata	(wiz_writedata),
	.wiz0_chipselect	(wiz_cs),
	.wiz0_byteenable	(wiz_byteenable)
);

// multiplex readdata and writedata
wire [15:0] wiz_readdata;
wire [15:0] wiz_writedata;
wire [1:0] wiz_byteenable;
wire wiz_cs, wiz_wr, wiz_rd;
assign WIZ_CS_N = !wiz_cs;
assign WIZ_WR_N = !(wiz_wr && wiz_byteenable[0] && wiz_byteenable[1]);
assign WIZ_RD_N = !(wiz_rd && wiz_byteenable[0] && wiz_byteenable[1]);
assign WIZ_D = (!WIZ_CS_N && !WIZ_WR_N) ? wiz_writedata : 15'bz;
assign wiz_readdata = (!WIZ_CS_N && !WIZ_RD_N) ? WIZ_D : 15'b0;

// PLL for SDRAM clock
mypll mypll_inst (
	.areset(1'b0),
	.inclk0(CLK),
	.c0(SDRAM_CLK),
	.locked()
);

endmodule
