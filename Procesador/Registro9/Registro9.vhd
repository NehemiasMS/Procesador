-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    14/04/2020 23:58:06
-- Project Name:   PAR
-- Module Name:    PAR.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro9 is
   port(Load, clk: in STD_LOGIC;
		Entrada: in STD_LOGIC_VECTOR(8 downto 0):= "000000000";
		Salida: out STD_LOGIC_VECTOR(8 downto 0):= "000000000"		
		);
end Registro9;

architecture arq1 of Registro9 is
begin
	process(Load, clk, Entrada)
	begin
		if clk'event and clk='1' and Load='1' then
			Salida <= Entrada;
		end if;
	end process;
end arq1;
