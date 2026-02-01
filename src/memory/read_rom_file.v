module read_rom_file (
    input wire [7:0] address,
    output wire [23:0] data_out
);

    reg [23:0] rom_memory [0:255];  // 256 x 24-bit ROM

    initial begin
        $readmemh("memory/rom_data.mem", rom_memory);  // Changed to hex format
    end

    assign data_out = rom_memory[address];

endmodule