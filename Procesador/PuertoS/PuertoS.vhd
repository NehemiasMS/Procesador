-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    01/06/2020 18:01:41
-- Project Name:   PuertoS
-- Module Name:    PuertoS.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity PuertoS is
   port(Datos : in std_logic_vector(15 downto 0):= x"0000";
		Direccion : in std_logic_vector(8 downto 0):= "000000000";
		IOM, WR, clk: in std_logic;
        Salida : out std_logic_vector(15 downto 0):= x"0000"
        );
end PuertoS;

architecture arq1 of PuertoS is
begin

process( CLK, IOM, WR, Datos, Direccion)
begin 
	if clk'event and IOM ='1' then 
		if Direccion = "000010000" and WR='1' then
			Salida <= Datos;
		end if;
	end if;
end process;
end arq1;
