-- ======================================================
-- 1x8 DEMUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x8 is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR(2 downto 0);
           y   : out STD_LOGIC_VECTOR(7 downto 0));
end demux1x8;

architecture Behavioral of demux1x8 is
begin
    y <= (others => '0');
    process(i, sel)
    begin
        case sel is
            when "000" => y(0) <= i;
            when "001" => y(1) <= i;
            when "010" => y(2) <= i;
            when "011" => y(3) <= i;
            when "100" => y(4) <= i;
            when "101" => y(5) <= i;
            when "110" => y(6) <= i;
            when others => y(7) <= i;
        end case;
    end process;
end Behavioral;