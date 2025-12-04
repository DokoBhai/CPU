.PHONY: build clean run wave

build:
	iverilog -o build/adder_tb tb/adder_tb.v src/adder.v src/adder4.v

run: build
	vvp build/adder_tb

wave:
	gtkwave build/adder4.vcd

clean:
	rm -f build/*
