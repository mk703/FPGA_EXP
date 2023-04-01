LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FPGA_EXP2_tb IS 
END FPGA_EXP2_tb;

ARCHITECTURE arch_tb OF FPGA_EXP2_tb IS
	COMPONENT FPGA_EXP2 IS
	PORT(
		clk: integer std_logic;
		reset: IN std_logic;
		sel: IN std_logic;
		detector_out: OUT std_logic
	);
	END COMPONENT;
	SIGNAL clk: std_logic:='0';
	SIGNAL reset: std_logic:='1';
	SIGNAL sel: std_logic:='0';
	SIGNAL detector_out: std_logic;
BEGIN
	ins: FPGA_EXP2 PORT MAP(clk,reset,sel,detector_out);
	PROCESS
	BEGIN
		WAIT FOR 10ns;
		clk <='1';
		WAIT FOR 10ns;
		clk <='0';
	END PROCESS;
	PROCESS
	BEGIN
		reset <='0';
		sel<='1';
		WAIT FOR 10ns;
		reset <='1';
		WAIT FOR 1000ns;
		
		reset <='0';
		sel<='0';
		WAIT FOR 10ns;
		reset <='1';
		WAIT FOR 1000ns;
	END PROCESS;
END arch_tb;