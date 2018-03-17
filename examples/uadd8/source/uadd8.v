/**
 * Simple 8 bit adder with registered inputs and outputs.
**/

`timescale 1ns/1ps

module uadd8 (
    input        clk_i,
    input  [7:0] opa_i,
    input  [7:0] opb_i,
    output [8:0] sum_o
);

// Input registers.
reg [7:0] opa, opb;
always @ (posedge clk_i)
begin
    opa <= opa_i;
    opb <= opb_i;
end

// Adder.
reg [8:0] sum;
always @ (posedge clk_i)
begin
    sum <= opa + opb;
end

// Output register.
always @ (clk_i)
begin
    sum_o <= sum;
end

endmodule

