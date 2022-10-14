library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY trabalho3_3 IS
	PORT ( 
            e1, e2          : IN std_logic;
            clk             : IN std_logic;
            i               : IN std_logic_vector(15 downto 0);
            d1, d2, d3, d4  : OUT std_logic_vector(6 downto 0);
            d5, d6, d7, d8  : OUT std_logic_vector(6 downto 0);
            l1, l2          : OUT std_logic;
            f1out, f2out    : OUT std_logic;
            isRunnigOut     : OUT std_logic
		  );
END;

ARCHITECTURE hardware OF trabalho3_3 is

    COMPONENT display_sete_seg IS
    PORT ( 
            i : IN std_logic_vector (3 downto 0);
            o : OUT std_logic_vector (6 downto 0)
		  );
    END COMPONENT;

    SIGNAL a, b, counter    : std_logic_vector(15 downto 0) := "0000000000000000";
    SIGNAL o                : std_logic_vector(15 downto 0) := "0000000000000000";
    SIGNAL f1, f2, isRunnig : std_logic                     := '0';


BEGIN
PROCESS (e1, e2, i, a, b, f1, f2, counter, clk, isRunnig)
BEGIN
    -- Clock na borda de subida
    IF rising_edge(clk) THEN
        -- Pode-se criar um signal e displays para mostrar o i em tempo real
        o <= i;

        -- Recebe os valores de A
        IF (e1 = '0' and isRunnig = '0') THEN
            a   <= i;
            f1  <= '1';
            l1  <= '1';
            -- add code: wait 50 ms
        ELSE
            l1  <= '0';
        END IF;

        -- Recebe os valores de B
        IF (e2 = '0' and isRunnig = '0') THEN
            b   <= i;
            f2  <= '1';
            l2  <= '1';
            -- add code: wait 50 ms
        ELSE
            l2  <= '0';
        END IF;

        -- Começa a rodar o programa
        IF (f1  = '1' and f2  = '1' and isRunnig = '0') THEN
            counter <= "0000000000000000";
            isRunnig <= '1';
            f1  <= '0';
            f2  <= '0';
        END IF;

        -- Calcula o quociente
        IF (isRunnig = '1') THEN
            IF (a >= b and b /= "0000000000000000") THEN
                a       <= a - b;
                counter <= counter + '1';
            ELSE
                -- Se A < B, então da erro
                IF (counter = "0000000000000000" or b = "0000000000000000") THEN
                    counter   <= "1110111011101110";
                END IF;

                isRunnig <= '0';
            END IF;
        END IF;
    END IF;

END PROCESS;

ent0: display_sete_seg PORT MAP (counter(15 downto 12), d1);
ent1: display_sete_seg PORT MAP (counter(11 downto 8), d2);
ent2: display_sete_seg PORT MAP (counter(7 downto 4), d3);
ent3: display_sete_seg PORT MAP (counter(3 downto 0), d4);

ent4: display_sete_seg PORT MAP (o(7 downto 4), d5);
ent5: display_sete_seg PORT MAP (o(3 downto 0), d6);
ent6: display_sete_seg PORT MAP (a(7 downto 4), d7);
ent7: display_sete_seg PORT MAP (a(3 downto 0), d8);

f1out <= f1;
f2out <= f2;
isRunnigOut <= isRunnig;

END hardware;