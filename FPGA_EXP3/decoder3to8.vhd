LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decod3to8 IS
PORT(
	clk : IN std_logic;
	three : IN std_logic_vector (2 DOWNTO 0);
	eight : OUT std_logic_vector(7 DOWNTO 0)
);
END decod3to8;

ARCHITECTURE behave OF decod3to8 IS
BEGIN
	PROCESS(clk)
	BEGIN
		CASE three IS
			WHEN "000" => eight <= "10000000";--0
			WHEN "001" => eight <= "01000000";--1
			WHEN "010" => eight <= "00100000";--2
			WHEN "011" => eight <= "00010000";--3
			WHEN "100" => eight <= "00001000";--4
			WHEN "101" => eight <= "00000100";--5
			WHEN "110" => eight <= "00000010";--6
			WHEN "111" => eight <= "00000001";--6
			WHEN others => null;
		END CASE;
	END PROCESS;
END behave;