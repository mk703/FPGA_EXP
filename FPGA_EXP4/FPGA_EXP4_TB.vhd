LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FPGA_EXP4_tb IS
END FPGA_EXP4_tb;

ARCHITECTURE arch OF FPGA_EXP4_tb IS
    COMPONENT FPGA_EXP4 IS
        PORT(
			clk : IN std_logic;
			rfromk : IN std_logic_vector(3 DOWNTO 0);
			wtk : OUT std_logic_vector(3 DOWNTO 0);
			led_com : OUT std_logic;
			seven : OUT std_logic_vector(6 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk :  std_logic;
    SIGNAL row :  std_logic_vector(3 DOWNTO 0);
    SIGNAL column :  std_logic_vector(3 DOWNTO 0);
    SIGNAL led_drive :  std_logic_vector(6 DOWNTO 0);
    SIGNAL led_sel :  std_logic;

BEGIN
    u : FPGA_EXP4 PORT MAP (clk,row,column,led_sel,led_drive);

    clock : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 2 ns;
        clk <= '1';
        WAIT FOR 2 ns;
    END PROCESS ; -- clock

	 row_input : PROCESS
    BEGIN
        row <= "0111";
        WAIT FOR 100 ns;
        row <= "1111";
        WAIT FOR 1000 ns;
        row <= "1011";
        WAIT FOR 100 ns;
        row <= "1111";
        WAIT FOR 1000 ns;
        row <= "1101";
        WAIT FOR 100 ns;
        row <= "1111";
        WAIT FOR 1000 ns;
        row <= "1110";
        WAIT FOR 100 ns;
        row <= "1111";
        WAIT FOR 1000 ns;
    END PROCESS;  -- row_input

END arch ; -- arch