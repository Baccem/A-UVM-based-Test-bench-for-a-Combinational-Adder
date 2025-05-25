// UVM Library
+incdir+$UVM_HOME
$UVM_HOME/uvm_pkg.sv

// Include dirs for your project
//+incdir+./interfaces
+incdir+./classes

// Interface and DUT
//interfaces/add_if.sv
dut.sv

// TB files
mypkg.sv
classes/transaction.sv
classes/generator.sv
classes/driver.sv
classes/monitor.sv
classes/scoreboard.sv
classes/agent.sv
classes/env.sv
classes/test.sv
tb.sv

