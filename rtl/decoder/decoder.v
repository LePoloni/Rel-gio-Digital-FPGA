// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Sat Jan 27 13:05:47 2024"

module decoder(
	E_D,
	E_C,
	E_B,
	E_A,
	SEG_A,
	SEG_A_N,
	SEG_B,
	SEG_B_N,
	SEG_C,
	SEG_C_N,
	SEG_D,
	SEG_D_N,
	SEG_E,
	SEG_E_N,
	SEG_F,
	SEG_F_N,
	SEG_G,
	SEG_G_N
);


input wire	E_D;
input wire	E_C;
input wire	E_B;
input wire	E_A;
output wire	SEG_A;
output wire	SEG_A_N;
output wire	SEG_B;
output wire	SEG_B_N;
output wire	SEG_C;
output wire	SEG_C_N;
output wire	SEG_D;
output wire	SEG_D_N;
output wire	SEG_E;
output wire	SEG_E_N;
output wire	SEG_F;
output wire	SEG_F_N;
output wire	SEG_G;
output wire	SEG_G_N;






segmento_a	b2v_inst(
	.A(E_A),
	.C(E_C),
	.B(E_B),
	.D(E_D),
	.seg_a(SEG_A),
	.seg_a_n(SEG_A_N));


segmento_c	b2v_inst1(
	.A(E_A),
	.B(E_B),
	.C(E_C),
	.D(E_D),
	.segmento_c(SEG_C),
	.segmento_c_barra(SEG_C_N));


segmento_d	b2v_inst2(
	.A(E_A),
	.B(E_B),
	.C(E_C),
	.D(E_D),
	.seg_d(SEG_D),
	.seg_d_n(SEG_D_N));


segmento_e	b2v_inst3(
	.D(E_D),
	.C(E_C),
	.B(E_B),
	.A(E_A),
	.seg_e(SEG_E),
	.seg_e_n(SEG_E_N));


segmento_f	b2v_inst5(
	.A(E_A),
	.B(E_B),
	.C(E_C),
	.D(E_D),
	.seg_f(SEG_F),
	.seg_f_n(SEG_F_N));


segmento_g	b2v_inst6(
	.A(E_A),
	.B(E_B),
	.C(E_C),
	.D(E_D),
	.seg_g(SEG_G),
	.seg_g_n(SEG_G_N));


segmento_b	b2v_inst7(
	.A(E_A),
	.B(E_B),
	.C(E_C),
	.D(E_D),
	.seg_b(SEG_B),
	.seg_b_n(SEG_B_N));


endmodule
