library IEEE;
use IEEE.std_logic_1164.all;

ENTITY encoder IS
PORT (
  inp: IN std_logic_vector(0 to 7);
  cout: OUT std_logic_vector(0 to 2)
);
END encoder;

ARCHITECTURE behaviour OF encoder IS
BEGIN
  WITH inp SELECT
    cout <= "001" when "10000000",
            "010" when "01000000",
            "011" when "00100000",
            "100" when "00010000",
            "101" when "00001000",
            "110" when "00000100",
            "111" when "00000010",
            "000" when OTHERS;
END behaviour;