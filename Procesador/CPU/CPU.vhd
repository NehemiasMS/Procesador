-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Marian Meza
-- 
-- Create Date:    15/04/2020 12:13:19
-- Project Name:   CPU
-- Module Name:    CPU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned
use work.Circuitos.all;

entity CPU is
	port(--LPC, INCPC, LPAR, CLK, LIR, LPBR: in STD_LOGIC
		 CLK : in std_logic;
		 Entrada: in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
		 Salida: out STD_LOGIC_VECTOR(15 downto 0):= x"0000"		
		);
end CPU;

architecture arq1 of CPU is

	signal LPC, INCPC, LPAR, LIR, LPBR, LMAR, LMBR, WR, BMBR, IOM, LR1, LR2, LR3, LRF, JUMP : std_logic := '0';
	signal MMBR, MUXA, MUXB : std_logic_vector(1 downto 0):= "00";	
	signal Cond, Flags : std_logic_vector(2 downto 0):= "000";
	signal OPER : std_logic_vector(3 downto 0):= x"0";
	signal salidaPC, EntradaROM, EntradaRAM : std_logic_vector(8 downto 0):= "000000000";
	signal salidaPBR, salidaIR, SalidaROM : std_logic_vector(11 downto 0):= x"000";
	signal ERAM, SRAM, salidaPE : std_logic_vector(15 downto 0):= x"0000";
	signal senalesCtrl, salidaALU, salidaMM, salidaMBR, salidaR1, salidaR2, salidaR3, salidaMA, salidaMB, SIRSPBR : std_logic_vector(15 downto 0):= x"0000";

begin

LPAR <= senalesCtrl(14);
INCPC <= senalesCtrl(13);
LPC <= senalesCtrl(12) AND JUMP;
LPBR <= senalesCtrl(11);
LIR <= senalesCtrl(10);
LMAR <= senalesCtrl(9);
LMBR <= senalesCtrl(8);
WR <= senalesCtrl(7);
BMBR <= senalesCtrl(6);
MMBR <= senalesCtrl(5 downto 4);
LR1 <= senalesCtrl(3);
LR2 <= senalesCtrl(2);
LR3 <= senalesCtrl(1);
LRF <= senalesCtrl(0);

MUXA <= salidaIR(5 downto 4);    
MUXB(1) <= salidaIR(3) AND  NOT(salidaIR(7) AND salidaIR(6));
MUXB(0) <= salidaIR(2) AND  NOT(salidaIR(7) AND salidaIR(6));
OPER <= salidaIR(11 downto 8);
SIRSPBR <= salidaIR(3 downto 0) & salidaPBR;

IOM <= salidaIR(11) AND salidaIR(10) AND NOT(salidaIR(9)) AND NOT(salidaIR(8));

with salidaIR(11 downto 6) select 
JUMP <= '1' when "110100",
		Flags(1) when "111000",
		Flags(2) when "111001",
		NOT Flags(1) AND NOT Flags(2) when  "111010",
		'0' when others;

with BMBR select
ERAM <= salidaMBR when '1',
        "ZZZZZZZZZZZZZZZZ" when others;

PC : Contador9 port map(LPC, INCPC, clk, salidaPBR(8 downto 0), salidaPC);
PAR: Registro9 port map(LPAR, clk, salidaPC, EntradaROM);
IR : Registro12 port map(LIR, clk, salidaPBR, salidaIR);
PBR : Registro12 port map(LPBR, clk, SalidaROM, salidaPBR);
ROMP : ROM_programa port map(EntradaROM, salidaROM);
UC : UControl port map(salidaIR, senalesCtrl, clk);
MAR : Registro9 port map(LMAR, clk, SalidaROM(8 downto 0), EntradaRAM);
RAMD : RAM port map(EntradaRAM, ERAM, SRAM, WR, IOM);
PE : PuertoE port map(salidaPE, EntradaRAM, IOM, WR, clk, Entrada);
PS : PuertoS port map(ERAM, EntradaRAM, IOM, WR, clk, Salida);
MM : Multiplexor port map(SRAM, SIRSPBR, salidaALU, salidaPE, salidaMM, MMBR);
MBR : Registro16 port map(LMBR, clk, salidaMM, salidaMBR);
R1 : Registro16 port map(LR1, clk, salidaALU, salidaR1);
R2 : Registro16 port map(LR2, clk, salidaALU, salidaR2);
R3 : Registro16 port map(LR3, clk, salidaALU, salidaR3);
MA : Multiplexor port map(salidaMBR, salidaR1, salidaR2, salidaR3, salidaMA, MUXA);
MB : Multiplexor port map(salidaMBR, salidaR1, salidaR2, salidaR3, salidaMB, MUXB);
ULA : ALU port map(salidaMA, salidaMB, salidaALU, OPER, Cond);
RF : Registro3 port map(LRF, clk, Cond, Flags);
--BUFF : Bufffer port map(salidaMBR, EySRAM, BMBR);

end arq1;
