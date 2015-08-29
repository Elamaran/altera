
module CylnII_DoubleClick_Btn_LED (
input wire clk,
input wire rstn,
input wire btn,

output wire [2:0] led
);

parameter [16:0] DELAY = 16'd400;

reg clk_r;
reg [15:0]clk_count1;

wire clk_internal;
wire clk_10k;

always @ (posedge clk, negedge rstn)
begin
	if (!rstn)
		clk_r <= 0;
	else
		clk_r = ~clk_r;
end

//internal clock. This is abstracted and used from the Onboard clock
assign clk_internal = clk_r;

//Clock - Down conversion to 1k
//Counter - count upto 50000 so as to give 1/1kHz period
always @ (posedge clk_internal, negedge rstn)
begin
	if (!rstn)
		clk_count1 <= 0;
	else if (clk_count1 == 16'd50000) //50MHz to 1KHz
		clk_count1 <= 0;
	else
		clk_count1 <= clk_count1 + 1;
end

assign clk_10k = (clk_count1 > 16'd25000);

dbl_tap_monitor (
	clk_1k	,			
	rstn		,
	btn		,
	DELAY		,
	led[0]
	);

endmodule
