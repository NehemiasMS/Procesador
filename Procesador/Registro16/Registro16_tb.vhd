-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 21:36:59
-- Project Name:   Registro16
-- Module Name:    Registro16_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Registro16_tb is
end    Registro16_tb;

architecture Testbench of Registro16_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Registro16
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(15 downto 0);
			Salida: out STD_LOGIC_VECTOR(15 downto 0)		
		);
   end component;

signal Load, clk: STD_LOGIC:= '0';
signal Entrada, Salida: STD_LOGIC_VECTOR(15 downto 0):= x"0000";

constant clock_period : time := 50 ns;
signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Registro16 port map (Load, clk, Entrada, Salida);

clock_process : process
begin
   while (clock_on) loop
      clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	Load <= '1';
	Entrada <= x"1111";
  
   wait for 100 ns;
	Load <= '0';
	Entrada <= x"1010";
   
   wait for 100 ns;
	Load <= '1';
	Entrada <= x"0000";
   
   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
