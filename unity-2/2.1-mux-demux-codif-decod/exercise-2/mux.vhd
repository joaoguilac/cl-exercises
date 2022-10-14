library IEEE;
use IEEE.std_logic_1164.all;

ENTITY mux IS
PORT (
  key: IN std_logic_vector(0 to 2);
  cout: OUT character
);
END mux;

ARCHITECTURE behaviour OF mux IS
BEGIN
  WITH key SELECT
    cout <= 'A' when "001",
            'B' when "010",
            'C' when "011",
            'D' when "100",
            'E' when "101",
            'F' when "110",
            'G' when "111",
            'H' when OTHERS;
END behaviour;