.PHONY: build clean run wave

build:
	iverilog -o build/adder_tb tb/adder_tb.v src/adder.v src/adder8.v src/subtractor.v src/subtractor8.v tb/subtractor_tb.v src/register8.v tb/register_tb.v

run: build
	vvp build/adder_tb build/subtractor_tb build/register_tb

wave:
	gtkwave build/adder8.vcd build/subtractor_tb.vcd build/register_tb.vcd

clean:
	rm -f build/*
