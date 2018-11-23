`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module ALU(alu_op, input_a, input_b, alu_output, zeroflag, signflag, carryflag, overflowflag); 
	input [2:0] alu_op;
	input [31:0] input_a, input_b;
	output [31:0] alu_output;
	output zeroflag, signflag, carryflag, overflowflag;

	wire[31:0] add_out, comp_out, and_out, xor_out;
	wire[31:0] shift_a;
	alu_adder aa1(input_a, input_b, 1'b0, add_out, carryflag_temp, overflowflag_temp);
	alu_comp ac1(input_b, comp_out);
	alu_and ad1(input_a, input_b, and_out);
	alu_xor ax1(input_a, input_b, xor_out);
	shifter s1(input_a, input_b[4:0], shift_a, alu_op[0], alu_op[1]);

	Mux_8x1 Mux_ALU (add_out, comp_out, and_out, xor_out, shift_a, shift_a, {32'b0}, shift_a, alu_output, alu_op);
	Mux #(1) Mux_CarryFlag (carryflag_temp, 1'b0, carryflag, |alu_op);
	Mux #(1) Mux_OverflowFlag (overflowflag_temp, 1'b0, overflowflag, |alu_op);
	assign zeroflag = ~|(alu_output);
	assign signflag = alu_output[31];
endmodule

module full_bit_adder(input_a, input_b, input_carry, output_sum, output_carry);
	input input_a, input_b, input_carry;
	output output_sum, output_carry;
	
	wire temp;
	assign temp = input_a ^ input_b;
	assign output_sum = temp ^ input_carry;
	assign output_carry = (input_a & input_b) | (input_carry & temp);
endmodule

module alu_adder(input_a, input_b, input_carry, output_sum, carryflag, overflowflag);	
	input [31:0] input_a, input_b;
	input input_carry;
	output [31:0] output_sum;
	output carryflag, overflowflag;
	
	wire [31:0] carry;
	full_bit_adder a0(input_a[0], input_b[0], input_carry, output_sum[0], carry[0]);
	full_bit_adder a1(input_a[1], input_b[1], carry[0], output_sum[1], carry[1]);
	full_bit_adder a2(input_a[2], input_b[2], carry[1], output_sum[2], carry[2]);
	full_bit_adder a3(input_a[3], input_b[3], carry[2], output_sum[3], carry[3]);
	full_bit_adder a4(input_a[4], input_b[4], carry[3], output_sum[4], carry[4]);
	full_bit_adder a5(input_a[5], input_b[5], carry[4], output_sum[5], carry[5]);
	full_bit_adder a6(input_a[6], input_b[6], carry[5], output_sum[6], carry[6]);
	full_bit_adder a7(input_a[7], input_b[7], carry[6], output_sum[7], carry[7]);
	full_bit_adder a8(input_a[8], input_b[8], carry[7], output_sum[8], carry[8]);
	full_bit_adder a9(input_a[9], input_b[9], carry[8], output_sum[9], carry[9]);
	full_bit_adder a10(input_a[10], input_b[10], carry[9], output_sum[10], carry[10]);
	full_bit_adder a11(input_a[11], input_b[11], carry[10], output_sum[11], carry[11]);
	full_bit_adder a12(input_a[12], input_b[12], carry[11], output_sum[12], carry[12]);
	full_bit_adder a13(input_a[13], input_b[13], carry[12], output_sum[13], carry[13]);
	full_bit_adder a14(input_a[14], input_b[14], carry[13], output_sum[14], carry[14]);
	full_bit_adder a15(input_a[15], input_b[15], carry[14], output_sum[15], carry[15]);
	full_bit_adder a16(input_a[16], input_b[16], carry[15], output_sum[16], carry[16]);
	full_bit_adder a17(input_a[17], input_b[17], carry[16], output_sum[17], carry[17]);
	full_bit_adder a18(input_a[18], input_b[18], carry[17], output_sum[18], carry[18]);
	full_bit_adder a19(input_a[19], input_b[19], carry[18], output_sum[19], carry[19]);
	full_bit_adder a20(input_a[20], input_b[20], carry[19], output_sum[20], carry[20]);
	full_bit_adder a21(input_a[21], input_b[21], carry[20], output_sum[21], carry[21]);
	full_bit_adder a22(input_a[22], input_b[22], carry[21], output_sum[22], carry[22]);
	full_bit_adder a23(input_a[23], input_b[23], carry[22], output_sum[23], carry[23]);
	full_bit_adder a24(input_a[24], input_b[24], carry[23], output_sum[24], carry[24]);
	full_bit_adder a25(input_a[25], input_b[25], carry[24], output_sum[25], carry[25]);
	full_bit_adder a26(input_a[26], input_b[26], carry[25], output_sum[26], carry[26]);
	full_bit_adder a27(input_a[27], input_b[27], carry[26], output_sum[27], carry[27]);
	full_bit_adder a28(input_a[28], input_b[28], carry[27], output_sum[28], carry[28]);
	full_bit_adder a29(input_a[29], input_b[29], carry[28], output_sum[29], carry[29]);
	full_bit_adder a30(input_a[30], input_b[30], carry[29], output_sum[30], carry[30]);
	full_bit_adder a31(input_a[31], input_b[31], carry[30], output_sum[31], carry[31]);
	
	assign carryflag = 1;
	assign overflowflag = 0;
endmodule

module alu_comp(input_a, output_value);
	input [31:0] input_a;
	output [31:0] output_value;
	
	assign output_value = ~(input_a) + 1;
endmodule	

module alu_and(input_a, input_b, output_value);
	input [31:0] input_a, input_b;
	output [31:0] output_value;
	
	assign output_value = input_a & input_b;
endmodule	

module alu_xor(input_a, input_b, output_value);
	input [31:0] input_a, input_b;
	output [31:0] output_value;
	
	assign output_value = input_a ^ input_b;
endmodule

module shifter(input_a, shift, output_value, direction, sign_extend);
	input [31:0] input_a;
	input [4:0] shift;
	output [31:0] output_value;
	input direction;
	input sign_extend;
	assign first_bit = sign_extend & input_a[31];
	
	wire [31:0] temp1, temp2, temp3, temp4, out1, out2, out3, out4, out5;
	Mux Mux1({input_a[30:0], 1'b0}, {{1{first_bit}}, input_a[31:1]}, out1, direction);
	Mux Mux2(input_a, out1, temp1, shift[0]);
	Mux Mux3({temp1[29:0], 2'b0}, {{2{first_bit}}, temp1[31:2]}, out2, direction);
	Mux Mux4(temp1, out2, temp2, shift[1]);
	Mux Mux5({temp2[27:0], 4'b0}, {{4{first_bit}}, temp2[31:4]}, out3, direction);
	Mux Mux6(temp2, out3, temp3, shift[2]);
	Mux Mux7({temp3[23:0], 8'b0}, {{8{first_bit}}, temp3[31:8]}, out4, direction);
	Mux Mux8(temp3, out4, temp4, shift[3]);
	Mux Mux9({temp4[15:0], 16'b0}, {{16{first_bit}}, temp4[31:16]}, out5, direction);
	Mux Mux10(temp4, out5, output_value, shift[4]);
endmodule
