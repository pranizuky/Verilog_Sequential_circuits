`timescale 1ns / 1ps
module upcount_tb();
reg [3:0]data;
reg clk,rst,load;
wire [3:0]q;
upcount dut(.data_in(data),.clk(clk),.rst(rst),.load(load),.q(q));
initial
begin
clk=1'b0; forever #5 clk=~clk;
end
task initialize;
begin rst=1'b1;
load=1'b0; data=4'b0000;
end
endtask
task reset; begin
@(negedge clk) rst=1'b1;
@(negedge clk) rst=1'b0;
end endtask
task inputs(input i,input [3:0]j);
begin
@(negedge clk)load=i;
@(negedge clk)data=j;
end
endtask
initial
begin
initialize;
reset;
inputs(1'b1,4'b0011);
#10;
inputs(1'b0,4'b0011);
#10;
inputs(1'b0,4'b0011);
#10;
inputs(1'b0,4'b1000);
#10;
inputs(1'b1,4'b1101);
end
initial
$monitor("inputs data=%b,clk=%b,reset=%bload=%b output q=%b",data,clk,rst,load,q);
initial #200 $finish; 
endmodule
