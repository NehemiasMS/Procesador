-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: maria
-- 
-- Create Date:    03/06/2020 12:27:14
-- Project Name:   Bufffer
-- Module Name:    Bufffer.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Bufffer is
   port(Entrada : in std_logic_vector(15 downto 0);
		Salida : out std_logic_vector(15 downto 0);
		SenControl : in std_logic
       );
end Bufffer;

architecture arq1 of Bufffer is
begin

with SenControl select
	Salida <= Entrada when '1',
			  "ZZZZZZZZZZZZZZZZ" when others;

end arq1;

