// Code your testbench here
// or browse Examples

`timescale 1ps/1ps

`include "mypkg.sv"


//============================== TOP =========================//
module tb();
  //instance of interface
add_if vif();
  //instance of DUT 
  add dut (.a(vif.a), .b(vif.b), .y(vif.y));
  initial begin 
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
  initial begin  
    uvm_config_db #(virtual add_if)::set(null, "uvm_test_top.e.a*", "vif", vif);
	run_test("test");
end

  
endmodule







