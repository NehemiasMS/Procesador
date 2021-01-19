-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Marian Meza
-- 
-- Create Date:    17/04/2020 11:07:33
-- Project Name:   ROM_programa
-- Module Name:    ROM_programa_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ROM_programa_tb is
end    ROM_programa_tb;

architecture Testbench of ROM_programa_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component ROM_programa
		port(A: in std_logic_vector(8 downto 0);
				D: out std_logic_vector(11 downto 0)
				);
   end component;

 signal A: std_logic_vector(8 downto 0):= "000000000";
 signal D: std_logic_vector(11 downto 0):= x"000";


begin

   -- Instantiate the Unit Under Test (UUT)
   uut: ROM_programa port map (A, D);

stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	A <= "000000001";
   wait for 100 ns;
  	A <= "000000010";
   wait for 100 ns;
 
   wait;

end process;

end Testbench;