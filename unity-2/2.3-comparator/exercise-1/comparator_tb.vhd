library ieee;
use ieee.std_logic_1164.all;

ENTITY comparator_tb IS
-- empty
END comparator_tb;

ARCHITECTURE tb OF comparator_tb IS

-- DUT component
COMPONENT comparator IS
PORT (
  a, b: IN std_logic_vector(0 to 4);
  x, y, z: OUT std_logic
);
END COMPONENT;

SIGNAL a, b: std_logic_vector(0 to 4);
SIGNAL x, y, z: std_logic;

BEGIN
  -- Connect DUT
  DUT: comparator PORT MAP (a, b, x, y, z);
  
  PROCESS
  BEGIN
    a <= "10111";
    b <= "10111";
    wait for 100 ns;
    ASSERT(x='1') REPORT "Fail (10111 = 10111) == 1" SEVERITY error;
    ASSERT(y='0') REPORT "Fail (10111 > 10111) == 0" SEVERITY error;
    ASSERT(z='0') REPORT "Fail (10111 < 10111) == 0" SEVERITY error;

    a <= "10101";
    b <= "10111";
    wait for 100 ns;
    ASSERT(x='0') REPORT "Fail (10101 = 10111) == 0" SEVERITY error;
    ASSERT(y='0') REPORT "Fail (10101 > 10111) == 0" SEVERITY error;
    ASSERT(z='1') REPORT "Fail (10101 < 10111) == 1" SEVERITY error;

    a <= "10111";
    b <= "10101";
    wait for 100 ns;
    ASSERT(x='0') REPORT "Fail (10101 = 10111) == 0" SEVERITY error;
    ASSERT(y='1') REPORT "Fail (10101 > 10111) == 1" SEVERITY error;
    ASSERT(z='0') REPORT "Fail (10101 < 10111) == 0" SEVERITY error;
    
    a <= "00000";
    b <= "00001";
    wait for 100 ns;
    ASSERT(x='0') REPORT "Fail (00000 = 00001) == 0" SEVERITY error;
    ASSERT(y='0') REPORT "Fail (00000 > 00001) == 0" SEVERITY error;
    ASSERT(z='1') REPORT "Fail (00000 < 00001) == 1" SEVERITY error;

    -- Clear inputs
    a <= "00000";
    b <= "00000";

    ASSERT false REPORT "Test done." SEVERITY note;
  WAIT;
  END PROCESS;
END tb;