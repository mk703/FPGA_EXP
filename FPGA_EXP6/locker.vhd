LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY locker IS
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
END locker;

ARCHITECTURE behave OF locker IS
SIGNAL dat_sav0 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav1 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav2 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav3 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav4 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav5 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav6 : std_logic_vector (3 DOWNTO 0);
SIGNAL dat_sav7 : std_logic_vector (3 DOWNTO 0);
BEGIN
	dat_buf0 <= dat_sav0;
	dat_buf1 <= dat_sav1;
	dat_buf2 <= dat_sav2;
	dat_buf3 <= dat_sav3;
	dat_buf4 <= dat_sav4;
	dat_buf5 <= dat_sav5;
	dat_buf6 <= dat_sav6;
	dat_buf7 <= dat_sav7;
	PROCESS(sel, dat, checker_en)
   BEGIN
		IF(checker_en = '0') THEN
			CASE (sel) IS
				WHEN "000" => dat_sav0 <= dat;
				WHEN "001" => dat_sav1 <= dat;
				WHEN "010" => dat_sav2 <= dat;
				WHEN "011" => dat_sav3 <= dat;
				WHEN "100" => dat_sav4 <= dat;
				WHEN "101" => dat_sav5 <= dat;
				WHEN "110" => dat_sav6 <= dat;
				WHEN "111" => dat_sav7 <= dat;
				WHEN others => NULL;
			END CASE;
		END IF;
   END PROCESS;
	PROCESS(three)
	BEGIN
		CASE (three) IS
         WHEN "000" => dat_out <= dat_sav0;
         WHEN "001" => dat_out <= dat_sav1;
         WHEN "010" => dat_out <= dat_sav2;
         WHEN "011" => dat_out <= dat_sav3;
         WHEN "100" => dat_out <= dat_sav4;
         WHEN "101" => dat_out <= dat_sav5;
         WHEN "110" => dat_out <= dat_sav6;
         WHEN "111" => dat_out <= dat_sav7;
			WHEN others => NULL;
		END CASE;
	END PROCESS;
END behave;