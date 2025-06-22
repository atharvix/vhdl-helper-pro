
-- ======================================================
-- DECODERS
-- ======================================================

-- ======================================================
-- 2x4 Decoder - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2x4 is
    Port ( sel : in  STD_LOGIC_VECTOR(1 downto 0);
           en  : in  STD_LOGIC;
           y   : out STD_LOGIC_VECTOR(3 downto 0));
end decoder2x4;

architecture Behavioral of decoder2x4 is
begin
    process(sel, en)
    begin
        if en = '1' then
            case sel is
                when "00" => y <= "0001";
                when "01" => y <= "0010";
                when "10" => y <= "0100";
                when others => y <= "1000";
            end case;
        else
            y <= "0000";
        end if;
    end process;
end Behavioral;