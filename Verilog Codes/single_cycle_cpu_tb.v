`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module single_cycle_cpu_tb;
	// Inputs
	reg clk;
	reg reset;
	
	// Outputs
	wire [31:0] cpu_output;

	// Instantiate the Unit Under Test (UUT)
	single_cycle_cpu uut (
		.clk(clk), 
		.reset(reset),
		.cpu_output(cpu_output)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#10;
		reset = 1;
		#10;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always #5 clk = ~clk;
endmodule

