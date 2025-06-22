-- ======================================================
-- 1x16 DEMUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x16 is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR(3 downto 0);
           y   : out STD_LOGIC_VECTOR(15 downto 0));
end demux1x16;

architecture Behavioral of demux1x16 is
begin
    y <= (others => '0');
    process(i, sel)
    begin
        case sel is
            when "0000" => y(0) <= i;
            when "0001" => y(1) <= i;
            when "0010" => y(2) <= i;
            when "0011" => y(3) <= i;
            when "0100" => y(4) <= i;
            when "0101" => y(5) <= i;
            when "0110" => y(6) <= i;
            when "0111" => y(7) <= i;
            when "1000" => y(8) <= i;
            when "1001" => y(9) <= i;
            when "1010" => y(10) <= i;
            when "1011" => y(11) <= i;
            when "1100" => y(12) <= i;
            when "1101" => y(13) <= i;
            when "1110" => y(14) <= i;
            when others => y(15) <= i;
        end case;
    end process;
end Behavioral;