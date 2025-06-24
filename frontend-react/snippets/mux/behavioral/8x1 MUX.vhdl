-- ======================================================
-- 8x1 MUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8x1 is
    Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           y   : out STD_LOGIC);
end mux8x1;

architecture Behavioral of mux8x1 is
begin
    process(a, sel)
    begin
        case sel is
            when "000" => y <= a(0);
            when "001" => y <= a(1);
            when "010" => y <= a(2);
            when "011" => y <= a(3);
            when "100" => y <= a(4);
            when "101" => y <= a(5);
            when "110" => y <= a(6);
            when others => y <= a(7);
        end case;
    end process;
end Behavioral;