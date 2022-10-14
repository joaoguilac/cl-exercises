.PHONY: all
CVHDL = ghdl

all: create

create:
	@echo "Compiling and executing the circuit..."
	${CVHDL} -a comparator.vhd
	${CVHDL} -m comparator
	${CVHDL} -a bit_comparator.vhd
	${CVHDL} -m bit_comparator

tb:
	@echo "Compiling and executing the testbench. Making the wave.ghw file."
	${CVHDL} -a comparator_tb.vhd
	${CVHDL} -m comparator_tb
	${CVHDL} -r comparator_tb --wave=wave.ghw

c:
	@echo "Cleaning all auxiliate files..."
	${CVHDL} --clean