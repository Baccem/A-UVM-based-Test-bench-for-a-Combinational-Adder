// ============================== agent ==============================//
class agent extends uvm_agent;
  `uvm_component_utils(agent)

  	uvm_sequencer#(transaction) seqr;
  driver drv;
  monitor mon;
  
    function new(input string path = "agent",uvm_component parent= null);
    super.new(path,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
super.build_phase(phase);
     mon = monitor::type_id::create("mon",this);
     drv = driver::type_id::create("drv",this);
     seqr = uvm_sequencer#(transaction)::type_id::create("seqr",this);
endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass
