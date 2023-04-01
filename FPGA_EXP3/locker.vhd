LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY locker IS
PORT(
	three : IN std_logic_vector(2 DOWNTO 0);
    sel : IN std_logic_vector (2 DOWNTO 0);
    dat : IN std_logic_vector (3 DOWNTO 0);
    lok : IN std_logic;
    dat_out : OUT std_logic_vector(3 DOWNTO 0)
);
END locker;

ARCHITECTURE behave OF locker IS
SIGNAL dat_buf0, dat_buf1, dat_buf2, dat_buf3, dat_buf4, dat_buf5, dat_buf6, dat_buf7 : std_logic_vector (3 DOWNTO 0);
BEGIN
    PROCESS(sel, dat, lok)
    BEGIN
        IF lok = '1' THEN
            CASE (sel) IS
                WHEN "000" => dat_buf0 <= dat;
                WHEN "001" => dat_buf1 <= dat;
                WHEN "010" => dat_buf2 <= dat;
                WHEN "011" => dat_buf3 <= dat;
                WHEN "100" => dat_buf4 <= dat;
                WHEN "101" => dat_buf5 <= dat;
                WHEN "110" => dat_buf6 <= dat;
                WHEN "111" => dat_buf7 <= dat;
					 WHEN others => NULL;
            END CASE;
        END IF;
    END PROCESS;
	 PROCESS(three)
	 BEGIN
		CASE (three) IS
          WHEN "000" => dat_out <= dat_buf0;
          WHEN "001" => dat_out <= dat_buf1;
          WHEN "010" => dat_out <= dat_buf2;
          WHEN "011" => dat_out <= dat_buf3;
          WHEN "100" => dat_out <= dat_buf4;
          WHEN "101" => dat_out <= dat_buf5;
          WHEN "110" => dat_out <= dat_buf6;
          WHEN "111" => dat_out <= dat_buf7;
			 WHEN others => NULL;
		END CASE;
	 END PROCESS;
END behave;