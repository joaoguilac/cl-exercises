library IEEE;
use IEEE.std_logic_1164.all;

ENTITY c_OR IS
PORT (
  a, b: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END c_OR;

ARCHITECTURE est_OR OF c_OR IS
BEGIN
  x <= a OR b;
END est_OR;