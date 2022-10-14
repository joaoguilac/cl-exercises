library ieee;
use ieee.std_logic_1164.all;

ENTITY higher_number_tb IS
-- empty
END higher_number_tb;

ARCHITECTURE tb OF higher_number_tb IS

-- DUT component
COMPONENT higher_number IS
PORT (
  A, B, C: IN std_logic_vector(0 to 7);
  X, Y, Z: OUT std_logic
);
END COMPONENT;

SIGNAL a, b, c: std_logic_vector(0 to 7);
SIGNAL x, y, z: std_logic;

BEGIN
  -- Connect DUT
  DUT: higher_number PORT MAP (a, b, c, x, y, z);
  
  PROCESS
  BEGIN
    a <= "11111111";
    b <= "11111100";
    c <= "11111110";
    wait for 100 ns;
    ASSERT(x='1') REPORT "Test 1: Fail A is higher number" SEVERITY error;
    ASSERT(y='0') REPORT "Test 1: Fail B is higher number" SEVERITY error;
    ASSERT(z='0') REPORT "Test 1: Fail C is higher number" SEVERITY error;
    
    a <= "00000001";
    b <= "00000001";
    c <= "00000000";
    wait for 100 ns;
    ASSERT(x='1') REPORT "Test 1: Fail A is higher number" SEVERITY error;
    ASSERT(y='1') REPORT "Test 1: Fail B is higher number" SEVERITY error;
    ASSERT(z='0') REPORT "Test 1: Fail C is higher number" SEVERITY error;

    a <= "11111111";
    b <= "11111111";
    c <= "11111111";
    wait for 100 ns;
    ASSERT(x='1') REPORT "Test 1: Fail A is higher number" SEVERITY error;
    ASSERT(y='1') REPORT "Test 1: Fail B is higher number" SEVERITY error;
    ASSERT(z='1') REPORT "Test 1: Fail C is higher number" SEVERITY error;

    -- Clear inputs
    a <= "00000000";
    b <= "00000000";
    c <= "00000000";

    ASSERT false REPORT "Test done." SEVERITY note;
  WAIT;
  END PROCESS;
END tb;