-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 21:43:28
-- Project Name:   Multiplexor
-- Module Name:    Multiplexor_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Multiplexor_tb is
end    Multiplexor_tb;

architecture Testbench of Multiplexor_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Multiplexor
 	port( Entrada1, Entrada2, Entrada3, Entrada4 : in std_logic_vector (15 downto 0);
		 Salida : out std_logic_vector (15 downto 0);
		 Selector : in std_logic_vector (1 downto 0)
		);
   end component;

   signal Entrada1, Entrada2, Entrada3, Entrada4, Salida : std_logic_vector (15 downto 0):= x"0000";
   signal Selector : std_logic_vector (1 downto 0):= "00";

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor port map (Entrada1, Entrada2, Entrada3, Entrada4, Salida, Selector);

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	Selector <= "11";
	Entrada1 <= x"0000";
	Entrada2 <= x"1000";
	Entrada3 <= x"0100";
	Entrada4 <= x"0010";
   
   wait for 100 ns;
   

   wait for 100 ns;
   

   wait;

end process;

end Testbench;