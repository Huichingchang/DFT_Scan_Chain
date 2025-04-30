//scan_dfff.v
module scan_dff (
	input clk,
	input rst,
	input d,
	input scan_in,
	input scan_enable,
	output reg q
);

	always @(posedge clk or posedge rst) begin
		if (rst)
				q<= 1'b0;
		else if (scan_enable)
				q <= scan_in; // scan模式;把scan_in給q
		else 
				q <= d; //正常模式:把d給q
	end
	endmodule
	