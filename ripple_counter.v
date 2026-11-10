`timescale 1ns / 1ps

module ripple_counter(
    input clk,
    input reset,
    output [2:0] Q
);

    wire [2:0] Qnot;

    T_Flip_Flop TFF0 (
        .T(1'b1),
        .clk(clk),
        .reset(reset),
        .Q(Q[0]),
        .Qnot(Qnot[0])
    );

    T_Flip_Flop TFF1 (
        .T(1'b1),
        .clk(Qnot[0]),
        .reset(reset),
        .Q(Q[1]),
        .Qnot(Qnot[1])
    );

    T_Flip_Flop TFF2 (
        .T(1'b1),
        .clk(Qnot[1]),
        .reset(reset),
        .Q(Q[2]),
        .Qnot(Qnot[2])
    );

endmodule