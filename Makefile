.PHONY: all build run wave clean test-alu test-pc test-rom

all: build run

build:
	iverilog -o build/ALU_tb tb/unit_tests/ALU_tb.v src/ALU.v src/arithmetic/*.v

run: build
	vvp build/ALU_tb

test-pc:
	iverilog -o build/program_counter_test tb/logic/program_counter_test.v src/logic/program_counter.v
	vvp build/program_counter_test
	gtkwave build/program_counter_test.vcd

test-rom:
	iverilog -o build/rom_test tb/memory/rom_test.v src/memory/read_rom_file.v
	vvp build/rom_test
	gtkwave build/rom_test.vcd

test-alu: build run
	gtkwave build/ALU_tb.vcd

wave:
	gtkwave build/ALU_tb.vcd

clean:
	rm -rf build/*
