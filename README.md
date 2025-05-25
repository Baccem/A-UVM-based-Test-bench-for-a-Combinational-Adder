<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

  <h1>UVM Testbench for 2-Input Combinational Adder</h1>

  <p>This project implements a simple yet structured UVM (Universal Verification Methodology) environment to verify a 2-input combinational adder. It showcases the use of UVM components including sequences, drivers, monitors, and a scoreboard to validate DUT functionality through constrained random stimulus and result checking.</p>

  <div class="section">
    <h2>Design Under Test (DUT)</h2>
    <p>The DUT is a 2-input combinational adder module. It takes four input values (<code>a</code>, <code>b</code> each of 4-bit width and produces a 5-bit summed output.</p>
  </div>

  <div class="section">
    <h2>Testbench Architecture</h2>
    <ul>
      <li><strong>Transaction Class</strong>: Defines a <code>transaction</code> object containing the four inputs and the expected output.</li>
      <li><strong>Generator</strong>: Randomizes input values and sends transactions to the driver.</li>
      <li><strong>Driver</strong>: Drives randomized inputs to the DUT using virtual interfaces.</li>
      <li><strong>Monitor</strong>: Captures the input and output from the DUT and forwards it to the scoreboard.</li>
      <li><strong>Scoreboard</strong>: Recomputes the expected result and compares it with DUT output to detect mismatches.</li>
      <li><strong>Environment</strong>: Assembles the agent and scoreboard.</li>
      <li><strong>Test</strong>: Configures the environment and starts the test sequence.</li>
    </ul>
  </div>

  <div class="section">
    <h2>File Structure</h2>
    <pre>
classes/
  ├── transaction.sv
  ├── generator.sv
  ├── driver.sv
  ├── monitor.sv
  ├── scoreboard.sv
  ├── agent.sv
  ├── env.sv
  └── test.sv
mypkg.sv
dut.sv
tb.sv
    </pre>
  </div>

  <div class="section">
    <h2>How to Run using Synopsys VCS</h2>
    <ol>
      <li>Compile and simulate using VCS:
        <pre><code>vcs -full64 -sverilog -ntb_opts uvm -debug_access+all $UVM_HOME/uvm_pkg.sv -f compile.f -top tb.sv -l compile.log
</code></pre>
      </li>
      <li>Run simulation:
        <pre><code>./simv +UVM_TESTNAME=test +vcs+vcdpluson -l sim.log</code></pre>
      </li>
      <li>View waveform (if enabled):
        <pre><code>dve -full64 -vpd dump.vpd &</code></pre>
      </li>
    </ol>
  </div>

  <div class="section">
  </div>

  <div class="section">
    <h2>Author</h2>
    <p>Created by Bassem Attia using UVM and SystemVerilog, to demonstrate simple functional verification principles using a modular testbench.</p>
  </div>

</body>
</html>
