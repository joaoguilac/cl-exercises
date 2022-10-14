library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY trabalho3_2 IS
	PORT ( 
            s    : IN std_logic_vector  (2  downto 0);
            a, b : IN std_logic_vector  (15 downto 0);
            o    : OUT std_logic_vector (15 downto 0)
		  );
END;

ARCHITECTURE ula OF trabalho3_2 is
BEGIN
PROCESS (s, a, b)
BEGIN

    CASE s IS
        WHEN "000" => o <= a + b;
        WHEN "001" => o <= a - b;
        WHEN "010" => o <= std_logic_vector(shift_left (unsigned(a), 1));
        WHEN "011" => o <= std_logic_vector(shift_right(unsigned(a), 1));
        WHEN "100" => o <= a and  b;
        WHEN "101" => o <= a  or  b;
        WHEN "110" => o <= a xor  b;
        WHEN "111" => o <= a xnor b;
        WHEN others => o <= "0000000000000000";
    END CASE;

END PROCESS;
END ula;