-- ======================================================
-- 16x4 Encoder - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder16x4 is
    Port ( d : in  STD_LOGIC_VECTOR(15 downto 0);
           y : out STD_LOGIC_VECTOR(3 downto 0));
end encoder16x4;

architecture Behavioral of encoder16x4 is
begin
    process(d)
    begin
        case d is
            when "0000000000000001" => y <= "0000";
            when "0000000000000010" => y <= "0001";
            when "0000000000000100" => y <= "0010";
            when "0000000000001000" => y <= "0011";
            when "0000000000010000" => y <= "0100";
            when "0000000000100000" => y <= "0101";
            when "0000000001000000" => y <= "0110";
            when "0000000010000000" => y <= "0111";
            when "0000000100000000" => y <= "1000";
            when "0000001000000000" => y <= "1001";
            when "0000010000000000" => y <= "1010";
            when "0000100000000000" => y <= "1011";
            when "0001000000000000" => y <= "1100";
            when "0010000000000000" => y <= "1101";
            when "0100000000000000" => y <= "1110";
            when "1000000000000000" => y <= "1111";
            when others => y <= "0000";
        end case;
    end process;
end Behavioral;