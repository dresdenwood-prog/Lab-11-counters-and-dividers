`timescale 1ns / 1ps

module top(
    input btnC,
    input btnU,
    output [6:0] led
);

    wire [2:0] ripple_Q;
    wire [2:0] modulo_count;
    wire modulo_output;

    // Ripple counter

    ripple_counter RIPPLE (
        .clk(btnC),
        .reset(btnU),
        .Q(ripple_Q)
    );

    // Modulo counter

    modulo_counter MODULO (
        .clk(btnC),
        .reset(btnU),
        .count(modulo_count),
        .clk_out(modulo_output)
    );

    // LED assignments

    assign led[0] = ripple_Q[0];
    assign led[1] = ripple_Q[1];
    assign led[2] = ripple_Q[2];

    assign led[3] = modulo_count[0];
    assign led[4] = modulo_count[1];
    assign led[5] = modulo_count[2];

    assign led[6] = modulo_output;

endmodule