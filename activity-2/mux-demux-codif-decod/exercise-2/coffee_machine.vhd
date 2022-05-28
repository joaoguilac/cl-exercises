library IEEE;
use IEEE.std_logic_1164.all;

ENTITY coffee_machine IS
PORT (
  button: IN std_logic_vector(0 to 7);
  coffee_selected: OUT character
);
END coffee_machine;

ARCHITECTURE behaviour OF coffee_machine IS

COMPONENT encoder IS
PORT (
  inp: IN std_logic_vector(0 to 7);
  cout: OUT std_logic_vector(0 to 2)
);
END COMPONENT;

COMPONENT mux IS
PORT (
  key: IN std_logic_vector(0 to 2);
  cout: OUT character
);
END COMPONENT;

SIGNAL code: std_logic_vector(0 to 2);

BEGIN
  ent0: encoder PORT MAP (button, code);
  ent1: mux PORT MAP (code, coffee_selected);
END behaviour;