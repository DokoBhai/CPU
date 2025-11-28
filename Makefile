.PHONY: build clean

build:
	iverilog -o build/adder src/adder.v

run: build
	vvp build/adder 

wave: 
	gtkwave build/adder.vcd

clean: 
	rm build/*
