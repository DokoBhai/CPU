module ALU (
    input wire clk,
    input wire rst,
    input wire [7:0] A,
    input wire [7:0] B,
    input wire [2:0] opcode,
    output reg [7:0] result,
    output wire carry_out,
    output wire borrow_out
);

    wire [7:0] add_result;
    wire [7:0] sub_result;
    wire add_carry, sub_borrow;
    wire [7:0] reg_output;
    
    adder8 adder_inst (
        .a(A),
        .b(B),
        .cin(1'b0),
        .sum(add_result),
        .cout(add_carry)
    );
    
    subtractor8 sub_inst (
        .a(A),
        .b(B),
        .bin(1'b0),
        .diff(sub_result),
        .bout(sub_borrow)
    );
    
    register8 result_reg (
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .d(result),
        .q(reg_output)
    );
    
    always @(*) begin
        case (opcode)
            3'b000: result = add_result;      // ADD
            3'b001: result = sub_result;      // SUB
            3'b010: result = A & B;           // AND
            3'b011: result = A | B;           // OR
            3'b100: result = A ^ B;           // XOR
            3'b101: result = ~A;              // NOT
            default: result = 8'b0;
        endcase
    end
    
    assign carry_out = (opcode == 3'b000) ? add_carry : 1'b0;
    assign borrow_out = (opcode == 3'b001) ? sub_borrow : 1'b0;

endmodule