-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 11:58:21
-- Project Name:   Registro3
-- Module Name:    Registro3.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro3 is
   port(Load, clk: in STD_LOGIC;
		Entrada: in STD_LOGIC_VECTOR(2 downto 0):= "000";
		Salida: out STD_LOGIC_VECTOR(2 downto 0):= "000"		
		);
end Registro3;

architecture arq1 of Registro3 is
begin
	process(Load, clk, Entrada)
	begin
		if clk'event and clk='1' and Load='1' then
			Salida <= Entrada;
		end if;
	end process;
end arq1;
