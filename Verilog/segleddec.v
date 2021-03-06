// 7segment LED decoder (anode common)
// 
//
module segleddec(bcd,dp,led);
  input [3:0] bcd;
	input dp;	// decimal point
	output [7:0] led;


	assign led=ALED(bcd,dp);
	
	function [7:0] ALED;
		input [3:0] bcd;
		input dp;
		case(bcd)
			4'h0:	ALED={ ~dp, 7'b1000000 }; // 0
			4'h1:	ALED={ ~dp, 7'b1111001 }; // 1
			4'h2:	ALED={ ~dp, 7'b0100100 }; // 2
			4'h3:	ALED={ ~dp, 7'b0110000 }; // 3
			4'h4:	ALED={ ~dp, 7'b0011001 }; // 4
			4'h5:	ALED={ ~dp, 7'b0010010 }; // 5
			4'h6:	ALED={ ~dp, 7'b0000010 }; // 6
			4'h7:	ALED={ ~dp, 7'b1111000 }; // 7
			4'h8:	ALED={ ~dp, 7'b0000000 }; // 8
			4'h9:	ALED={ ~dp, 7'b0011000 }; // 9
			4'ha:	ALED={ ~dp, 7'b0001000 }; // A
			4'hb:	ALED={ ~dp, 7'b0000011 }; // B
			4'hc:	ALED={ ~dp, 7'b0100111 }; // C
			4'hd:	ALED={ ~dp, 7'b0100001 }; // D
			4'he:	ALED={ ~dp, 7'b0000110 }; // E
			4'hf:	ALED={ ~dp, 7'b0001110 }; // F
			default:	ALED={ ~dp, 7'b1111111 }; // off
	endcase
	endfunction
endmodule

