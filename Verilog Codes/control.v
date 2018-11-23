`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module control(instruction, address, pc_in, zero_flag, sign_flag, carry_flag, overflow_flag, alu_src, mem_to_reg, reg_dst, alu_op, flag_status, branch, mem_write, reg_write, pc_out, pc_plus_4);
	input [31:0] instruction;
	input [31:0] address;
	input [31:0] pc_in;
	input zero_flag, sign_flag, carry_flag, overflow_flag;
	output reg [1:0] alu_src, mem_to_reg, reg_dst;
	output reg [2:0] alu_op;
	output reg [3:0] flag_status;
	output reg branch, mem_write, reg_write;
	output [31:0] pc_out;
	output wire[31:0] pc_plus_4;
	 
	wire [5:0] op_code;
	assign op_code = instruction[31:26];
	wire [4:0] funct_code;
	assign funct_code = instruction[4:0];

	wire [31:0] jump_counter; 
	wire flag, flag_temp, jump_condition;

	always@(*)
	begin
		case(op_code)
				6'd32: 
				begin
					alu_op <= funct_code[2:0];
					case(funct_code)
						5'd0:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd1:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd2:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd3:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd4:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b10;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd5:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b10;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd12:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd13:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd7:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b10;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						5'd15:
						begin
							branch <= 1'b0;
							flag_status <= 4'b0;
							mem_write <= 1'b0;
							reg_write <= 1'b1;
							alu_src <= 2'b0;
							mem_to_reg <= 2'b0;
							reg_dst <= 2'b0;
						end
						
						

					endcase
					
				end
				
				6'd0:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b0;
					flag_status <= 4'b0;
					mem_write <= 1'b0;
					reg_write <= 1'b1;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd1:
				begin 
					alu_op <= 3'b1;
					branch <= 1'b0;
					flag_status <= 4'b0;
					mem_write <= 1'b0;
					reg_write <= 1'b1;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd2:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b0;
					flag_status <= 4'b0;
					mem_write <= 1'b0;
					reg_write <= 1'b1;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b1;
					reg_dst <= 2'b1;
				end
				
				6'd3:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b0;
					flag_status <= 4'b0;
					mem_write <= 1'b1;
					reg_write <= 1'b0;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd4, 6'd5, 6'd6, 6'd7, 6'd8, 6'd9, 6'd10, 6'd11:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b0;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd12:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b0;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd13:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b0;
					alu_src <= 2'b11;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				6'd14:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b1;
					alu_src <= 2'b1;
					mem_to_reg <= 2'b10;
					reg_dst <= 2'b10;
				end
				
				6'd15:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b0;
					alu_src <= 2'b11;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
				
				default:
				begin 
					alu_op <= 3'b0;
					branch <= 1'b1;
					flag_status <= op_code[3:0];
					mem_write <= 1'b0;
					reg_write <= 1'b0;
					alu_src <= 2'b11;
					mem_to_reg <= 2'b0;
					reg_dst <= 2'b0;
				end
		endcase
	end
	
	Mux_4x1 #(1) MuxFlagSelector(sign_flag, overflow_flag, zero_flag, carry_flag, flag_temp, flag_status[2:1]);
	Mux #(1) MuxSignSelector(flag_temp, ~flag_temp, flag, flag_status[0]);
	assign jump_condition = (flag|(flag_status[3]&flag_status[2]))&branch;
	adder A1 (pc_in, 32'b100, 1'b0, pc_plus_4);
	adder A2 (pc_plus_4, {address[29:0],2'b0}, 1'b0, jump_counter);
	Mux MuxDestinationSelector(pc_plus_4, jump_counter, pc_out, jump_condition);
endmodule
