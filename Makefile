.PHONY: all build run wave clean

# Default target
all: build run

# Build and run ALU testbench
build:
	iverilog -o build/ALU_tb tb/*.v src/*.v

run: build
	vvp build/ALU_tb

wave:
	gtkwave build/ALU_tb.vcd

clean:
	rm -rf build/*
