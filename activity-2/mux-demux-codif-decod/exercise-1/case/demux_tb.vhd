-- Testbench for DEMUX
library ieee;
use ieee.std_logic_1164.all;

ENTITY demux_tb IS
-- empty
END demux_tb;

ARCHITECTURE tb OF demux_tb IS

-- DUT component
COMPONENT demux IS
PORT (
  inp: IN std_logic_vector(0 to 1);
  key: IN std_logic_vector(0 to 1);
  out1, out2, out3, out4: OUT std_logic_vector(0 to 1)
);
END COMPONENT;

SIGNAL inp: std_logic_vector(0 to 1);
SIGNAL key: std_logic_vector(0 to 1);
SIGNAL out1, out2, out3, out4: std_logic_vector(0 to 1);

BEGIN
  -- Connect DUT
  DUT: demux port map(inp, key, out1, out2, out3, out4);
  
  PROCESS
  BEGIN
    inp <= "00";
    key <= "00";
    WAIT FOR 100 ns;
    ASSERT(out1="00") REPORT "Fail input: 00/key: 00" SEVERITY error;
    key <= "01";
    WAIT FOR 100 ns;
    ASSERT(out2="00") REPORT "Fail input: 00/key: 01" SEVERITY error;
    key <= "10";
    WAIT FOR 100 ns;
    ASSERT(out3="00") REPORT "Fail input: 00/key: 10" SEVERITY error;
    key <= "11";
    WAIT FOR 100 ns;
    ASSERT(out4="00") REPORT "Fail input: 00/key: 11" SEVERITY error;
    
    inp <= "01";
    key <= "00";
    WAIT FOR 100 ns;
    ASSERT(out1="01") REPORT "Fail input: 01/key: 00" SEVERITY error;
    key <= "01";
    WAIT FOR 100 ns;
    ASSERT(out2="01") REPORT "Fail input: 01/key: 01" SEVERITY error;
    key <= "10";
    WAIT FOR 100 ns;
    ASSERT(out3="01") REPORT "Fail input: 01/key: 10" SEVERITY error;
    key <= "11";
    WAIT FOR 100 ns;
    ASSERT(out4="01") REPORT "Fail input: 01/key: 11" SEVERITY error;
    
    inp <= "10";
    key <= "00";
    WAIT FOR 100 ns;
    ASSERT(out1="10") REPORT "Fail input: 10/key: 00" SEVERITY error;
    key <= "01";
    WAIT FOR 100 ns;
    ASSERT(out2="10") REPORT "Fail input: 10/key: 01" SEVERITY error;
    key <= "10";
    WAIT FOR 100 ns;
    ASSERT(out3="10") REPORT "Fail input: 10/key: 10" SEVERITY error;
    key <= "11";
    WAIT FOR 100 ns;
    ASSERT(out4="10") REPORT "Fail input: 10/key: 11" SEVERITY error;
    
    inp <= "11";
    key <= "00";
    WAIT FOR 100 ns;
    ASSERT(out1="11") REPORT "Fail input: 11/key: 00" SEVERITY error;
    key <= "01";
    WAIT FOR 100 ns;
    ASSERT(out2="11") REPORT "Fail input: 11/key: 01" SEVERITY error;
    key <= "10";
    WAIT FOR 100 ns;
    ASSERT(out3="11") REPORT "Fail input: 11/key: 10" SEVERITY error;
    key <= "11";
    WAIT FOR 100 ns;
    ASSERT(out4="11") REPORT "Fail input: 11/key: 11" SEVERITY error;

    -- Clear inputs
    inp <= "00";
    key <= "00";

    ASSERT false REPORT "Test done." SEVERITY note;
  WAIT;
  END PROCESS;
END tb;