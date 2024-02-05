module SE13_Relogio_Aula (clk, rst, speed, dh, uh, dm, um, ds, us);

	//Declaração de parâmetros
	parameter main_clock = 10_000_000;
	
	//Declaração de ports
	input clk, rst, speed;
	output [7:0] dh, uh, dm, um, ds, us;

	//Declaração de tipos de dados
	wire clk_1, clk_c;
	wire clk_out [5:0];
	wire [3:0] count [5:0];
	wire [7:0] disp [5:0];
	wire rst_24h;
	reg  clk_base; 

	//Funcionamento do circuito
	
	//Instanciação do prescaler
	prescaler #(.main_clock(main_clock), .custom_clock(500)) 
				 prescaler_inst(.clk_in(clk), 	.rst(rst), 
									 .clk_1Hz(clk_1), .clk_c(clk_c));
									 
	//Instanciação dos contadores
	contador #(.modulo(10), .largura(4))
				us_inst(.clk_in (clk_base),	.rst(rst), 
						  .clk_out(clk_out[0]), .count(count[0]));
						  
	contador #(.modulo( 6), .largura(4))
				ds_inst(.clk_in (clk_out[0]), .rst(rst), 
					     .clk_out(clk_out[1]), .count(count[1]));
	
	contador #(.modulo(10), .largura(4))
				um_inst(.clk_in (clk_out[1]), .rst(rst), 
				        .clk_out(clk_out[2]), .count(count[2]));
						  
	contador #(.modulo( 6), .largura(4))
				dm_inst(.clk_in (clk_out[2]), .rst(rst), 
						  .clk_out(clk_out[3]), .count(count[3]));
	
	contador #(.modulo(10), .largura(4))
				uh_inst(.clk_in (clk_out[3]), .rst(rst_24h), 
						  .clk_out(clk_out[4]), .count(count[4]));
						  
	contador #(.modulo( 3), .largura(4))
				dh_inst(.clk_in (clk_out[4]), .rst(rst_24h), 
						  .clk_out(clk_out[5]), .count(count[5]));
	
	//Instanciação dos decoders
	generate	//Gera código em tempo de compilação
	genvar i;
	for (i = 0; i < 6; i=i+1) 
	begin: criador_de_decoders	//Precisa colocar um nome no bloco para evitar erro no Quartus
		encapsula_decoder #(.TIPO("AC")) decoder_inst 
		(
			.entra(count[i]),
			.sai(disp[i])
		);
	end
	endgenerate
	
	assign dh = disp[5];
	assign uh[6:0] = disp[4][6:0];
	assign uh[7] = clk_1;	//Ponto entre hora e minuto
	assign dm = disp[3];
	assign um[6:0] = disp[2][6:0];
	assign um[7] = clk_1;	//Ponto entre minuto e segundo
	assign ds = disp[1];
	assign us = disp[0];
	
	//Reset do relógio em 24 horas (ativo em 0)
								  //DH=2				UH=4
	assign rst_24h = rst & !(count[5][1] & count[4][2]);
	
	//Seleção do clock
	always @(*)
	begin
		if(speed == 1)	//Botão solto
			clk_base <= clk_1;			
		else					//Botão pressionado
			clk_base <= clk_c;	
	end

endmodule
