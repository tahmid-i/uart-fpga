module uartmodule_tx(	
	input [7:0]tx_data, 
	input tx_start, 
	input clk_50, 
	input baud_115200,
	output reg tx_serial);
	
	reg [3:0] counter = 4'b0;
	
	always@(posedge clk_50) begin
	
	if(baud_115200) begin
		if((counter == 0) && (tx_start==0)) begin
		tx_serial <= 1'b1;
		end
	else begin
		if ((tx_start==1) && (counter == 4'b0)) begin // begin state
			counter <= counter + 1'b1;
			tx_serial <= 1'b0; // start bit
		end
		
		else if( (counter > 0) && (counter != 4'd9)) begin // data transmission state
			tx_serial <= tx_data[counter - 1];
			counter <= counter + 1'b1; // data shift
		end
		
		else if (counter == 4'd9 ) begin // end of data shift state
			tx_serial <= 1'b1; // stop bit
			counter <= 4'b0; 	//sets state to idle
		end
	
	end
	
	end
	
	end
	
	
	endmodule
	
