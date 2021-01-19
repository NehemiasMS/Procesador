-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 18:01:50
-- Project Name:   PuertoE
-- Module Name:    PuertoE.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity PuertoE is
	port(Datos : out std_logic_vector(15 downto 0):= x"0000";
		 Direccion : in std_logic_vector(8 downto 0):= "000000000";
		 IOM, WR, clk: in std_logic;
         Entrada : in std_logic_vector(15 downto 0):= x"0000"
        );
end PuertoE;

architecture arq1 of PuertoE is
begin

process( CLK, IOM, WR, Entrada, Direccion)
begin 
	if clk'event and IOM ='1' then 
		if Direccion = "000000000" and WR='0' then
			Datos <= Entrada;
		elsif Direccion /= "000010000" or WR='1' then
			Datos <= "ZZZZZZZZZZZZZZZZ";
		end if;
--	else
--		Datos <= "ZZZZZZZZZZZZZZZZ";
	end if;
end process;
end arq1;
