-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    14/04/2020 23:57:56
-- Project Name:   PC
-- Module Name:    PC.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Contador9 is
	port(Load, Inc, clk: in STD_LOGIC;
				Entrada: in STD_LOGIC_VECTOR(8 downto 0);
				 Salida: out STD_LOGIC_VECTOR(8 downto 0)		
			);
end Contador9;

architecture arq1 of Contador9 is
begin
 	process(Load, Inc, clk, Entrada)
		variable cuenta: unsigned(8 downto 0):="000000000";
	begin
				Salida <= std_logic_vector(cuenta);
		if clk'event and clk='1' then
			if Load = '1' then
				cuenta := unsigned(Entrada);
			elsif Inc = '1' then
				cuenta:= cuenta+1;
			end if;
		end if;
	end process;
end arq1;
