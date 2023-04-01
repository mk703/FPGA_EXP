LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FPGA_exp5_tb IS
END FPGA_exp5_tb;

ARCHITECTURE behave OF FPGA_EXP5_tb IS

	COMPONENT FPGA_EXP5
	PORT(
		rst_n : IN std_logic;
		clk : IN std_logic;
		output : OUT std_logic_vector(7 DOWNTO 0)
	);
	END COMPONENT;
	
	SIGNAL rst_n_tb : std_logic;
	SIGNAL clk_tb: std_logic;
	SIGNAL output_tb : std_logic_vector(7 DOWNTO 0);
   	CONSTANT clk_tb_period	:time :=10 ns;
BEGIN
	f0: FPGA_EXP5  PORT MAP(rst_n_tb,clk_tb,output_tb);

	clk_gen:PROCESS
		  BEGIN
				clk_tb<='1';
				WAIT FOR clk_tb_period;
				clk_tb<='0';
				WAIT FOR clk_tb_period;
		 END PROCESS clk_gen;
	
	d2:PROCESS
	BEGIN
		rst_n_tb<='0';
		WAIT FOR 10 ns;
		
		rst_n_tb<='1';
		WAIT FOR 10 us;
		
		rst_n_tb<='0';
		WAIT FOR 1 us;
		
		rst_n_tb<='1';
		WAIT FOR 50 us;
	END PROCESS d2;
END behave;