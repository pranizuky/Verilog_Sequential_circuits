`timescale 1ns / 1ps
//4-bit SISO
module siso(si,so,rst,clk);
input si,clk,rst; output
so; reg [3:0]q;
always@(posedge clk) begin
if(rst)
begin
q<=0; end
else begin
q<={si,q[3:1]};
end end
assign so=(~rst)?q[0]:1'b0;
 endmodule 
