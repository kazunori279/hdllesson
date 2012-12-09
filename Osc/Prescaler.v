module Prescaler (
	input CLK,
	output ICLK
);

// generate 1MHz internal clock
reg [7:0] cnt;
reg iclk;
always @(posedge CLK) begin
	if (cnt == 8'd50)
		cnt = 0;
	else
		cnt = cnt + 1;
	if (cnt < 8'd25)
		iclk = 1'b1;
	else
		iclk = 1'b0;
end
assign ICLK = iclk;

endmodule

