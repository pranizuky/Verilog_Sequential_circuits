`timescale 1ns / 1ps
//4 bit loadable binary synchronous up down counter
module updowncount(data_in,clk,rst,load,mode,q);
input [3:0]data_in; input clk,rst,load,mode;
output reg [3:0]q;
always@(posedge clk)
begin
if(rst)
q<=4'b0000;
else if(load)
q<=data_in;
else begin
case(mode)
1'b0:q<=q+4'b0001;
1'b1:q<=q-4'b0001;
endcase 
end
end
 endmodule 
