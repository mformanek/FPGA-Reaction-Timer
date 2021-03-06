//
//
//
// Top level module
	
	
	
	
	
	module Project3(hled0,hled1,hled2,hled3, led, pb, pb2,clck50mzh);
	
	input pb;
	input pb2;
	input clck50mzh;
	
	output [7:0] hled0;
	output [7:0] hled1;
	output [7:0] hled2;
	output [7:0] hled3;
	output reg [9:0] led = 0;
	
	
	
	wire clk100hz;
	wire [3:0] BCD_0;
	wire [3:0] BCD_1;
	wire [3:0] BCD_2;
	wire [3:0] BCD_3;
	
	wire [9:0] t;
	reg rst=0;

	reg [15:0] userlag=0;
	reg [31:0] count100=0;
	reg [9:0] rdm =0;
	reg [9:0] ledc;

	
    _100hz clock(clck50mzh,0,clk100hz); // divide 50 mHz to 100 Hz

	always @ (posedge clk100hz)begin // triggers every 1/100 of a sec (100hz)
	count100 <= (count100 + 1); // this is the actual counter itself
	if(!pb)begin // if the reset button is pressed then reset the variables
		count100<=0;
		userlag =0;
		rst <=0;
	end
	if(!pb2)begin // end the game 
	rst<=1;
	end
		if(rdm == count100 && count100>0)begin // if the time is the same as the random number we generated -> turn on go led
			led[9] <= 1;
			end
			
	   if(led[9])begin // keep go led on for 2 sec
	     ledc <= ledc +1;
	      if(ledc == 200)begin
			ledc <= 0;
			led[9]=0;
	     
			end
		end
	  if(rst && !userlag)begin //if the game has ended
		if(count100>rdm)begin  // if the game button is pressed after the go led has flashed
		userlag <= count100 - rdm; // calculate user response(time elapsed from start of game to end of game - the time before the go led was on)
		end
		else begin
		rst <=0; // important for keeping the game from stopping in the event the user depresses the game button befor the go led has flashed
		end
		end
	end
	
	
	always @ (posedge pb)begin
		rdm <= t; // get fresh random number
	end

	
	random ran(t,clk100hz); // get new random numbers at 100Hz
	
	bin2bcd a(userlag, BCD_0, BCD_1, BCD_2, BCD_3); // counver user response time to BCD
	
	segleddec seg0(BCD_0,1'b0, hled0);
	segleddec seg1(BCD_1,1'b0, hled1);
	segleddec seg2(BCD_2,1'b1, hled2);
    segleddec seg3(BCD_3,1'b0, hled3); // output result to screens

	
	//segleddec seg0(count100[3:0],1'b0, hled0);
	//segleddec seg1(count100[7:4],1'b0, hled1);
	//segleddec seg2(count100[11:8],1'b0, hled2);
	//segleddec seg3(count100[15:12],1'b0, hled3);
	
endmodule