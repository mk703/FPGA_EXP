LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FPGA_EXP3_tb IS
END FPGA_EXP3_tb;

ARCHITECTURE arch OF FPGA_EXP3_tb IS
    COMPONENT FPGA_EXP3 IS
    PORT(
			sel : IN std_logic_vector(2 DOWNTO 0);
			data : IN std_logic_vector(3 DOWNTO 0);
			lock_en : IN std_logic;
			clk : IN std_logic;
			led_com : OUT std_logic_vector(7 DOWNTO 0);
			led_data : OUT std_logic_vector(6 DOWNTO 0)
	);
    END COMPONENT;
    SIGNAL clk,lok :  std_logic;
    SIGNAL selec :  std_logic_vector(2 DOWNTO 0);
    SIGNAL dat :  std_logic_vector(3 DOWNTO 0);
    SIGNAL led_drive :  std_logic_vector(6 DOWNTO 0);
    SIGNAL led_com :  std_logic_vector(7 DOWNTO 0);

BEGIN
    u : FPGA_EXP3 PORT MAP (selec,dat,lok,clk,led_com , led_drive);
	lok <= '1';
    clock : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 2 ns;
        clk <= '1';
        WAIT FOR 2 ns;
    END PROCESS ; -- clock

	sel_input : PROCESS
    BEGIN
        selec <= "000";
        WAIT FOR 100 ns;
        selec <= "001";
        WAIT FOR 100 ns;
        selec <= "010";
        WAIT FOR 100 ns;
        selec <= "011";
        WAIT FOR 100 ns;
        selec <= "100";
        WAIT FOR 100 ns;
        selec <= "101";
        WAIT FOR 100 ns;
        selec <= "110";
        WAIT FOR 100 ns;
        selec <= "111";
        WAIT FOR 100 ns;
    END PROCESS;  -- sel_input
	 
	data_input : PROCESS
    BEGIN
        dat <= "0000";
        WAIT FOR 10 ns;
        dat <= "0001";
        WAIT FOR 10 ns;
        dat <= "0010";
        WAIT FOR 10 ns;
        dat <= "0011";
        WAIT FOR 10 ns;
        dat <= "0100";
        WAIT FOR 10 ns;
        dat <= "0101";
        WAIT FOR 10 ns;
        dat <= "0110";
        WAIT FOR 10 ns;
        dat <= "0111";
        WAIT FOR 10 ns;
		  dat <= "1000";
        WAIT FOR 10 ns;
        dat <= "1001";
        WAIT FOR 10 ns;
        dat <= "1010";
        WAIT FOR 10 ns;
        dat <= "1011";
        WAIT FOR 10 ns;
        dat <= "1100";
        WAIT FOR 10 ns;
        dat <= "1101";
        WAIT FOR 10 ns;
        dat <= "1110";
        WAIT FOR 10 ns;
        dat <= "1111";
        WAIT FOR 10 ns;
    END PROCESS;  -- data_input

END arch ; -- arch