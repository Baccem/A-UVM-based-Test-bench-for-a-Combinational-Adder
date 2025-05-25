//============================= Env ====================================//

class env extends uvm_env;
  `uvm_component_utils(env)
  
  agent a;
  scoreboard s;
  
  function new(input string inst = "env", uvm_component parent=null);
    super.new(inst, parent);
endfunction
  
  
 function void build_phase(uvm_phase phase);
super.build_phase(phase);
  s = scoreboard::type_id::create("s",this);
  a = agent::type_id::create("a",this);
endfunction
  
function void connect_phase(uvm_phase phase);
  	super.connect_phase(phase);

  a.mon.send.connect(s.recv);
  
endfunction
  
  
endclass
