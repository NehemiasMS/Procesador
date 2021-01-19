-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    14/04/2020 23:57:56
-- Project Name:   PC
-- Module Name:    PC_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Contador9_tb is
end    Contador9_tb;

architecture Testbench of Contador9_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Contador9
		port(Load, Inc, clk: in STD_LOGIC;
					Entrada: in STD_LOGIC_VECTOR(8 downto 0);
					Salida: out STD_LOGIC_VECTOR(8 downto 0)		
			);
   end component;

 
   signal Load, Inc, clk : std_logic := '0';
   signal Entrada, Salida: std_logic_vector(8 downto 0):= "000000000"; 

   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Contador9 port map (Load, Inc, clk, Entrada, Salida);

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
	Inc <= '1';
   
   wait for 300 ns;
   Inc <= '0';
   Load <= '1';
   Entrada <= "010101010";

   wait for 100 ns;
  

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
