`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module single_cycle_cpu(clk, reset, cpu_output); 
	input clk;
	input reset;
	output wire [31:0] cpu_output;

	wire [2:0] alu_op;
	wire [31:0] jump_address, pc_plus_4, temp_pc_counter;
	wire [3:0] flag_status;
	wire [4:0] read_reg_1, read_reg_2, write_reg; 
	wire [31:0] write_data, read_data_1, read_data_2, pc_in, pc_out, instruction_address, instruction, input_a, input_b, data_memory_address, data_memory_write_data, data_memory_read_data;
	wire mem_write, reg_write, zeroflag, signflag, carryflag, overflowflag, branch;
	reg flip_flop_zero_flag, flip_flop_sign_flag, flip_flop_carry_flag, flip_flop_overflow_flag;
	wire [31:0] immediate_value, shift_amount;
	wire [1:0] alu_src, mem_to_reg, reg_dst;

	program_counter pc(pc_in, pc_out, clk, reset);
	instruction_memory inst_mem(reset, instruction_address, instruction, clk);
	register_bank reg_bank(read_reg_1, read_reg_2, write_reg, write_data, reg_write, clk, read_data_1, read_data_2, reset);
	ALU alu(alu_op, input_a, input_b, cpu_output, zeroflag, signflag, carryflag, overflowflag);
	data_memory data_mem(data_memory_address, data_memory_write_data, data_memory_read_data, mem_write, clk);
	control ctrl(instruction, jump_address, pc_out, flip_flop_zero_flag, flip_flop_sign_flag, flip_flop_carry_flag, flip_flop_overflow_flag, alu_src, mem_to_reg, reg_dst, alu_op, flag_status, branch, mem_write, reg_write, temp_pc_counter, pc_plus_4);

	assign immediate_value = {{16{instruction[15]}}, instruction[15:0]};
	assign shift_amount = {{27{instruction[15]}}, instruction[15:11]};
	assign instruction_address = pc_out;
	assign input_a = read_data_1;
	assign data_memory_address = cpu_output;
	assign data_memory_write_data = read_data_2;
	assign jump_address = input_b;
	assign read_reg_1 = {instruction[25:21]};
	assign read_reg_2 = {instruction[20:16]};

	assign pc_in = ((flag_status[0]&flag_status[2]&flag_status[3])==1)?read_data_2:temp_pc_counter;

	Mux_4x1 mux_in_b(read_data_2, immediate_value, shift_amount, read_data_1, input_b, alu_src);
	Mux_4x1 mux_mem_to_reg(cpu_output, data_memory_read_data, pc_plus_4, 32'd0, write_data, mem_to_reg);
	Mux_4x1 #(5) mux_reg_dst(instruction[25:21], instruction[20:16], 5'd31, 5'd0, write_reg, reg_dst);

	always@(posedge clk)
	begin
		flip_flop_zero_flag <= zeroflag;
		flip_flop_sign_flag <= signflag;
		flip_flop_carry_flag <= carryflag;
		flip_flop_overflow_flag <= overflowflag;
	end
endmodule
