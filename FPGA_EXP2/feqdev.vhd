LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY feqdev IS
PORT(
	clk : IN std_logic;
	clk2500 : OUT std_logic
);
END feqdev;

ARCHITECTURE behave OF feqdev IS
SIGNAL tmp : std_logic;
SIGNAL cnt : integer RANGE 0 TO 25000000;
BEGIN
	clk2500 <= tmp;
	PROCESS(clk)
	BEGIN
	   IF(clk'event and clk='1') THEN
		  IF(cnt=25000000) THEN
			 cnt<=0;
			 tmp<= NOT tmp;
		  ELSE
			 cnt<=cnt+1;
			END IF;
		END IF;
	END PROCESS;
END behave;