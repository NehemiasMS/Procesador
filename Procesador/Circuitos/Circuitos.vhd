-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Adm
-- 
-- Create Date:    17/04/2020 12:02:21
-- Project Name:   Circuitos
-- Module Name:    Circuitos.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

package Circuitos is

	component Contador9
		port(Load, Inc, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(8 downto 0);
			Salida: out STD_LOGIC_VECTOR(8 downto 0)		
			);
   	end component;

	component Registro3
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(2 downto 0);
			Salida: out STD_LOGIC_VECTOR(2 downto 0)		
		);
   	end component;

	component Registro9
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(8 downto 0);
			Salida: out STD_LOGIC_VECTOR(8 downto 0)		
			);
   	end component;

 	component Registro12
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(11 downto 0);
			Salida: out STD_LOGIC_VECTOR(11 downto 0)		
			);
   	end component;

	component Registro16
		port(Load, clk: in STD_LOGIC;
			Entrada: in STD_LOGIC_VECTOR(15 downto 0);
			Salida: out STD_LOGIC_VECTOR(15 downto 0)		
		);
   	end component;

	component ROM_programa
		port(A: in std_logic_vector(8 downto 0);
			D: out std_logic_vector(11 downto 0)
			);
  	end component;

	component RAM
		port(Direccion : in std_logic_vector(8 downto 0);
--			Palabra: inout std_logic_vector(15 downto 0);
			DatosE : in std_logic_vector(15 downto 0):= x"0000";
			DatosS : out std_logic_vector(15 downto 0):= x"0000";
			RW, IOM: in std_logic
			);
    end component;

	component UControl
    	port(IR : in std_logic_vector(11 downto 0);
		   senControl : out std_logic_vector(15 downto 0);
           clk : in std_logic
           );
    end component;

	component ALU
    	port( A, B : in std_logic_vector(15 downto 0);
			  R : out std_logic_vector(15 downto 0);
			  OPER : in std_logic_vector(3 downto 0);
			  C : out std_logic_vector(2 downto 0)	   
            );
   end component;

   component Multiplexor
 	  port( Entrada1, Entrada2, Entrada3, Entrada4 : in std_logic_vector (15 downto 0);
		    Salida : out std_logic_vector (15 downto 0);
		    Selector : in std_logic_vector (1 downto 0)
		   );
   end component;

   component PuertoE
   	  port(Datos : out std_logic_vector(15 downto 0);
		 Direccion : in std_logic_vector(8 downto 0);
		 IOM, WR, clk: in std_logic;
         Entrada : in std_logic_vector(15 downto 0)
        );
   end component;

	component PuertoS
	port(Datos : in std_logic_vector(15 downto 0);
		 Direccion : in std_logic_vector(8 downto 0);
		 IOM, WR, clk: in std_logic;
         Salida : out std_logic_vector(15 downto 0)
        );
   end component;

	component Bufffer
	port(Entrada : in std_logic_vector(15 downto 0);
		 Salida : out std_logic_vector(15 downto 0);
		 SenControl : in std_logic
		);
   end component;

end package;
