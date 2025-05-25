//========================== scoreboard ========================//

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
    uvm_analysis_imp #(transaction,scoreboard) recv;  
  function new(input string path = "scoreboard",uvm_component parent= null);
    super.new(path,parent);
  recv = new("recv", this);
  endfunction

  transaction tr;
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     tr = transaction::type_id::create("tr");
  endfunction
  

  
  function void write(input transaction t);
  	//this.t = t;
    tr=t;
    
    `uvm_info("SCO",$sformatf("Data rcvd from Monitor a: %0d , b : %0d and y : %0d",tr.a,tr.b,tr.y), UVM_NONE);

    
    if (tr.y == tr.a + tr.b) begin 
      `uvm_info("SCO","Test Passed", UVM_NONE)
    end else begin 
      `uvm_info("SCO","Test Failed", UVM_NONE)
    end
    
  endfunction
  
endclass