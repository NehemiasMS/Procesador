-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 22:12:17
-- Project Name:   ALU
-- Module Name:    ALU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity ALU is
      port( A, B : in std_logic_vector(15 downto 0);
			R : out std_logic_vector(15 downto 0);
			OPER : std_logic_vector(3 downto 0);
			C : out std_logic_vector(2 downto 0)		   
           );
end ALU;

architecture arq1 of ALU is

signal Z: std_logic_vector(31 downto 0):= x"00000000";
signal Flags : std_logic_vector(2 downto 0):= "000";

begin
R <= Z(15 downto 0);
C <= Flags;

Flags(2) <= NOT( Z(15) OR Z(14) OR Z(13) OR Z(12) OR Z(11) OR Z(10) OR Z(9) 
			OR Z(8) OR Z(7) OR Z(6) OR Z(5) OR Z(4) OR Z(3) OR Z(2) OR Z(1) OR Z(0) );
Flags(1) <= Z(31);
Flags(0) <= Z(16);

with OPER select 
	Z <= std_logic_vector(unsigned(x"0000" & A) + unsigned('0' & B)) when "0001",
		 std_logic_vector(unsigned(x"0000" & A) - unsigned('0' & B)) when "0010",
         std_logic_vector(unsigned(A) * unsigned(B)) when "0011",
	     std_logic_vector(unsigned(x"0000" & A) / unsigned('0' & B)) when "0100",
         (x"0000" & A) AND (x"0000" & B) when "0101",
         (x"0000" & A) OR (x"0000" & B) when "0110",
		 NOT (x"0000" & A) when "0111",
		 (x"0000" & A) XOR (x"0000" & B) when "1000",
		 std_logic_vector(unsigned(x"0000" & A) - unsigned('0' & B)) when "1010",
		 std_logic_vector(unsigned(x"0000" & B)) when "1011",
		 std_logic_vector(unsigned(x"0000" & B)) when "1100",	
		 Z when others;
end arq1;
