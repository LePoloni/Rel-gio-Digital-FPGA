module encapsula_decoder (entra, sai);

	//Declaração de parâmetros
	parameter TIPO = "AC";	//AC - anodo comum ou CC - catodo comum

	//Declaração de ports
	input [3:0] entra;
	output reg [7:0] sai;
		
	//Declaração de tipos de dados
	wire [7:0] sai_ac, sai_cc;

	//Funcionamento do circuito
	decoder decoder_inst
	(
		.E_D(entra[3]) ,			// input  E_D_sig
		.E_C(entra[2]) ,			// input  E_C_sig
		.E_B(entra[1]) ,			// input  E_B_sig
		.E_A(entra[0]) ,			// input  E_A_sig
		.SEG_A  (sai_cc[0]) ,	// output  SEG_A_sig
		.SEG_A_N(sai_ac[0]) ,	// output  SEG_A_N_sig
		.SEG_B  (sai_cc[1]) ,	// output  SEG_B_sig
		.SEG_B_N(sai_ac[1]) ,	// output  SEG_B_N_sig
		.SEG_C  (sai_cc[2]) ,	// output  SEG_C_sig
		.SEG_C_N(sai_ac[2]) ,	// output  SEG_C_N_sig
		.SEG_D  (sai_cc[3]) ,	// output  SEG_D_sig
		.SEG_D_N(sai_ac[3]) ,	// output  SEG_D_N_sig
		.SEG_E  (sai_cc[4]) ,	// output  SEG_E_sig
		.SEG_E_N(sai_ac[4]) ,	// output  SEG_E_N_sig
		.SEG_F  (sai_cc[5]) ,	// output  SEG_F_sig
		.SEG_F_N(sai_ac[5]) ,	// output  SEG_F_N_sig
		.SEG_G  (sai_cc[6]) ,	// output  SEG_G_sig
		.SEG_G_N(sai_ac[6]) 		// output  SEG_G_N_sig	
	);
	
	//Definição da saída de acordo com o tipo de display usado
	always @ (*)
	begin
		if (TIPO == "AC")
			sai <= sai_ac;
		else if (TIPO == "CC")
			sai <= sai_cc;
		else
			sai <= 0;	//Se colocar o parâmetro errado, saí sempre 0			
	end
	
	assign sai_cc[7] = 0;
	assign sai_ac[7] = 1;

endmodule
