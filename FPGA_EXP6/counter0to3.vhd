LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter0to3 IS
PORT(
	clk : IN std_logic;
	cnt : OUT std_logic_vector(1 DOWNTO 0)
);
END counter0to3;

ARCHITECTURE behave OF counter0to3 IS
SIGNAL tmp : std_logic_vector(1 DOWNTO 0) := "00";
BEGIN
	cnt <= tmp;
	PROCESS(clk)
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF(tmp = "11") THEN
				tmp <= "00";
			ELSE tmp <= tmp + '1';
			END IF;
		END IF;
	END PROCESS;
END behave;
