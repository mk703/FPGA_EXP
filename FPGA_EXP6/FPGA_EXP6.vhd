LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FPGA_EXP6 IS
PORT(
	sel : IN std_logic_vector(2 DOWNTO 0);
	clk : IN std_logic;
	rfk : IN std_logic_vector(3 DOWNTO 0);
	wtk : OUT std_logic_vector(3 DOWNTO 0);
	led_com : OUT std_logic_vector(7 DOWNTO 0);
	led_data : OUT std_logic_vector(6 DOWNTO 0);
	checker_en : IN std_logic;
	checker_en_show : OUT std_logic;
	result : OUT std_logic
);
END FPGA_EXP6;

ARCHITECTURE bahave OF FPGA_EXP6 IS
	COMPONENT feqdev IS
	PORT(
		clk : IN std_logic;
		clk2500 : OUT std_logic
	);
	END COMPONENT;
	COMPONENT counter0to3 IS
	PORT(
		clk : IN std_logic;
		cnt : OUT std_logic_vector(1 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT decod3to8 IS
	PORT(
		clk : IN std_logic;
		three : IN std_logic_vector (2 DOWNTO 0);
		eight : OUT std_logic_vector(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT counter0to7 IS
	PORT(
		clk : IN std_logic;
		cnt : OUT std_logic_vector(2 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT decod4to7 IS
	PORT(
		clk : IN std_logic;
		four : IN std_logic_vector (3 DOWNTO 0);
		seven : OUT std_logic_vector(6 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT trans IS
	PORT(
		inpu : IN std_logic_vector(1 DOWNTO 0); 
		wtk : OUT std_logic_vector(3 DOWNTO 0)--write to keyboard
	);
	END COMPONENT;
	COMPONENT trans2 IS
	PORT(
		clk : IN std_logic;
		rfk : IN std_logic_vector(3 DOWNTO 0);--read from keyboard
		wtk : IN std_logic_vector(3 DOWNTO 0);--write to keyboard 
		outpu : OUT std_logic_vector (3 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT locker IS
	PORT(
		checker_en : IN std_logic;
		sel : IN std_logic_vector(2 DOWNTO 0);
		three : IN std_logic_vector(2 DOWNTO 0);
		dat : IN std_logic_vector(3 DOWNTO 0);
		dat_buf0 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf1 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf2 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf3 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf4 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf5 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf6 : OUT std_logic_vector (3 DOWNTO 0);
		dat_buf7 : OUT std_logic_vector (3 DOWNTO 0);
		dat_out : OUT std_logic_vector(3 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT checker IS
	PORT(
		clk : IN std_logic;
		dat_buf0 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf1 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf2 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf3 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf4 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf5 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf6 : IN std_logic_vector (3 DOWNTO 0);
		dat_buf7 : IN std_logic_vector (3 DOWNTO 0);
		checker_en : IN std_logic;
		checker_en_show : OUT std_logic;
		result : OUT std_logic
	);
	END COMPONENT;
	SIGNAL clk_out : std_logic;
	SIGNAL buffer_counter0to3 : std_logic_vector(1 DOWNTO 0);
	SIGNAL buffer_counter0to7 : std_logic_vector(2 DOWNTO 0);
	SIGNAL tmp,data_read,data_out : std_logic_vector(3 DOWNTO 0);--dataread = data scaned from keyboard
	SIGNAL dat_buf0,dat_buf1,dat_buf2,dat_buf3,dat_buf4,dat_buf5,dat_buf6,dat_buf7 : std_logic_vector(3 DOWNTO 0);
BEGIN
	wtk <= tmp;
	--clk_out <= clk;
	f : feqdev PORT MAP(clk, clk_out);
	c2 : counter0to7 PORT MAP(clk_out, buffer_counter0to7);
	d1 : decod3to8 PORT MAP(clk_out, buffer_counter0to7, led_com);
	c1 : counter0to3 PORT MAP(clk_out, buffer_counter0to3);
	t1 : trans PORT MAP(buffer_counter0to3, tmp);
	t2 : trans2 PORT MAP(clk_out, rfk, tmp, data_read);-- tmp = wtk
	l : locker PORT MAP(checker_en, sel, buffer_counter0to7, data_read, dat_buf0,dat_buf1,dat_buf2,dat_buf3,dat_buf4,dat_buf5,dat_buf6,dat_buf7, data_out);
	c : checker PORT MAP(clk_out, dat_buf0,dat_buf1,dat_buf2,dat_buf3,dat_buf4,dat_buf5,dat_buf6,dat_buf7, checker_en, checker_en_show, result);
	d2 : decod4to7 PORT MAP (clk_out, data_out, led_data);
END bahave;