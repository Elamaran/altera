
module dbl_tap_monitor 
(
input wire clk_1k,				//1kHz clock required
input wire rstn,			
input wire in_signal,			//A pulse for each tap
input wire [15:0] delay_ms, 	//double tap delay

output wire out_signal			//Pulse for every successful double tap
);

reg tap_pulse_r;
reg tap_sense;

wire tap_pulse;

//Produce a pulse aligned with the input clock
always @ (posedge clk_1k, negedge rstn)
begin
	if (!rstn)
		tap_pulse_r <= 0;
	else
		tap_pulse_r <= in_signal;
end

assign tap_pulse = !tap_pulse_r & in_signal;


reg c_rstn;
reg [15:0] counter;

//16 bit Counter; Max 65536ms
always @(posedge clk_1k, negedge rstn)
begin
	if (!rstn)
		counter <= 0;
	else if (!c_rstn)
		counter <= 0;
	else
		counter <= counter + 1;
end

//Core logic
always @ (posedge clk_1k, negedge rstn)
begin
	if (!rstn) begin		
		c_rstn <= 0;
		tap_sense <= 0;
		end
	else if (tap_pulse & (counter ==0)) begin
		c_rstn <= 1;
		tap_sense <= tap_sense;
		end
	else if (tap_pulse & (counter !=0)) begin
		c_rstn <= 0;
		tap_sense <= ~tap_sense;
		end
	else if ( (counter + 1) >= delay_ms ) begin
		c_rstn <= 0;
		tap_sense <= tap_sense;
		end
end

assign out_signal = tap_sense;

endmodule
