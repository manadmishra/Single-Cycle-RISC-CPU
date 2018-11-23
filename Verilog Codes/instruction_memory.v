`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module instruction_memory(reset, instruction_address, output_instruction, clk);
	input reset;
	input [31:0] instruction_address;
	input clk;
	output [31:0] output_instruction;
	
	bram_inst inst_memory(.clka(~clk), .wea({1'b0}), .addra(instruction_address[8:2]), .dina({32'b0}), .douta(output_instruction));
endmodule
