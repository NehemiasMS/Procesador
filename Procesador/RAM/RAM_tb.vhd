-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 12:06:03
-- Project Name:   RAM
-- Module Name:    RAM_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity RAM_tb is
end    RAM_tb;

architecture Testbench of RAM_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component RAM
		port(Direccion : in std_logic_vector(8 downto 0);
--			Palabra: inout std_logic_vector(15 downto 0);
			DatosE : in std_logic_vector(15 downto 0):= x"0000";
			DatosS : out std_logic_vector(15 downto 0):= x"0000";
			RW, IOM: in std_logic);
   end component;

signal Direccion : std_logic_vector(8 downto 0):= "000000000";
signal DatosE, DatosS : std_logic_vector(15 downto 0):= x"0000";
signal RW, IOM: std_logic:= '0';

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RAM port map (Direccion, DatosE, DatosS, RW, IOM);

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
--clock_process : process
--begin
--   while (clock_on) loop
--      <clock> <= '0';
--      wait for clock_period/2;
--      <clock> <= '1';
--      wait for clock_period/2;
--   end loop;
--   --assert (false) report ("Finished") severity error;
--   -- Wait forever
--   wait;
-- end process;

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
