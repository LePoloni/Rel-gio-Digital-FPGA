module contador (clk_in, rst, clk_out, count);

	//Declaração de parâmetros
	parameter modulo   = 10;
	parameter largura  = 4;

	//Declaração de ports
	input clk_in, rst;
	output reg clk_out;
	output reg [largura-1:0] count;

	//Declaração de tipos de dados
	
	
	//Funcionamento do circuito
	always @(posedge clk_in or negedge rst)
	begin
		if(rst == 0)
		begin
			count <= 0;
			clk_out <= 0;			
		end
		else if(count == (modulo-1))
		begin
			count <= 0;
			clk_out <= 1;
		end
		else
		begin
			count <= count + 1;
			clk_out <= 0;	
		end
	end
	
endmodule
