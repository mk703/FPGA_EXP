LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trans IS
PORT(
	inpu : IN std_logic_vector(1 DOWNTO 0); 
	wtk : OUT std_logic_vector(3 DOWNTO 0)--write to keyboard
);
END trans;

ARCHITECTURE behave OF trans IS
BEGIN
	wtk <=  	"0111" WHEN inpu = "00" ELSE
				"1011" WHEN inpu = "01" ELSE
				"1101" WHEN inpu = "10" ELSE
				"1110" WHEN inpu = "11" ELSE
				"1111";
END behave;
