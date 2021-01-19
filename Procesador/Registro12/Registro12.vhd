-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Marian Meza
-- 
-- Create Date:    14/04/2020 23:58:18
-- Project Name:   IR
-- Module Name:    IR.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro12 is
   port(Load, clk: in STD_LOGIC;
		Entrada: in STD_LOGIC_VECTOR(11 downto 0):= x"000";
		Salida: out STD_LOGIC_VECTOR(11 downto 0):= x"000"		
		);
end Registro12;

architecture arq1 of Registro12 is
begin
	process(Load, clk, Entrada)
	begin
		if clk'event and clk='1' and Load='1' then
			Salida <= Entrada;
		end if;
	end process;
end arq1;
