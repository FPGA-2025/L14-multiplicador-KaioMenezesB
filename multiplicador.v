module Multiplier #(
    parameter N = 4
) (
    input wire clk,
    input wire rst_n,

    input wire start,
    output reg ready,

    input wire   [N-1:0] multiplier,
    input wire   [N-1:0] multiplicand,
    output reg [2*N-1:0] product
);

always @(posedge clk) begin
        if (!rst_n) begin
            ready   <= 1'b0;
            product <= {2*N{1'b0}};
        end else begin
            if (start) begin
                product <= multiplier * multiplicand;  
                ready   <= 1'b1;
            end else begin
                ready <= 1'b0;
            end
        end
    end

endmodule
