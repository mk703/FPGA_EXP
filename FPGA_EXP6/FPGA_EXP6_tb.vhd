library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fpga_EXP6_tb is
end fpga_EXP6_tb;

architecture arch of fpga_EXP6_tb is
    component fpga_EXP6 is
    PORT(
		clk : IN std_logic;
		rfk : IN std_logic_vector(3 DOWNTO 0);
		wtk : OUT std_logic_vector(3 DOWNTO 0);
		led_com : OUT std_logic_vector(7 DOWNTO 0);
		led_data : OUT std_logic_vector(6 DOWNTO 0)
	 );
    end component;
    signal clk :  std_logic;
    signal row :  std_logic_vector(3 downto 0);
    signal column :  std_logic_vector(3 downto 0);
    signal led_drive :  std_logic_vector(6 downto 0);
    signal led_sel :  std_logic_vector(7 DOWNTO 0);

begin
    u : fpga_EXP6 port map (clk,row,column,led_sel,led_drive);

    clock : process
    begin
        clk <= '0';
        wait for 2 ns;
        clk <= '1';
        wait for 2 ns;
    end process ; -- clock

	 row_input : process
    begin
        row <= "0111";
        wait for 100 ns;
        row <= "1111";
        wait for 1000 ns;
        row <= "1011";
        wait for 100 ns;
        row <= "1111";
        wait for 1000 ns;
        row <= "1101";
        wait for 100 ns;
        row <= "1111";
        wait for 1000 ns;
        row <= "1110";
        wait for 100 ns;
        row <= "1111";
        wait for 1000 ns;
    end process;  -- row_input

end arch ; -- arch