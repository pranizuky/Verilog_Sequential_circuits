`timescale 1ns / 1ps
module siso_tb(); reg
si,clk,rst;
wire so;
siso dut(si,so,rst,clk);
initial
begin clk=1'b0;
forever #5 clk=~clk; end
task initialize;
begin rst=1'b1;
si=1'b0;
end
endtask
task reset; begin
@(negedge clk)rst=1'b1;
@(negedge clk)rst=1'b0;
end endtask
task inputs(input m );
begin
@(negedge clk)si=m;
end
endtask
initial
begin
initialize; reset;
inputs(1); inputs(0);
inputs(0); inputs(1);
inputs(1); inputs(1);
inputs(0); inputs(1);
 end
initial
#150 $finish; endmodule 
