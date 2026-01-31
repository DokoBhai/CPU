module program_counter_test();

reg clk;
reg rst;
reg en;
wire [7:0] pc;

program_counter dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .pc(pc)
);

initial begin
    $dumpfile("build/program_counter_test.vcd");
    $dumpvars(0, program_counter_test);
    
    clk = 0;
    rst = 1;
    en = 0;
    
    #10;
    rst = 0;
    
    en = 1;
    $display("Time=%0t: en = 1", $time);
    
    repeat (5) begin
        #10 clk = ~clk;
        #10 clk = ~clk;
    end
    
    en = 0;
    $display("Time=%0t: en = 0", $time);
    
    repeat (3) begin
        #10 clk = ~clk;
        #10 clk = ~clk;
    end
    
    en = 1;
    $display("Time=%0t: en = 1", $time);
    
    repeat (5) begin
        #10 clk = ~clk;
        #10 clk = ~clk;
    end
    
    #10;
    $finish;
end

endmodule