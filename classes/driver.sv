
//====================== Driver =================//
class driver extends uvm_driver #(transaction);
  `uvm_component_utils(driver)
  function new(input string path = "driver",uvm_component parent= null);
    super.new(path,parent);
  endfunction
  
  transaction t;
  virtual add_if vif;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = transaction::type_id::create("t");
    //constructing vif
    if(!uvm_config_db #(virtual add_if)::get(this,"","vif",vif)) 
      `uvm_error("DRV","Unable to access uvm_config_db");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	forever begin 
      seq_item_port.get_next_item(t);
      vif.a <= t.a;
      vif.b <= t.b;
      `uvm_info("DRV", $sformatf("Trigger DUT a: %0d ,b :  %0d",t.a, t.b), UVM_NONE);

      seq_item_port.item_done();
      #10;
    end
  endtask
  
endclass