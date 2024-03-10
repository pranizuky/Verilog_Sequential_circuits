`timescale 1ns / 1ps
module mod12upcount_tb();
reg [3:0]data; reg
clk,rst,load; wire [3:0]q;
mod12upcount dut(data,clk,rst,load,q); initial
begin clk=1'b0;
forever #5 clk=~clk; end
task initialize;
begin rst=1'b1;
load=1'b0; data=4'b0000;
end
endtask
task reset;
begin
@(negedge clk) rst=1'b1;
@(negedge clk) rst=1'b0;
end endtask
task inputs(input i,input [3:0]j);
begin
@(negedge clk)load=i; @(negedge
clk)data=j;
end
endtask initial
begin
initialize; reset;
inputs(1'b1,4'b0010);
#10;
inputs(1'b0,4'b0010);
#10;
inputs(1'b0,4'b0010);
#10; inputs(1'b0,4'b0010);
#10;
inputs(1'b0,4'b0010);
#10;
inputs(1'b1,4'b1110);
#10;
inputs(1'b0,4'b1110);
#10;
inputs(1'b1,4'b0010);
#10;
inputs(1'b0,4'b0010);
#10;
end
initial
$monitor("inputsdata=%b,clk=%b,rst=%b,load =%b,outpt q=%b",data,clk,rst,load,q); initial #300
$finish;
endmodule 
