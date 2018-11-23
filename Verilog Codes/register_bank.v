`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module register_bank(read_reg_1, read_reg_2, write_reg, write_data, reg_write, clk, read_data_1, read_data_2, reset);
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input [31:0] write_data;
	input reg_write;
	input clk;
	output [31:0] read_data_1;
	output [31:0] read_data_2;
	input reset;
	
	reg [31:0] Reg_Bank [31:0];
	
	assign read_data_1 = Reg_Bank[read_reg_1];
	assign read_data_2 = Reg_Bank[read_reg_2];

	always @(posedge clk)
	begin
	if(reg_write)
		Reg_Bank[write_reg] <= write_data;
	end
endmodule
