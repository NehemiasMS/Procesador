-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    15/04/2020 12:13:19
-- Project Name:   CPU
-- Module Name:    CPU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity CPU_tb is
end    CPU_tb;

architecture Testbench of CPU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component CPU
		port(--LPC, INCPC, LPAR, CLK, LIR, LPBR: in STD_LOGIC
                 CLK : in std_logic;
				 Entrada: in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
				 Salida: out STD_LOGIC_VECTOR(15 downto 0):= x"0000"
				);
   end component;

	signal CLK : std_logic := '0';
	signal Entrada, Salida : std_logic_vector(15 downto 0):= x"0000";
  
 --  signal   LPC, INCPC, LPAR, CLK, LIR, LPBR : std_logic := '0';
--   signal   Entrada : std_logic_vector(11 downto 0):= x"000";
--   signal   Salida : std_logic_vector(8 downto 0):= "000000000";
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: CPU port map (CLK, Entrada, Salida);


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
   wait for 50 ns;
--	Entrada <= x"0C90";	
   wait for 50 ns;
 --- T1
--	LPAR <= '1';
   wait for 50 ns;
 --- T2
--	LPAR <= '0';
--	LPBR <= '1';
--	INCPC <= '1';
   wait for 50 ns;
 --- T3
--   	LPBR <= '0';
--	INCPC <= '0';
--	LIR <= '1';
   wait for 50 ns;
   wait for 10000 ns;
 --- T4
--	LIR <= '0';
--	LPAR <= '1';
--   wait for 20000 ns;
 --- T5
--	LPAR <= '0';
  -- wait for 1000 ns;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
