library IEEE;
use IEEE.std_logic_1164.all;

ENTITY c_AND IS
PORT (
  a, b: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END c_AND;

ARCHITECTURE est_AND OF c_AND IS
BEGIN
  x <= a AND b;
END est_AND;