LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- USE IEEE.std_logic_arith.all;

ENTITY higher_number IS
PORT (
  A, B, C: IN std_logic_vector(0 to 7);
  X, Y, Z: OUT std_logic
);
END higher_number;

ARCHITECTURE behaviour OF higher_number IS
BEGIN
  PROCESS(A, B, C)
  BEGIN
    IF (A > B) THEN
      Y <= '0';
      IF (A > C) THEN
        X <= '1';
        Z <= '0';
      ELSIF (A < C) THEN
        X <= '0';
        Z <= '1';
      ELSIF (A = C) THEN
        X <= '1';
        Z <= '1';
      END IF;
    ELSIF (B > A) THEN
      X <= '0';
      IF (B > C) THEN
        Y <= '1';
        Z <= '0';
      ELSIF (B < C) THEN
        Y <= '0';
        Z <= '1';
      ELSIF (A = C) THEN
        Y <= '1';
        Z <= '1';
      END IF;
    ELSIF (A = B) THEN
      IF (A > C) THEN
        X <= '1';
        Y <= '1';
        Z <= '0';
      ELSIF (A < C) THEN
        X <= '0';
        Y <= '0';
        Z <= '1';
      ELSIF (A = C) THEN
        X <= '1';
        Y <= '1';
        Z <= '1';
      END IF;
    END IF;
  END
  PROCESS;
END behaviour;