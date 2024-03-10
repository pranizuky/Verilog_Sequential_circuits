`timescale 1ns / 1ps
//not referencing like here will lead to X Z states of o/p i/p in simulation
module updowncount_tb();
reg [3:0]data; reg
clk,rst,load,mode; wire [3:0]q;
updowncount dut(data,clk,rst,load,mode,q); initial
begin clk=1'b0;
forever #5 clk=~clk; end
task initialize;
begin rst=1'b1;
load=1'b0;
mode=1'b0;
data=4'b0000; end
endtask
task reset; begin
@(negedge clk) rst=1'b1;
@(negedge clk) rst=1'b0;
end
endtask
task inputs(input i,input n,input [3:0]j);
begin
@(negedge clk)load=i;
@(negedge clk)mode=n;
@(negedge clk)data=j;
end
endtask
initial
begin
initialize;
reset;
inputs(1'b1,1'b1,4'b0011);
#10;
inputs(1'b0,1'b1,4'b0011);
#10;
inputs(1'b0,1'b1,4'b0011);
#10;
inputs(1'b1,1'b0,4'b1000);
#10;
inputs(1'b0,1'b0,4'b1000);
#10;
inputs(1'b0,1'b0,4'b1000);
#10;
inputs(1'b0,1'b0,4'b1000);
#10;
end
initial$monitor("inputs data=%b,clk=%b,reset=%b
load=%b output q=%b",data,clk,rst,load,q); initial #200
$finish; endmodule 
