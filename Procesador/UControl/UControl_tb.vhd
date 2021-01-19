-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 14:23:49
-- Project Name:   UControl
-- Module Name:    UControl_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity UControl_tb is
end    UControl_tb;

architecture Testbench of UControl_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component UControl
      port(IR : in std_logic_vector(11 downto 0);
		   senControl : out std_logic_vector(15 downto 0);
           clk : in std_logic
           );
   end component;

   signal     IR: std_logic_vector(11 downto 0):= x"000";
   signal   senControl: std_logic_vector(15 downto 0):= x"0000";
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: UControl port map (IR, senControl, clk);

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
