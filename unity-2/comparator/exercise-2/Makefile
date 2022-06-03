.PHONY: all
CVHDL = ghdl

all: create

create:
	@echo "Compiling and executing the circuit..."
	${CVHDL} -a higher_number.vhd
	${CVHDL} -m higher_number

tb:
	@echo "Compiling and executing the testbench. Making the wave.ghw file."
	${CVHDL} -a higher_number_tb.vhd
	${CVHDL} -m higher_number_tb
	${CVHDL} -r higher_number_tb --wave=wave.ghw

c:
	@echo "Cleaning all auxiliate files..."
	${CVHDL} --clean