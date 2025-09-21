module bcdhex(
//inputs
input[3:0] bcdin,
input rx_ready,
//outputs
output reg [6:0] bcdout
);

always @(rx_ready) begin

	case(bcdin)
        //1s
		4'd0 : bcdout <= ~(7'b0111111); //0
		4'd1 : bcdout <= ~(7'b0000110); //1
		4'd2 : bcdout <= ~(7'b1011011); //2
		4'd3 : bcdout <= ~(7'b1001111); //3
		4'd4 : bcdout <= ~(7'b1100110); //4
		4'd5 : bcdout <= ~(7'b1101101); //5
		4'd6 : bcdout <= ~(7'b1111101); //6
		4'd7 : bcdout <= ~(7'b0000111); //7
		4'd8 : bcdout <= ~(7'b1111111); //8
		4'd9 : bcdout <= ~(7'b1101111); //9
        //10s
    	4'd10 : bcdout <= ~(7'b1110111); //10 A
    	4'd11 : bcdout <= ~(7'b1111100); //11 B
    	4'd12 : bcdout <= ~(7'b0111001); //12 C
    	4'd13 : bcdout <= ~(7'b1011110); //13 D
    	4'd14 : bcdout <= ~(7'b1111001); //14 E
		4'd15 : bcdout <= ~(7'b1110001); //15 F
		  default : bcdout <= ~{8{1'b0}}; // to show nothing
        
	endcase
	
	
end

endmodule
