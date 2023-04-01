LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FPGA_EXP2 IS                       --椤跺眰妯″潡
	PORT(
		clk: IN std_logic;
		reset: IN std_logic;
		sel: IN std_logic;
		detector_out: OUT std_logic;
		generator_out : OUT std_logic
	);
END FPGA_EXP2;

ARCHITECTURE FPGA_EXP22 OF FPGA_EXP2 IS
	COMPONENT feqdev IS
	PORT(
		clk : IN std_logic;
		clk2500 : OUT std_logic
	);
	END COMPONENT;
	COMPONENT detector IS             --妫€娴嬪櫒
	PORT(
		clk: IN std_logic;
		reset: IN std_logic;
		datainput: IN std_logic;
		detector_out: OUT std_logic
	);
	END COMPONENT;
	
	COMPONENT generator IS           --浜х敓鍣
	PORT(
		clk: IN std_logic;
		reset: IN std_logic;	
		sel: IN std_logic;
		dataout: OUT std_logic
	);
	END COMPONENT;
	
	SIGNAL clk_out, data_out: std_logic;
	
BEGIN
	--clk_out <= clk;
	generator_out <= data_out;
	f: feqdev PORT MAP(clk, clk_out);
	d: detector PORT MAP(clk_out,reset,data_out,detector_out);
	g: generator PORT MAP(clk_out,reset,sel,data_out);
END FPGA_EXP22;