library IEEE;
use IEEE.std_logic_1164.all;

ENTITY q2_estrutural IS
PORT (
  a, b, c, d: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END q2_estrutural;

ARCHITECTURE estrutural OF q2_estrutural IS

COMPONENT c_AND
PORT (
  a, b: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT c_OR
PORT (
  a, b: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT c_NOT
PORT (
  a: IN STD_LOGIC;
  x: OUT STD_LOGIC
);
END COMPONENT;

SIGNAL temp: STD_LOGIC_VECTOR (0 to 10);

BEGIN
  ent0: c_AND PORT MAP (b, c, temp(0));
  ent1: c_NOT PORT MAP (temp(0), temp(1));
  ent2: c_AND PORT MAP (a, b, temp(2));
  ent3: c_OR PORT MAP (temp(1), temp(2), temp(3));
  ent4: c_NOT PORT MAP (b, temp(4));
  ent5: c_NOT PORT MAP (c, temp(5));
  ent6: c_AND PORT MAP (temp(4), temp(5), temp(6));
  ent7: c_OR PORT MAP (temp(6), c, temp(7));
  ent8: c_NOT PORT MAP (temp(7), temp(8));
  ent9: c_NOT PORT MAP (d, temp(9));
  ent10: c_AND PORT MAP (temp(8), temp(9), temp(10));
  s: c_OR PORT MAP (temp(3), temp(10), x);
END estrutural;
