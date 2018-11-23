`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module data_memory(address, write_data, read_data, mem_write, clk);

	input [31:0] address, write_data;
	input mem_write;
	output [31:0] read_data;
	input clk;
	
	reg [31:0] Data_Memory [31:0];
	
	assign read_data = Data_Memory[address[4:0]];

	always @(posedge clk)
	begin
		if(mem_write)
			Data_Memory[address[4:0]] <= write_data;
	end
endmodule
