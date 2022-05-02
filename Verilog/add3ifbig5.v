//if number if grater then 5 add 3


module add3ifbig5(i,a); 
	input [3:0] i; 
	output [3:0] a; 
	reg [3:0] a; 
 
	always @ (i) 
		case (i) 
			4'b0000: a <= 4'b0000; 
			4'b0001: a <= 4'b0001; 
			4'b0010: a <= 4'b0010; 
			4'b0011: a <= 4'b0011; 
			4'b0100: a <= 4'b0100; 
			4'b0101: a <= 4'b1000; 
			4'b0110: a <= 4'b1001; 
			4'b0111: a <= 4'b1010; 
			4'b1000: a <= 4'b1011; 
			4'b1001: a <= 4'b1100;
			4'b1010: a <= 4'b1101;	
			4'b1011: a <= 4'b1110;	
			4'b1100: a <= 4'b1111;	
			default: a <= 4'b0000; // a cannot be larger than 12
		endcase 
endmodule 