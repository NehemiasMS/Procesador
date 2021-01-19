-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 21:36:59
-- Project Name:   Registro16
-- Module Name:    Registro16.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro16 is
	port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
			Salida: out STD_LOGIC_VECTOR(15 downto 0):= x"0000"		
			);
end Registro16;

architecture arq1 of Registro16 is
begin
	process(Load, clk, Entrada)
		begin
			if clk'event and clk='1' and Load='1' then
				Salida <= Entrada;
			end if;
	end process;
end arq1;
