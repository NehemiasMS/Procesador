-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 22:12:17
-- Project Name:   ALU
-- Module Name:    ALU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ALU_tb is
end    ALU_tb;

architecture Testbench of ALU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component ALU
      port( A, B : in std_logic_vector(15 downto 0);
			R : out std_logic_vector(15 downto 0);
			OPER : in std_logic_vector(3 downto 0);
			C : out std_logic_vector(2 downto 0)		   
           );
   end component;

 signal A, B: std_logic_vector(15 downto 0):= x"0000";
 signal R : std_logic_vector(15 downto 0):= x"0000";
 signal OPER : std_logic_vector(3 downto 0):= "0000";
 signal C : std_logic_vector(2 downto 0):= "000";

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: ALU port map (A, B, R, OPER, C);


-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;


   wait for 100 ns;
	
   
   wait for 100 ns;
	
 
   wait;

end process;

end Testbench;
