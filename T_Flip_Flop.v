`timescale 1ns / 1ps

module T_Flip_Flop(
    input T,
    input clk,
    input reset,
    output Q,
    output Qnot
);

    wire D;

    assign D = T ^ Q;

    D_Flip_Flop DFF (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qnot(Qnot)
    );

endmodule
