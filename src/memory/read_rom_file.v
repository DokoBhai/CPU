module read_rom_file (
    input wire [2:0] address,
    output wire [1:0] data_out
);

    reg [1:0] rom_memory [0:7];

    initial begin
        $readmemb("memory/rom_data.mem", rom_memory);
    end

    assign data_out = rom_memory[address];

endmodule