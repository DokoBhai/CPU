.PHONY: build clean run wave

build:
	iverilog -o build/adder_tb tb/adder_tb.v src/adder.v src/adder8.v

run: build
	vvp build/adder_tb

wave:
	gtkwave build/adder8.vcd

clean:
	rm -f build/*
