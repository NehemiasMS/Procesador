-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    03/06/2020 12:27:14
-- Project Name:   Bufffer
-- Module Name:    Bufffer_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Bufffer_tb is
end    Bufffer_tb;

architecture Testbench of Bufffer_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Bufffer
	port(Entrada : in std_logic_vector(15 downto 0);
		 Salida : out std_logic_vector(15 downto 0);
		 SenControl : in std_logic
		);
   end component;

signal Entrada, Salida : std_logic_vector(15 downto 0):= x"0000";
signal SenControl : std_logic := '0';
 
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Bufffer port map (Entrada, Salida, SenControl);

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
--   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;