#
# Makefile for Verilog building
# reference https://wiki.hacdc.org/index.php/Iverilogmakefile
# 
# USE THE FOLLOWING COMMANDS WITH THIS MAKEFILE
#	"make check" - compiles your verilog design - good for checking code
#	"make simulate" - compiles your design+TB & simulates your design
#	"make display" - compiles, simulates and displays waveforms
# 
###############################################################################
#
# CHANGE THESE THREE LINES FOR YOUR DESIGN
#
#TOOL INPUT
COMPONENT = dff
SRC = $(COMPONENT).sv
SIM_ARGS=
TESTBENCH = tb_$(COMPONENT).sv
TBOUTPUT = tb_$(COMPONENT).vcd	#THIS NEEDS TO MATCH THE OUTPUT FILE
							#FROM YOUR TESTBENCH
BINARY = bin_$(COMPONENT)
###############################################################################
# BE CAREFUL WHEN CHANGING ITEMS BELOW THIS LINE
###############################################################################
#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave #works on your host, not docker container since it's a GUI
#TOOL OPTIONS
COFLAGS = -g2012
SFLAGS = -lxt2
SOUTPUT = -lxt2		#SIMULATOR OUTPUT TYPE
#TOOL OUTPUT
#COUTPUT = compiler.out			#COMPILER OUTPUT
###############################################################################
#MAKE DIRECTIVES
.PHONY: compile simulate display clean
compile : $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) -o $(BINARY) $(TESTBENCH) $(SRC)

simulate: $(COMPONENT)
	$(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)

display: $(TBOUTPUT)
	$(VIEWER) $(TBOUTPUT) &

clean:
	/bin/rm -f $(BINARY) $(TBOUTPUT) a.out compiler.out
