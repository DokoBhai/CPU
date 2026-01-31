module program_counter (
    input wire clk,
    input wire rst,
    input wire en,
    output reg [7:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 8'b0;
        end else if (en) begin
            pc <= pc + 1;
        end
    end

endmodule
