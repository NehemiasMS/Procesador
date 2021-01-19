-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 11:58:21
-- Project Name:   Registro3
-- Module Name:    Registro3_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Registro3_tb is
end    Registro3_tb;

architecture Testbench of Registro3_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Registro3
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(2 downto 0);
			Salida: out STD_LOGIC_VECTOR(2 downto 0)		
		);
   end component;

signal Load, clk: STD_LOGIC:= '0';
signal Entrada, Salida: STD_LOGIC_VECTOR(2 downto 0):= "000";

constant clock_period : time := 50 ns;
signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Registro3 port map (Load, clk, Entrada, Salida );

-- Clock process (uncomment if needed)
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
