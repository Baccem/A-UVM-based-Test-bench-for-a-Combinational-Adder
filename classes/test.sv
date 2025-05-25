// ================================= test =========================//
class test extends uvm_test;
`uvm_component_utils(test)
  function new(input string inst = "test", uvm_component parent = null);
    super.new(inst, parent);
endfunction
  
generator gen;
  env e;
  
  
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  gen = generator::type_id::create("gen");
  e = env::type_id::create("e",this);
endfunction
  

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    // rage3ha
     gen.start(e.a.seqr);
    //el delay da bta3 aa?
    #50
    phase.drop_objection(this);
  endtask

endclass
