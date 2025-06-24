-- ======================================================
-- 4x1 MUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port ( a, b, c, d : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           y   : out STD_LOGIC);
end mux4x1;

architecture Behavioral of mux4x1 is
begin
    process(a, b, c, d, sel)
    begin
        case sel is
            when "00" => y <= a;
            when "01" => y <= b;
            when "10" => y <= c;
            when others => y <= d;
        end case;
    end process;
end Behavioral;
