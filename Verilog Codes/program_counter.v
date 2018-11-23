`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module program_counter(pc_in, pc_out, clk, reset);
	input wire[31:0] pc_in;
	output reg[31:0] pc_out;
	input clk, reset;

	always@(posedge reset or posedge clk)
	begin
		if(reset)
			pc_out <= 32'b0;
		else
			pc_out <= pc_in;
	end
endmodule
