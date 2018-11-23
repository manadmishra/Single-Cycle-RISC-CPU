`timescale 1ns / 1ps

/*
Group No. : 14
Members : 
	Arijit Kar (16CS30005)
	Manad Mishra (16CS30019)
*/

module adder(input_a, input_b, input_carry, output_sum);	
	input [31:0] input_a, input_b;
	input input_carry;
	output [31:0] output_sum;
	
	wire [31:0] carry;
	full_bit_adder fa0(input_a[0], input_b[0], input_carry, output_sum[0], carry[0]);
	full_bit_adder fa1(input_a[1], input_b[1], carry[0], output_sum[1], carry[1]);
	full_bit_adder fa2(input_a[2], input_b[2], carry[1], output_sum[2], carry[2]);
	full_bit_adder fa3(input_a[3], input_b[3], carry[2], output_sum[3], carry[3]);
	full_bit_adder fa4(input_a[4], input_b[4], carry[3], output_sum[4], carry[4]);
	full_bit_adder fa5(input_a[5], input_b[5], carry[4], output_sum[5], carry[5]);
	full_bit_adder fa6(input_a[6], input_b[6], carry[5], output_sum[6], carry[6]);
	full_bit_adder fa7(input_a[7], input_b[7], carry[6], output_sum[7], carry[7]);
	full_bit_adder fa8(input_a[8], input_b[8], carry[7], output_sum[8], carry[8]);
	full_bit_adder fa9(input_a[9], input_b[9], carry[8], output_sum[9], carry[9]);
	full_bit_adder fa10(input_a[10], input_b[10], carry[9], output_sum[10], carry[10]);
	full_bit_adder fa11(input_a[11], input_b[11], carry[10], output_sum[11], carry[11]);
	full_bit_adder fa12(input_a[12], input_b[12], carry[11], output_sum[12], carry[12]);
	full_bit_adder fa13(input_a[13], input_b[13], carry[12], output_sum[13], carry[13]);
	full_bit_adder fa14(input_a[14], input_b[14], carry[13], output_sum[14], carry[14]);
	full_bit_adder fa15(input_a[15], input_b[15], carry[14], output_sum[15], carry[15]);
	full_bit_adder fa16(input_a[16], input_b[16], carry[15], output_sum[16], carry[16]);
	full_bit_adder fa17(input_a[17], input_b[17], carry[16], output_sum[17], carry[17]);
	full_bit_adder fa18(input_a[18], input_b[18], carry[17], output_sum[18], carry[18]);
	full_bit_adder fa19(input_a[19], input_b[19], carry[18], output_sum[19], carry[19]);
	full_bit_adder fa20(input_a[20], input_b[20], carry[19], output_sum[20], carry[20]);
	full_bit_adder fa21(input_a[21], input_b[21], carry[20], output_sum[21], carry[21]);
	full_bit_adder fa22(input_a[22], input_b[22], carry[21], output_sum[22], carry[22]);
	full_bit_adder fa23(input_a[23], input_b[23], carry[22], output_sum[23], carry[23]);
	full_bit_adder fa24(input_a[24], input_b[24], carry[23], output_sum[24], carry[24]);
	full_bit_adder fa25(input_a[25], input_b[25], carry[24], output_sum[25], carry[25]);
	full_bit_adder fa26(input_a[26], input_b[26], carry[25], output_sum[26], carry[26]);
	full_bit_adder fa27(input_a[27], input_b[27], carry[26], output_sum[27], carry[27]);
	full_bit_adder fa28(input_a[28], input_b[28], carry[27], output_sum[28], carry[28]);
	full_bit_adder fa29(input_a[29], input_b[29], carry[28], output_sum[29], carry[29]);
	full_bit_adder fa30(input_a[30], input_b[30], carry[29], output_sum[30], carry[30]);
	full_bit_adder fa31(input_a[31], input_b[31], carry[30], output_sum[31], carry[31]);
endmodule
