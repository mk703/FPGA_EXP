LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY checker IS
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
END checker;

ARCHITECTURE behave OF checker IS
SIGNAL dat_sav0 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav1 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav2 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav3 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav4 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav5 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav6 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav7 : std_logic_vector (3 DOWNTO 0);
BEGIN
	dat_sav0 <= "0001";
	dat_sav1 <= "0010";
	dat_sav2 <= "0010";
	dat_sav3 <= "0010";
	dat_sav4 <= "0010";
	dat_sav5 <= "0010";
	dat_sav6 <= "0010";
	dat_sav7 <= "0010";
	checker_en_show <= checker_en;
	PROCESS (clk)
	BEGIN
		IF(clk'EVENT AND clk = '1') THEN
			IF(( (dat_buf0 & dat_buf1 & dat_buf2 & dat_buf3 & dat_buf4 & dat_buf5 & dat_buf6 & dat_buf7)
				= (dat_sav0 & dat_sav1 & dat_sav2 & dat_sav3 & dat_sav4 & dat_sav5 & dat_sav6 & dat_sav7)) AND
				(checker_en = '1') )THEN
				result <= '1';
			ELSE
				result <= '0';
			END IF;
		END IF;
	END PROCESS;
END behave;