module uartmodule_rx(
	input rx_serial, input clk_50, input baud_9600,
	output reg [7:0] rx_data,
	output reg rx_ready);

	reg [3:0] counter = 4'b0;
	
	always@(posedge clk_50) begin
	
		if(baud_9600) begin
		
			if(~rx_serial && (counter == 4'b0)) begin // start state
				counter <= counter + 1'b1;
			end
			
			else if((counter >= 1) && (counter <= 8))begin// shift state
				counter <= counter + 1'b1;
				rx_data[counter - 1] <= rx_serial;
			end
			
			else if( (counter == 9) ) begin // end state. 
				counter <= 4'b0; //going back to counter = 0; idle state
				rx_ready = 1'b1;
			end
			else begin
				rx_ready = 1'b0;
			end
		
		end

	
	end




endmodule
