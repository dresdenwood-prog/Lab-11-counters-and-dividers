`timescale 1ns / 1ps

module D_Flip_Flop(
    input D,
    input clk,
    input reset,
    output reg Q,
    output Qnot
);

    initial Q = 0;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else
            Q <= D;
    end

    assign Qnot = ~Q;

endmodule