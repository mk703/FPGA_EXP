LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter0to7 IS
PORT(
	clk : IN std_logic;
	cnt : OUT std_logic_vector(2 DOWNTO 0)
);
END counter0to7;

ARCHITECTURE behave OF counter0to7 IS
SIGNAL tmp : std_logic_vector(2 DOWNTO 0) := "000";
BEGIN
	cnt <= tmp;
	PROCESS(clk)
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF(tmp = "111") THEN
				tmp <= "000";
			ELSE tmp <= tmp + '1';
			END IF;
		END IF;
	END PROCESS;
END behave;