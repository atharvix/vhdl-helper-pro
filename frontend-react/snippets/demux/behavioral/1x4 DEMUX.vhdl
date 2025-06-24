-- ======================================================
-- 1x4 DEMUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x4 is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
           y   : out STD_LOGIC_VECTOR(3 downto 0));
end demux1x4;

architecture Behavioral of demux1x4 is
begin
    y <= ("0000");
    process(i, sel)
    begin
        case sel is
            when "00" => y(0) <= i;
            when "01" => y(1) <= i;
            when "10" => y(2) <= i;
            when others => y(3) <= i;
        end case;
    end process;
end Behavioral;