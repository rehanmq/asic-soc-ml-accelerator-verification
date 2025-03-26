module mma #(parameter N = 4, WIDTH = 8)(
    input logic clk,
    input logic rst,
    input logic start,
    input logic [N*WIDTH-1:0] matrix_a,
    input logic [N*WIDTH-1:0] matrix_b,
    output logic [2*WIDTH-1:0] result,
    output logic done
);

    logic [WIDTH-1:0] A [N-1:0];
    logic [WIDTH-1:0] B [N-1:0];
    logic [2*WIDTH-1:0] temp_result;
    logic [3:0] i;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 0;
            done <= 0;
            temp_result <= 0;
            i <= 0;
        end else if (start && !done) begin
            for (int j = 0; j < N; j++) begin
                A[j] = matrix_a[j*WIDTH +: WIDTH];
                B[j] = matrix_b[j*WIDTH +: WIDTH];
                temp_result += A[j] * B[j];
            end
            result <= temp_result;
            done <= 1;
        end
    end
endmodule
