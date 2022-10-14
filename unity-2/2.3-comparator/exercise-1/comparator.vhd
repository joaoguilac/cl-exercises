LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator IS
PORT (
  a, b: IN std_logic_vector(0 to 4);
  x, y, z: OUT std_logic
);
END comparator;

ARCHITECTURE behaviour OF comparator IS

COMPONENT bit_comparator IS
PORT (
  A, B: IN STD_LOGIC;
  in_X, in_Y, in_Z: IN STD_LOGIC;
  out_X, out_Y, out_Z: OUT STD_LOGIC
);
END COMPONENT;

SIGNAL x_out: std_logic_vector(0 to 3);
SIGNAL y_out: std_logic_vector(0 to 3);
SIGNAL z_out: std_logic_vector(0 to 3);

BEGIN
  ent0: bit_comparator PORT MAP (a(0), b(0), 
                                 '1', '0', '0', 
                                 x_out(0), y_out(0), z_out(0));
  
  ent1: bit_comparator PORT MAP (a(1), b(1), 
                                 x_out(0), y_out(0), z_out(0), 
                                 x_out(1), y_out(1), z_out(1));
  
  ent2: bit_comparator PORT MAP (a(2), b(2), 
                                 x_out(1), y_out(1), z_out(1), 
                                 x_out(2), y_out(2), z_out(2));
  
  ent3: bit_comparator PORT MAP (a(3), b(3), 
                                 x_out(2), y_out(2), z_out(2), 
                                 x_out(3), y_out(3), z_out(3));
  
  ent4: bit_comparator PORT MAP (a(4), b(4), 
                                 x_out(3), y_out(3), z_out(3), 
                                 x, y, z);
END behaviour;