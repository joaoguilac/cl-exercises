library IEEE;
use IEEE.std_logic_1164.all;

ENTITY questao2 IS
PORT (
	a: IN bit_vector(0 to 3);
	b: IN bit_vector(3 downto 0);
	c: OUT bit_vector(7 downto 0)
);
END questao2;

ARCHITECTURE concatenacao OF questao2 IS
BEGIN
  c(3 downto 0) <= b;
  c(4) <= a(0);
  c(5) <= a(1);
  c(6) <= a(2);
  c(7) <= a(3);
END concatenacao;