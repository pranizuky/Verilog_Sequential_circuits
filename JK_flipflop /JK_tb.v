module JK_tb();
reg j,k,clk,reset; wire q;
J dut(j,k,clk,reset,q);
initial
begin clk=1'b0;
forever #5 clk=~clk;
end
task initialize;
begin reset=1'b1;
j=1'b0; k=1'b0;
end
endtask
task rst;
begin
@(negedge clk) reset=1'b1;
@(negedge clk) reset=1'b0;
end endtask
task inputs(input m,input n);
begin
@(negedge clk) j=m;
negedge clk) k=n; end
endtask initial
begin
initialize;
rst;
inputs(1'b0,1'b0);
#10;
inputs(1'b0,1'b1);
#10;
inputs(1'b1,1'b0);
#10;
inputs(1'b1,1'b1);
#10;
inputs(1'b0,1'b0);
#10;
inputs(1'b0,1'b1);
#10; end
initial
$monitor("inputs j=%b,k=%b,clk=%b,reset=%boutpts q=%b",j,k,clk,reset,q); initial #200
$finish; endmodule 
