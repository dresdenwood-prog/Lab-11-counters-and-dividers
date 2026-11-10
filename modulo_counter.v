`timescale 1ns / 1ps

module modulo_counter(
    input clk,
    input reset,
    output [2:0] count,
    output clk_out
);

    wire [2:0] next_count;
    wire [2:0] sum;
    wire [2:0] carry;

    wire count_reset;
    wire D0, D1, D2;
    wire toggle_D;

    // Increment count by 1

    full_adder FA0 (
        .A(count[0]),
        .B(1'b1),
        .Cin(1'b0),
        .Sum(sum[0]),
        .Cout(carry[0])
    );

    full_adder FA1 (
        .A(count[1]),
        .B(1'b0),
        .Cin(carry[0]),
        .Sum(sum[1]),
        .Cout(carry[1])
    );

    full_adder FA2 (
        .A(count[2]),
        .B(1'b0),
        .Cin(carry[1]),
        .Sum(sum[2]),
        .Cout(carry[2])
    );

    // Check if count equals 5 (binary 101)

    assign count_reset = count[2] & ~count[1] & count[0];

    // Reset count to 0 when count reaches 5

    assign next_count = count_reset ? 3'b000 : sum;

    assign D0 = next_count[0];
    assign D1 = next_count[1];
    assign D2 = next_count[2];

    // Store counter bits

    D_Flip_Flop DFF0 (
        .D(D0),
        .clk(clk),
        .reset(reset),
        .Q(count[0]),
        .Qnot()
    );

    D_Flip_Flop DFF1 (
        .D(D1),
        .clk(clk),
        .reset(reset),
        .Q(count[1]),
        .Qnot()
    );

    D_Flip_Flop DFF2 (
        .D(D2),
        .clk(clk),
        .reset(reset),
        .Q(count[2]),
        .Qnot()
    );

    // Toggle output every 6 clock pulses

    assign toggle_D = clk_out ^ count_reset;

    D_Flip_Flop OUTPUT_FF (
        .D(toggle_D),
        .clk(clk),
        .reset(reset),
        .Q(clk_out),
        .Qnot()
    );

endmodule