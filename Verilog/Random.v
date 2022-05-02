// Pseudo - random number generator 10 bit
// 
// Produces a new "random" number every clock cycle
module random(d,clk);
  input clk;
  output reg [9:0] d=5; // by initializing d to 5 we give it a seed
    
always @(posedge clk) begin
    d <= { d[9:0], d[9] ^ d[6] }; // actual shifting along with the XOR gate
end
endmodule

