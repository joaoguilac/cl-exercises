library ieee;
use ieee.std_logic_1164.all;

ENTITY display_sete_seg IS
	PORT ( 
            i : IN std_logic_vector (3 downto 0);
            o : OUT std_logic_vector (6 downto 0)
		  );
END;

ARCHITECTURE decod_display OF display_sete_seg is
BEGIN
PROCESS (i)
BEGIN

    o <= "0000000";                    -- default value 

    CASE i IS
        WHEN "0000" => o <= "0000001"; -- 0
        WHEN "0001" => o <= "1001111"; -- 1
        WHEN "0010" => o <= "0010010"; -- 2
        WHEN "0011" => o <= "0000110"; -- 3
        WHEN "0100" => o <= "1001100"; -- 4
        WHEN "0101" => o <= "0100100"; -- 5
        WHEN "0110" => o <= "0100000"; -- 6
        WHEN "0111" => o <= "0001111"; -- 7
        WHEN "1000" => o <= "0000000"; -- 8
        WHEN "1001" => o <= "0000100"; -- 9
        WHEN "1010" => o <= "0001000"; -- a
        WHEN "1011" => o <= "1100000"; -- b
        WHEN "1100" => o <= "0110001"; -- c
        WHEN "1101" => o <= "1000010"; -- d
        WHEN "1110" => o <= "0110000"; -- e
        WHEN "1111" => o <= "0111000"; -- f
    END CASE;

END PROCESS;
END decod_display;