module rom_test();

reg [2:0] address;
wire [1:0] data_out;

read_rom_file dut (
    .address(address),
    .data_out(data_out)
);

initial begin
    $dumpfile("build/rom_test.vcd");
    $dumpvars(0, rom_test);
    
    address = 3'b000; #10;
    address = 3'b001; #10;
    address = 3'b010; #10;
    address = 3'b011; #10;
    address = 3'b100; #10;
    address = 3'b101; #10;
    address = 3'b110; #10;
    address = 3'b111; #10;
    
    $finish;
end

endmodule