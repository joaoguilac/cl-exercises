-- Testbench for DEMUX
library ieee;
use ieee.std_logic_1164.all;

ENTITY adder_subtractor_tb IS
-- empty
END adder_subtractor_tb;

ARCHITECTURE tb OF adder_subtractor_tb IS

-- DUT component
COMPONENT adder_subtractor IS
PORT (
  a, b: IN std_logic_vector(7 downto 0);
  op: IN std_logic;
  s: OUT std_logic_vector(7 downto 0);
  cout: OUT std_logic
);
END COMPONENT;

SIGNAL a, b: std_logic_vector(7 downto 0);
SIGNAL op: std_logic;
SIGNAL s: std_logic_vector(7 downto 0);
SIGNAL cout: std_logic;

BEGIN
  -- Connect DUT
  DUT: adder_subtractor PORT MAP (a, b, op, s, cout);
  
  PROCESS
  BEGIN
    a <= "10111010";
    b <= "01000101";
    op <= '0';
    wait for 100 ns;
    ASSERT(s="11111111") REPORT "Fail 10111010 + 01000101 != 11111111" SEVERITY error;
    ASSERT(cout='0') REPORT "Fail 10111010 + 01000101, cout != 0" SEVERITY error;

    a <= "10111010";
    b <= "01000101";
    op <= '1';
    wait for 100 ns;
    ASSERT(s="01110101") REPORT "Fail 10111010 - 01000101 != 01110101" SEVERITY error;
    ASSERT(cout='1') REPORT "Fail 10111010 - 01000101, cout != 1" SEVERITY error;

    a <= "00001111";
    b <= "00001111";
    op <= '0';
    wait for 100 ns;
    ASSERT(s="00011110") REPORT "Fail 00001111 + 00001111 != 00011110" SEVERITY error;
    ASSERT(cout='0') REPORT "Fail 00001111 + 00001111, cout != 0" SEVERITY error;

    a <= "00001111";
    b <= "00001111";
    op <= '1';
    wait for 100 ns;
    ASSERT(s="00000000") REPORT "Fail 00001111 - 00001111 != 00000000" SEVERITY error;
    ASSERT(cout='1') REPORT "Fail 00001111 - 00001111, cout != 1" SEVERITY error;

    -- Clear inputs
    a <= "00000000";
    b <= "00000000";

    ASSERT false REPORT "Test done." SEVERITY note;
  WAIT;
  END PROCESS;
END tb;