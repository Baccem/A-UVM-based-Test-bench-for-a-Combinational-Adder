
//===================== generator =================//
class generator extends uvm_sequence #(transaction);
  `uvm_object_utils(generator)
  function new (input string path = "generator");
    super.new(path);
  endfunction
  
  transaction t;
  
  virtual task body();
    t = transaction::type_id::create("t");
    repeat(10) begin 
     // t = transaction::type_id::create("generator")
      start_item(t);
      t.randomize();
      `uvm_info("GEN",$sformatf("Data sento to Drive: a :%0d, b :%0d",t.a,t.b),UVM_NONE);
      finish_item(t);
    end
  endtask
  
endclass