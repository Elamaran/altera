
module top (
input wire clk, 
input wire rstn,
output wire [2:0]led);

wire clk_internal;

reg clk_r;
reg [24:0]count;

always @ (posedge clk, negedge rstn)
begin
	if (!rstn)
		clk_r <= 0;
	else
		clk_r = ~clk_r;
end

assign clk_internal = clk_r;

always @ (posedge clk_internal, negedge rstn)
begin 
	if (!rstn)
		count <= ~25'd0;
	else 
		count <= count + 1;
end

assign led[2:0] = count [24:22];

endmodule
