.PHONY: all build run wave clean test-alu test-pc test-rom test-rom-alu

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

test-rom-alu:
	iverilog -o build/rom_alu_test \
		src/memory/read_rom_file.v \
		src/ALU.v \
		src/arithmetic/adder.v \
		src/arithmetic/adder8.v \
		src/arithmetic/subtractor.v \
		src/arithmetic/subtractor8.v \
		tb/integration/rom_alu_test.v
	vvp build/rom_alu_test
	gtkwave build/rom_alu_test.vcd

test-alu: build run
	gtkwave build/ALU_tb.vcd

wave:
	gtkwave build/ALU_tb.vcd

clean:
	rm -rf build/*
