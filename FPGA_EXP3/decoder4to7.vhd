LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decod4to7 IS
PORT(
	clk : IN std_logic;
	four : IN std_logic_vector (3 DOWNTO 0);
	seven : OUT std_logic_vector(6 DOWNTO 0)
);
END decod4to7;

ARCHITECTURE behave OF decod4to7 IS
BEGIN
	PROCESS(clk)
	BEGIN
		CASE four IS
			WHEN "0001" => seven <= "1001111";--1
			WHEN "0010" => seven <= "0010010";--2
			WHEN "0011" => seven <= "0000110";--3
			WHEN "0100" => seven <= "1001100";--4
			WHEN "0101" => seven <= "0100100";--5
			WHEN "0110" => seven <= "0100000";--6
			WHEN "0111" => seven <= "0001111";--7
			WHEN "1000" => seven <= "0000000";--8
			WHEN "1001" => seven <= "0000100";--9
			WHEN "1010" => seven <= "0000010";--a
			WHEN "1011" => seven <= "1100000";--b
			WHEN "1100" => seven <= "0110001";--c
			WHEN "1101" => seven <= "1000010";--d
			WHEN "1110" => seven <= "0110000";--e
			WHEN "1111" => seven <= "0111000";--f
			WHEN "0000" => seven <= "0000001";--0
			WHEN others => null;
		END CASE;
	END PROCESS;
END behave;