`timescale 1ns / 1ps
//4-bit  synchronous loadable up counter
module upcount(data_in,clk,rst,load,q);
input [3:0]data_in;
input clk,rst,load;
output reg [3:0]q;
always@(posedge clk)
begin
if(rst)
q<=4'b0000;
else if(load)
q<=data_in;
else
q<=q+4'b0001;
end endmodule
