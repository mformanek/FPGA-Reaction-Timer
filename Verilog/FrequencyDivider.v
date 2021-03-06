// 
//
// generate 100 Hz from 50 MHz
//
// hold rst_50mhz at 0 to run
module _100hz(clk_50mhz,rst_50mhz,out_100hz);



 
input clk_50mhz;
input rst_50mhz;
reg [17:0] count_reg = 0;
output reg out_100hz = 0;

always @(posedge clk_50mhz or posedge rst_50mhz) begin
    if (rst_50mhz) begin
        count_reg <= 0;
        out_100hz <= 0;
    end else begin
        if (count_reg < 249999) begin // 0 to  249999 aka 25000 cycles
            count_reg <= count_reg + 1;
        end else begin
            count_reg <= 0;
            out_100hz <= ~out_100hz;
        end
    end
end
endmodule
 

	


