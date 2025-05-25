
# File lists
TOP         = tb
SV_FILES    = tb.sv dut.sv mypkg.sv $(wildcard ./classes/*.sv)
VPD_FILE    = dump.vpd
# Include directories
INCDIRS     = +incdir+./ +incdir+./classes

# Simulation executable name
SIMV        = simv

# VPD waveform file
VPD_FILE    = dump.vpd

# Compile
compile:
	vcs -full64 -sverilog -ntb_opts uvm -debug_access+all $(UVM_HOME)/uvm_pkg.sv -f compile.f -top $(TOP) -l compile.log

#$vcs -sverilog -full64 -ntb_opts uvm -debug_access+all $UVM_HOME/uvm_pkg.sv -f compile.f -top tb

# Run simulation
simulate:
	./$(SIMV) +UVM_TESTNAME=test +vcs+vcdpluson -l sim.log

# View waveform
view:
	dve -full64 -vpd ${VPD_FILE} &

# Clean temporary files
clean:
	rm -rf csrc simv* *.log *.vpd *.vcd *.vdb *.key *.h

# Default target
all: compile simulate view
