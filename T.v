`timescale 1ns / 1ps
 //T flipflop via D
 module T(t,clk,rst,q,qbar);
input t,clk,rst;
output q,qbar;
wire d;
assign d=(t^q);
D d1(d,clk,rst,q,qbar);
endmodule 


