library IEEE;
use IEEE.std_logic_1164.all;

ENTITY questao3 IS
PORT (
  a: IN std_logic;
  b: IN std_logic;
  c: OUT std_logic
);
END questao3;

ARCHITECTURE circuito OF questao3 IS
BEGIN
  c <= a nand b;
END circuito;