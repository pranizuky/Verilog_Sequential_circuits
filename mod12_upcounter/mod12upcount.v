`timescale 1ns / 1ps
//4-bit MOD12 loadable binary up counter
module
mod12upcount(data_in,clk,rst,load,q);
input [3:0]data_in;
input clk,rst,load;
output reg [3:0]q;
always@(posedge clk)
begin
if(rst)
q<=4'b0000;
else if(load&&(data_in<=4'b1011))
q<=data_in;
else if(q==4'b1011)
q<=4'b0000;
else
q<=q+4'b0001; end
endmodule 
