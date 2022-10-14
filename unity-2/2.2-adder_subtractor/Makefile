.PHONY: all
CVHDL = ghdl

all: create

create:
	@echo "Compiling and executing the circuit..."
	${CVHDL} -a adder_subtractor.vhd
	${CVHDL} -m adder_subtractor
	${CVHDL} -a full_adder.vhd
	${CVHDL} -m full_adder

tb:
	@echo "Compiling and executing the testbench. Making the wave.ghw file."
	${CVHDL} -a adder_subtractor_tb.vhd
	${CVHDL} -m adder_subtractor_tb
	${CVHDL} -r adder_subtractor_tb --wave=wave.ghw

c:
	@echo "Cleaning all auxiliate files..."
	${CVHDL} --clean