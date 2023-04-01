LIBRARY ieee;
USE ieee.std_logic_1164 .all;
USE ieee.std_logic_signed.all;

ENTITY counter IS
PORT(
	rst_n : IN std_logic;
	clk : IN std_logic;
	op: OUT std_logic_vector(9 DOWNTO 0)
	);
END counter;

ARCHITECTURE behave OF counter IS
	SIGNAL op_w : std_logic_vector(9 DOWNTO 0);
BEGIN
   op<=op_w;
	PROCESS(clk,rst_n)
	BEGIN
		IF(rst_n='0') THEN
			op_w<="0000000000";
		ELSE 
			IF(clk'EVENT AND clk='1') THEN
				IF(op_w="1111111111") THEN
					op_w<="0000000000";
				ELSE 
					op_w<=op_w+"0000000001";
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behave;