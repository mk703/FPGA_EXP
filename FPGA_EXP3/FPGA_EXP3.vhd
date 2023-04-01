LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FPGA_EXP3 IS
PORT(
	sel : IN std_logic_vector(2 DOWNTO 0);
	data : IN std_logic_vector(3 DOWNTO 0);
	lock_en : IN std_logic;
	clk : IN std_logic;
	led_com : OUT std_logic_vector(7 DOWNTO 0);
	led_data : OUT std_logic_vector(6 DOWNTO 0)
);
END FPGA_EXP3;

ARCHITECTURE bahave OF FPGA_EXP3 IS
	COMPONENT feqdev IS
	PORT(
		clk : IN std_logic;
		clk1000 : OUT std_logic
	);
	END COMPONENT;
	COMPONENT decod4to7 IS
	PORT(
		clk : IN std_logic;
		four : IN std_logic_vector (3 DOWNTO 0);
		seven : OUT std_logic_vector(6 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT decod3to8 IS
	PORT(
		clk : IN std_logic;
		three : IN std_logic_vector (2 DOWNTO 0);
		eight : OUT std_logic_vector(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT counter IS
	PORT(
		clk : IN std_logic;
		cnt : OUT std_logic_vector(2 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT locker IS
	PORT(
		three : IN std_logic_vector(2 DOWNTO 0);
		sel : IN std_logic_vector (2 DOWNTO 0);
		dat : IN std_logic_vector (3 DOWNTO 0);
		lok : IN std_logic;
		dat_out : OUT std_logic_vector(3 DOWNTO 0)
	);
	END COMPONENT;
	SIGNAL clk_out : std_logic; 
	SIGNAL three_bits : std_logic_vector(2 DOWNTO 0);
	SIGNAL four_bits : std_logic_vector(3 DOWNTO 0);
	SIGNAL cnt : integer range 0 to 7;
BEGIN
	--clk_out <= clk;
	f : feqdev PORT MAP(clk, clk_out);
	c : counter PORT MAP(clk_out, three_bits);
	d1 : decod3to8 PORT MAP(clk_out, three_bits, led_com);
	l : locker PORT MAP(three_bits, sel, data, lock_en, four_bits);
	d2 : decod4to7 PORT MAP(clk_out, four_bits, led_data);
END bahave;