-- ======================================================
-- 3x8 Decoder - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3x8 is
    Port ( sel : in  STD_LOGIC_VECTOR(2 downto 0);
           en  : in  STD_LOGIC;
           y   : out STD_LOGIC_VECTOR(7 downto 0));
end decoder3x8;

architecture Behavioral of decoder3x8 is
begin
    process(sel, en)
    begin
        if en = '1' then
            case sel is
                when "000" => y <= "00000001";
                when "001" => y <= "00000010";
                when "010" => y <= "00000100";
                when "011" => y <= "00001000";
                when "100" => y <= "00010000";
                when "101" => y <= "00100000";
                when "110" => y <= "01000000";
                when others => y <= "10000000";
            end case;
        else
            y <= (others => '0');
        end if;
    end process;
end Behavioral;