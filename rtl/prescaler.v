module prescaler (clk_in, rst, 
						clk_1kHz, clk_100Hz, clk_10Hz, clk_1Hz, clk_c);

	//Declaração de parâmetros
	parameter main_clock   = 50_000_000;
	parameter custom_clock = 60;

	//Declaração de ports
	input clk_in, rst;
	output reg clk_1kHz, clk_100Hz, clk_10Hz, clk_1Hz, clk_c;

	//Declaração de tipos de dados
	
	
	//Funcionamento do circuito
	//Frequência de 1 kHz
	always @(posedge clk_in or negedge rst)
	begin
		//Declaração de tipos de dados locais e pré-inicializados
		reg [31:0] count = 0;
	
		if(rst == 0)
		begin
			count <= 0;
			clk_1kHz <= 0;			
		end
		else if(count == (main_clock/1000/2))
		begin
			count <= 0;
			clk_1kHz <= ~clk_1kHz;
		end
		else
		begin
			count <= count + 1;
		end
	end
	
	//Frequência de 100 Hz
	always @(posedge clk_in or negedge rst)
	begin
		//Declaração de tipos de dados locais e pré-inicializados
		reg [31:0] count = 0;
	
		if(rst == 0)
		begin
			count <= 0;
			clk_100Hz <= 0;			
		end
		else if(count == (main_clock/100/2))
		begin
			count <= 0;
			clk_100Hz <= ~clk_100Hz;
		end
		else
		begin
			count <= count + 1;
		end
	end
	
	//Frequência de 10 Hz
	always @(posedge clk_in or negedge rst)
	begin
		//Declaração de tipos de dados locais e pré-inicializados
		reg [31:0] count = 0;
	
		if(rst == 0)
		begin
			count <= 0;
			clk_10Hz <= 0;			
		end
		else if(count == (main_clock/10/2))
		begin
			count <= 0;
			clk_10Hz <= ~clk_10Hz;
		end
		else
		begin
			count <= count + 1;
		end
	end
	
	//Frequência de 1 Hz
	always @(posedge clk_in or negedge rst)
	begin
		//Declaração de tipos de dados locais e pré-inicializados
		reg [31:0] count = 0;
	
		if(rst == 0)
		begin
			count <= 0;
			clk_1Hz <= 0;			
		end
		else if(count == (main_clock/1/2))
		begin
			count <= 0;
			clk_1Hz <= ~clk_1Hz;
		end
		else
		begin
			count <= count + 1;
		end
	end
	
	//Frequência customizada
	always @(posedge clk_in or negedge rst)
	begin
		//Declaração de tipos de dados locais e pré-inicializados
		reg [31:0] count = 0;
	
		if(rst == 0)
		begin
			count <= 0;
			clk_c <= 0;			
		end
		else if(count == (main_clock/custom_clock/2))
		begin
			count <= 0;
			clk_c <= ~clk_c;
		end
		else
		begin
			count <= count + 1;
		end
	end
	
endmodule
