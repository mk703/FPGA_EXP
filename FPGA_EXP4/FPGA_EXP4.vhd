LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FPGA_EXP4 IS
PORT(
	clk : IN std_logic;
	rfromk : IN std_logic_vector(3 DOWNTO 0);
	wtk : OUT std_logic_vector(3 DOWNTO 0);
	led_com : OUT std_logic;
	seven : OUT std_logic_vector(6 DOWNTO 0)
);
END FPGA_EXP4;

ARCHITECTURE behave OF FPGA_EXP4 IS
	COMPONENT feqdev IS
	PORT(
		clk : IN std_logic;
		clk1000 : OUT std_logic
	);
	END COMPONENT;
	COMPONENT counter is
	PORT(
		clk : IN std_logic;
		cnt : OUT std_logic_vector(1 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT trans is
	PORT(
		inpu : IN std_logic_vector(1 DOWNTO 0); 
		scan : OUT std_logic_vector(3 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT trans2 is
	PORT(
		clk : IN std_logic;
		rfk : IN std_logic_vector(3 DOWNTO 0);--read from keyboard
		rft : IN std_logic_vector(3 DOWNTO 0);--read from trans 
		outpu : OUT std_logic_vector (3 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT decod4to7 is
	PORT(
		clk : IN std_logic;
		four : IN std_logic_vector (3 DOWNTO 0);
		seven : OUT std_logic_vector(6 DOWNTO 0)
	);
	END COMPONENT;
	SIGNAL data_count : std_logic_vector(1 DOWNTO 0);
	SIGNAL data_out, tmp : std_logic_vector(3 DOWNTO 0);
	SIGNAL clk_out : std_logic;
BEGIN
	led_com <= '1';
	wtk <= tmp;
	clk_out <= clk;
	--f: feqdev PORT MAP(clk, clk_out);
	t1: trans PORT MAP(data_count, tmp);
	t2: trans2 PORT MAP(clk_out, rfromk, tmp, data_out);
	d: decod4to7 PORT MAP(clk_out, data_out, seven);
	c : counter PORT MAP(clk_out, data_count);
END behave;