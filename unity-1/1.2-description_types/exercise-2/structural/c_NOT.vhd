library IEEE;
use IEEE.std_logic_1164.all;

ENTITY c_NOT IS
PORT (
  a: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END c_NOT;

ARCHITECTURE est_NOT OF c_NOT IS
BEGIN
  x <= NOT a;
END est_NOT;