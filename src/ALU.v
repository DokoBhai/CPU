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
    reg [7:0] alu_output;
    
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
    
    always @(*) begin
        case (opcode)
            3'b000: alu_output = add_result;      // ADD
            3'b001: alu_output = sub_result;      // SUB
            3'b010: alu_output = A & B;           // AND
            3'b011: alu_output = A | B;           // OR
            3'b100: alu_output = A ^ B;           // XOR
            3'b101: alu_output = ~A;              // NOT
            default: alu_output = 8'b0;
        endcase
    end
    
    always @(posedge clk) begin
        if (rst)
            result <= 8'b0;
        else
            result <= alu_output;
    end
    
    assign carry_out = (opcode == 3'b000) ? add_carry : 1'b0;
    assign borrow_out = (opcode == 3'b001) ? sub_borrow : 1'b0;

endmodule