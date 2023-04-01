LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trans2 IS
PORT(
	clk : IN std_logic;
	rfk : IN std_logic_vector(3 DOWNTO 0);--read from keyboard
	rft : IN std_logic_vector(3 DOWNTO 0);--read from trans 
	outpu : OUT std_logic_vector (3 DOWNTO 0)
);
END trans2;

ARCHITECTURE behave OF trans2 IS
BEGIN
	PROCESS(clk)
	BEGIN
		IF(clk'EVENT AND clk = '1') THEN
			CASE rfk & rft IS
				WHEN "11101110" => outpu <= "0001";--1
				WHEN "11101101" => outpu <= "0010";--2
				WHEN "11101011" => outpu <= "0011";--3
				WHEN "11100111" => outpu <= "1010";--a
				WHEN "11011110" => outpu <= "0100";--4
				WHEN "11011101" => outpu <= "0101";--5
				WHEN "11011011" => outpu <= "0110";--6
				WHEN "11010111" => outpu <= "1011";--b
				WHEN "10111110" => outpu <= "0111";--7
				WHEN "10111101" => outpu <= "1000";--8
				WHEN "10111011" => outpu <= "1001";--9
				WHEN "10110111" => outpu <= "1100";--c
				WHEN "01111110" => outpu <= "1110";--e
				WHEN "01111101" => outpu <= "0000";--0
				WHEN "01111011" => outpu <= "1111";--f
				WHEN "01110111" => outpu <= "1101";--d
				WHEN others => null;
			END CASE;
		END IF;
	END PROCESS;
END behave;