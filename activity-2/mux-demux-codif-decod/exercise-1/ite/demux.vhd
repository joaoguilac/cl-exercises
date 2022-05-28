library IEEE;
use IEEE.std_logic_1164.all;

ENTITY demux IS
PORT (
  inp: IN std_logic_vector(0 to 1);
  key: IN std_logic_vector(0 to 1);
  out1, out2, out3, out4: OUT std_logic_vector(0 to 1)
);
END demux;

ARCHITECTURE if_then OF demux IS
BEGIN
  PROCESS(inp, key)
  BEGIN
    IF key = "00" THEN
      out1 <= inp;
    ELSIF key = "01" THEN
      out2 <= inp;
    ELSIF key = "10" THEN
      out3 <= inp;
    ELSE
      out4 <= inp;
    END IF;
  END
  PROCESS;
END if_then;