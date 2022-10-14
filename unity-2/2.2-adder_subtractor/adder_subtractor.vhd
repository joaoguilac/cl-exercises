LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder_subtractor IS
PORT (
  a, b: IN std_logic_vector(7 downto 0);
  op: IN std_logic;
  s: OUT std_logic_vector(7 downto 0);
  cout: OUT std_logic
);
END adder_subtractor;

ARCHITECTURE behaviour OF adder_subtractor IS

COMPONENT full_adder IS
PORT (
  A, B, Cin: IN std_logic;
  S, Cout: OUT std_logic
);
END COMPONENT;

SIGNAL c: std_logic_vector(1 to 7);
SIGNAL b_inv: std_logic_vector(0 to 7);

BEGIN
  b_inv(0) <= b(0) XOR op;
  ent0: full_adder PORT MAP (a(0), b_inv(0), op, s(0), c(1));
  
  b_inv(1) <= b(1) XOR op;
  ent1: full_adder PORT MAP (a(1), b_inv(1), c(1), s(1), c(2));
  
  b_inv(2) <= b(2) XOR op;
  ent2: full_adder PORT MAP (a(2), b_inv(2), c(2), s(2), c(3));
  
  b_inv(3) <= b(3) XOR op;
  ent3: full_adder PORT MAP (a(3), b_inv(3), c(3), s(3), c(4));
  
  b_inv(4) <= b(4) XOR op;
  ent4: full_adder PORT MAP (a(4), b_inv(4), c(4), s(4), c(5));
  
  b_inv(5) <= b(5) XOR op;
  ent5: full_adder PORT MAP (a(5), b_inv(5), c(5), s(5), c(6));
  
  b_inv(6) <= b(6) XOR op;
  ent6: full_adder PORT MAP (a(6), b_inv(6), c(6), s(6), c(7));
  
  b_inv(7) <= b(7) XOR op;
  ent7: full_adder PORT MAP (a(7), b_inv(7), c(7), s(7), cout);
END behaviour;