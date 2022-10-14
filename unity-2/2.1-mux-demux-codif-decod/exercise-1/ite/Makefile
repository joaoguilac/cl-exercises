.PHONY: all
CVHDL = ghdl

all: create

create:
	@echo "Compiling and executing the circuit..."
	${CVHDL} -a demux.vhd
	${CVHDL} -m demux

tb:
	@echo "Compiling and executing the testbench. Making the wave.ghw file."
	${CVHDL} -a demux_tb.vhd
	${CVHDL} -m demux_tb
	${CVHDL} -r demux_tb --wave=wave.ghw

c:
	@echo "Cleaning all auxiliate files..."
	${CVHDL} --clean