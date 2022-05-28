library IEEE;
use IEEE.std_logic_1164.all;

ENTITY circuito IS
PORT (
  a, b, c, d: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END circuito;

ARCHITECTURE dataflow OF circuito IS
BEGIN
  x <= ((a AND b) OR (NOT (b AND c))) OR ((NOT d) AND (NOT ((NOT b and NOT c) OR c)));
END dataflow;
