LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
PORT (
  A, B, Cin: IN std_logic;
  S, Cout: OUT std_logic
);
END full_adder;

ARCHITECTURE behaviour OF full_adder IS
BEGIN
  S <= A XOR B XOR Cin;
  Cout <= ((A XOR B) AND Cin) OR (A AND B);
END behaviour;