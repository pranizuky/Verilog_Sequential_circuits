`timescale 1ns / 1ps


module T_tb();
reg t,clk,reset; wire
q,qbar;
T dut(t,clk,reset,q,qbar);
initial
begin
clk=1'b0;
forever #5 clk=~clk;
end
task initialize;
begin
reset=1'b1;
t=1'b0;
end
endtask
task rst;
begin
@(negedge clk) reset=1'b1;
@(negedge clk) reset=1'b0;
end endtask
task inputs(input m);
@(negedge clk) t=m; endtask
initial
begin
initialize;
rst;
inputs(1'b1);
#10;
inputs(1'b0);
#10;
inputs(1'b1);
#10;
inputs(1'b0);
end
initial
$monitor($time,"inputs t=%b,clk=%b,reset=%b outpts q=%b qbar=%b",t,clk,reset,q,qbar); initial #120 $finish;
endmodule 
