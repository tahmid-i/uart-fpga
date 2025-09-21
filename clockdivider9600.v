module clockdivider9600(
	input clk_50, 
	output reg baud_9600
);

	reg [8:0] counter;
	//originally a 9600 baud but changed to 115200
	always@(posedge clk_50) begin
	
	counter <= counter + 1'b1;
	
	if (counter == 434) begin
		baud_9600 <= 1'b1;
		counter <= 9'b0;
	end
	else begin
		baud_9600 <= 1'b0;
	end

	end
	
	
	
endmodule
