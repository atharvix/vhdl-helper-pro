-- ======================================================
-- 16x1 MUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16x1 is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           sel : in STD_LOGIC_VECTOR(3 downto 0);
           y   : out STD_LOGIC);
end mux16x1;

architecture Behavioral of mux16x1 is
begin
    process(a, sel)
    begin
        case sel is
            when "0000" => y <= a(0);
            when "0001" => y <= a(1);
            when "0010" => y <= a(2);
            when "0011" => y <= a(3);
            when "0100" => y <= a(4);
            when "0101" => y <= a(5);
            when "0110" => y <= a(6);
            when "0111" => y <= a(7);
            when "1000" => y <= a(8);
            when "1001" => y <= a(9);
            when "1010" => y <= a(10);
            when "1011" => y <= a(11);
            when "1100" => y <= a(12);
            when "1101" => y <= a(13);
            when "1110" => y <= a(14);
            when others => y <= a(15);
        end case;
    end process;
end Behavioral;
