module D_tb();
reg d,clk,reset;
wire q,qbar;
D dut(d,clk,reset,q,qbar);
initial
begin
clk=1'b0;
forever #5 clk=~clk; end
task initialize;
begin
reset=1'b1;
d=1'b0;
end
endtask
task rst;
begin
@(negedge clk) reset=1'b1;
@(negedge clk) reset=1'b0;
end endtask
task inputs(input m);
@(negedge clk) d=m; endtask
initial
begin
initialize;
rst;
inputs(1'b1);
#10;
inputs(1'b0);
#10;
end
initial
$monitor("inputs d=%b,clk=%b,reset=%b
outpts q=%b qbar=%b",d,clk,reset,q,qbar);
initial #100 $finish;
endmodule 