LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FPGA_EXP5 IS
PORT(
	rst_n : IN std_logic;
	clk : IN std_logic;
	output : OUT std_logic_vector(7 DOWNTO 0)
	);
END FPGA_EXP5;

architecture arch OF FPGA_EXP5 IS
	SIGNAL wire_1 : std_logic_vector(9 DOWNTO 0);
	SIGNAL wire_2 : std_logic_vector(7 DOWNTO 0);
COMPONENT mystorage
PORT
	(
		address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter
PORT(
	rst_n : IN std_logic;
	clk : IN std_logic;
	op: OUT std_logic_vector(9 DOWNTO 0)
	);
END COMPONENT;

BEGIN
   	output<=wire_2;
	a0: counter PORT MAP(rst_n,clk,wire_1);
	a1: mystorage PORT MAP(wire_1,clk,wire_2);
	
END arch;
