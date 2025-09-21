module datasplitter (
	input [7:0] serial,
	output [3:0] out1,
	output [3:0] out2
	);
	
	
	assign {out2,out1} = serial;
	
	endmodule
	