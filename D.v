`timescale 1ns / 1ps
//D flipflop

module D(d,clk,rst,q,qbar);
input d,clk,rst;
output reg q,qbar;
always@(posedge clk)
begin
if(rst)
q<=1'b0;
else
q<=d;
end
always@(q)
qbar=~q;
 endmodule
