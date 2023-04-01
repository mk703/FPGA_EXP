LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY feqdev IS
PORT(
	clk : IN std_logic;
	clk1000 : OUT std_logic
);
END feqdev;

ARCHITECTURE behave OF feqdev IS
	SIGNAL tmp : std_logic;
	SIGNAL cnt : integer range 0 to 2500;
BEGIN
	clk1000 <= tmp;
	PROCESS(clk)
	BEGIN
	   IF(clk'EVENT and clk='1') THEN
		  IF(cnt=2500) THEN
			 cnt<=0;
			 tmp<= NOT tmp;
		  ELSE
			 cnt<=cnt+1;
			END IF;
		END IF;
	END PROCESS;
END behave;