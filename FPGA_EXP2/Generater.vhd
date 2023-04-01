LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY generator IS  --序列产生器
PORT(
	clk: IN std_logic;
	reset: IN std_logic;	
	sel: IN std_logic;    --选择器
	dataout: OUT std_logic
);
END generator;

ARCHITECTURE gene OF generator IS
	TYPE states IS (S0,S1,S2,S3,S4,S5,S6,S7,S8);
	SIGNAL Crst,Nxst: states;
BEGIN

	P1:PROCESS(clk,reset)
	BEGIN
		IF(reset='0') THEN
			Crst <=S0;          --当前状态
		ELSIF(clk'EVENT AND clk='1') THEN
			Crst <=Nxst;        --下一状态
		END IF;
	END PROCESS P1;
	
	P2:PROCESS(Crst,sel)         --选择器选1时序列为111010011
	BEGIN                        --选择器选0时序列为000101100
		CASE Crst IS
			WHEN S0=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S1;
			WHEN S1=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S2;
			WHEN S2=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S3;
			WHEN S3=>
				IF(sel='1') THEN
					dataout<='0';    --选择器选1时序列为0
				ELSE
					dataout<='1';
				END IF;
				Nxst <=S4;
			WHEN S4=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S5;
			WHEN S5=>
				IF(sel='1') THEN
					dataout<='0';    --选择器选1时序列为0
				ELSE
					dataout<='1';
				END IF;
				Nxst <=S6;
			WHEN S6=>
				IF(sel='1') THEN
					dataout<='0';    --选择器选1时序列为0
				ELSE
					dataout<='1';
				END IF;
				Nxst <=S7;
			WHEN S7=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S8;
			WHEN S8=>
				IF(sel='1') THEN
					dataout<='1';    --选择器选1时序列为1
				ELSE
					dataout<='0';
				END IF;
				Nxst <=S0;
		END CASE;
	END PROCESS P2;
END gene;