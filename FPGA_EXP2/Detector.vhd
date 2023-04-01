LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY detector IS             --序列检测器
PORT(
	cl	k: IN std_logic;
	reset: in std_logic;
	datainput: IN std_logic;
	detector_out: OUT std_logic
);
END detector;

ARCHITECTURE detect OF detector IS
	TYPE states IS (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
	SIGNAL Crst, Nxst: states;
BEGIN

	P1:PROCESS(clk,reset)  
	BEGIN
		IF(reset='0') THEN
			Crst <=S0;
		ELSIF(clk'EVENT AND clk='1') THEN
			Crst <=Nxst;
		END IF;
	END PROCESS P1;
	
	P2:PROCESS(Crst,datainput)
	BEGIN
		CASE Crst IS
			WHEN S0=>
				IF(datainput='1') THEN
					Nxst <=S1;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S1=>
				IF(datainput='1') THEN
					Nxst <=S2;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S2=>
				IF(datainput='1') THEN
					Nxst <=S3;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S3=>
				IF(datainput='0') THEN
					Nxst <=S4;
				ELSE
					Nxst <=S3;
				END IF;
			WHEN S4=>
				IF(datainput='1') THEN
					Nxst <=S5;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S5=>
				IF(datainput='0') THEN
					Nxst <=S6;
				ELSE
					Nxst <=S1;
				END IF;
			WHEN S6=>
				IF(datainput='0') THEN
					Nxst <=S7;
				ELSE
					Nxst <=S1;
				END IF;
			WHEN S7=>
				IF(datainput='1') THEN
					Nxst <=S8;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S8=>
				IF(datainput='1') THEN
					Nxst <=S9;
				ELSE
					Nxst <=S0;
				END IF;
			WHEN S9=>
				IF(datainput='1') THEN
					Nxst <=S1;
				ELSE
					Nxst <=S0;
				END IF;
		END CASE;
	END PROCESS P2;
	
	P3:PROCESS(Crst)
	BEGIN
		CASE Crst IS
			WHEN S0 => detector_out<='0';
			WHEN S1 => detector_out<='0';
			WHEN S2 => detector_out<='0';
			WHEN S3 => detector_out<='0';
			WHEN S4 => detector_out<='0';
			WHEN S5 => detector_out<='0';
			WHEN S6 => detector_out<='0';
			WHEN S7 => detector_out<='0';
			WHEN S8 => detector_out<='0';
			WHEN S9 => detector_out<='1';
		END CASE;
	END PROCESS P3;
	
END detect;