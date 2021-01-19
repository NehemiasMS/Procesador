-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    20/04/2020 21:43:28
-- Project Name:   Multiplexor
-- Module Name:    Multiplexor.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Multiplexor is
   port( Entrada1, Entrada2, Entrada3, Entrada4 : in std_logic_vector (15 downto 0);
		 Salida : out std_logic_vector (15 downto 0);
		 Selector : in std_logic_vector (1 downto 0)
		);
end Multiplexor;

architecture arq1 of Multiplexor is
begin

with Selector select 
	Salida <= Entrada1 when "00",
			  Entrada2 when "01",
              Entrada3 when "10",
              Entrada4 when others;

end arq1;
