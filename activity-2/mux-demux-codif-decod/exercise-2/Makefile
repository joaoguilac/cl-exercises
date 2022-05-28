.PHONY: all
CVHDL = ghdl

all: create

create:
	@echo "Compiling and executing the circuit..."
	${CVHDL} -a coffee_machine.vhd
	${CVHDL} -m coffee_machine
	${CVHDL} -a encoder.vhd
	${CVHDL} -m encoder
	${CVHDL} -a mux.vhd
	${CVHDL} -m mux

tb:
	@echo "Compiling and executing the testbench. Making the wave.ghw file."
	${CVHDL} -a coffee_machine_tb.vhd
	${CVHDL} -m coffee_machine_tb
	${CVHDL} -r coffee_machine_tb --wave=wave.ghw

c:
	@echo "Cleaning all auxiliate files..."
	${CVHDL} --clean