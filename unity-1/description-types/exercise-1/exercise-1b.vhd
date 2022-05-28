library IEEE;
use IEEE.std_logic_1164.all;

ENTITY exercicio1b IS
PORT ( 
  a: IN std_logic;
  b: IN std_logic;
  s: OUT std_logic
);
END;

ARCHITECTURE arq1b OF exercicio1b IS
BEGIN
  s <= a NAND b;
END arq1b;