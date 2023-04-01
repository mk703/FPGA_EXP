LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY feqdev IS
PORT(
	clk : IN std_logic;
	clk1000 : OUT std_logic
);
END feqdev;

ARCHITECTURE behave OF feqdev IS
SIGNAL tmp : std_logic;
SIGNAL cnt : integer range 0 to 250000;
BEGIN
	clk1000 <= tmp;
	PROCESS(clk)
	BEGIN
	   if(clk'event and clk='1') then
		  if(cnt=250000) then
			 cnt<=0;
			 tmp<= NOT tmp;
		  else
			 cnt<=cnt+1;
			end if;
		END IF;
	END PROCESS;
END behave;