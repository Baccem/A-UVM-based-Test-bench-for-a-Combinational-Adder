// ===================== monitor =========================/

class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
    uvm_analysis_port #(transaction) send;
  function new(input string path = "monitor",uvm_component parent= null);
    super.new(path,parent);
        send = new("send", this);
  endfunction
  
   transaction t;
 	virtual add_if vif;
  uvm_analysis_port #(transaction) send;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
        t = transaction::type_id::create("t");
    if(!uvm_config_db#(virtual add_if)::get(this,"","vif",vif)) 
   `uvm_error("MON","Unable to access uvm_config_db");
  endfunction

  task run_phase(uvm_phase phase);
    forever begin 
      #10;
      t.a = vif.a;
      t.b = vif.b;
      //output
      t.y = vif.y;
      send.write(t);
    end
  endtask

  
endclass