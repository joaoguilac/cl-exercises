LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bit_comparator IS
PORT (
  A, B: IN STD_LOGIC;
  in_X, in_Y, in_Z: IN STD_LOGIC;
  out_X, out_Y, out_Z: OUT STD_LOGIC
);
END bit_comparator;

ARCHITECTURE behaviour OF bit_comparator IS
BEGIN
  out_X <= in_X AND (A XNOR B);
  out_Y <= in_Y OR (in_X AND A AND (NOT B));
  out_Z <= in_Z OR (in_X AND (NOT A) AND B);
END behaviour;