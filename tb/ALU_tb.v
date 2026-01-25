module ALU_tb();

reg clk;
reg rst;
reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;
wire [7:0] result;
wire carry_out;
wire borrow_out;

ALU dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry_out(carry_out),
    .borrow_out(borrow_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("build/ALU_tb.vcd");
    $dumpvars(0, ALU_tb);
    
    rst = 1;
    A = 8'b0;
    B = 8'b0;
    opcode = 3'b0;
    #10;
    
    rst = 0;
    #10;
    
    // Test ADD (opcode = 000)
    A = 8'd15; B = 8'd10; opcode = 3'b000; #10;
    
    A = 8'd255; B = 8'd1; opcode = 3'b000; #10;
    
    // Test SUB (opcode = 001)
    A = 8'd20; B = 8'd5; opcode = 3'b001; #10;
    
    A = 8'd5; B = 8'd10; opcode = 3'b001; #10;
    
    // Test AND (opcode = 010)
    A = 8'b11110000; B = 8'b10101010; opcode = 3'b010; #10;
    
    // Test OR (opcode = 011)
    A = 8'b11110000; B = 8'b10101010; opcode = 3'b011; #10;
    
    // Test XOR (opcode = 100)
    A = 8'b11110000; B = 8'b10101010; opcode = 3'b100; #10;
    
    // Test NOT (opcode = 101)
    A = 8'b11110000; opcode = 3'b101; #10;
    
    // Test Shift Left (opcode = 110)
    A = 8'b00001010; opcode = 3'b110; #10;
    
    // Test Shift Right (opcode = 111)
    A = 8'b00001010; opcode = 3'b111; #10;
    
    #20;
    $display("All ALU tests completed");
    $finish;
end

endmodule
