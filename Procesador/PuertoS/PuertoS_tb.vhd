-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 18:01:41
-- Project Name:   PuertoS
-- Module Name:    PuertoS_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity PuertoS_tb is
end    PuertoS_tb;

architecture Testbench of PuertoS_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component PuertoS
	port(Datos : in std_logic_vector(15 downto 0);
		 Direccion : in std_logic_vector(8 downto 0);
		 IOM, WR, clk: in std_logic;
         Salida : out std_logic_vector(15 downto 0)
        );
   end component;

   signal  Datos, Salida: std_logic_vector(15 downto 0):= x"0000";
   signal  Direccion : std_logic_vector(8 downto 0):= "000000000";
   signal   IOM, WR, clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: PuertoS port map (Datos, Direccion, IOM, WR, clk, Salida);

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
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
