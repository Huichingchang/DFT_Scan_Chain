// scan_chain.v
module scan_chain(
	input wire clk,
	input wire rst,
	input wire scan_enable,
	input wire scan_in,
	input wire [3:0] d,
	output wire [3:0] q
);

	wire q0, q1, q2, q3;
	scan_dff u0(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(scan_in),
		.d(d[0]),
		.q(q0)
	);
	
		scan_dff u1(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(q0),
		.d(d[1]),
		.q(q1)		
		);
		
		scan_dff u2(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(q1),
		.d(d[2]),
		.q(q2)		
		);
		
		scan_dff u3(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(q2),
		.d(d[3]),
		.q(q3)		
		);
		
		assign q={q3,q2,q1,q0};
	endmodule