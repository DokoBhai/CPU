module rom_alu_test;

    reg clk;
    reg rst;
    reg [7:0] pc;
    wire [23:0] instruction;
    wire [7:0] alu_result;
    wire carry_out, borrow_out;
    
    wire [2:0] opcode;
    wire [7:0] operand_a;
    wire [7:0] operand_b;
    
    assign opcode = instruction[23:21];
    assign operand_a = instruction[20:13];
    assign operand_b = instruction[12:5];
    
    read_rom_file rom (
        .address(pc),
        .data_out(instruction)
    );
    
    ALU alu (
        .clk(clk),
        .rst(rst),
        .A(operand_a),
        .B(operand_b),
        .opcode(opcode),
        .result(alu_result),
        .carry_out(carry_out),
        .borrow_out(borrow_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("build/rom_alu_test.vcd");
        $dumpvars(0, rom_alu_test);
        
        rst = 1;
        pc = 0;
        #20;
        rst = 0;
        #20;
        
        pc = 0; #50;
        
        pc = 1; #50;
        
        pc = 2; #50;
        
        pc = 3; #50;
        
        pc = 4; #50;
        
        pc = 5; #50;
        
        $display("\n=== Test Complete ===");
        $finish;
    end

endmodule
