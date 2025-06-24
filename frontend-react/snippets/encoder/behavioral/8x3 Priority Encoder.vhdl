-- ======================================================
-- 8x3 Priority Encoder - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder8x3 is
    Port ( d : in  STD_LOGIC_VECTOR(7 downto 0);
           y : out STD_LOGIC_VECTOR(2 downto 0);
           valid : out STD_LOGIC);
end priority_encoder8x3;

architecture Behavioral of priority_encoder8x3 is
begin
    process(d)
    begin
        valid <= '1';
        case true is
            when d(7) = '1' => y <= "111";
            when d(6) = '1' => y <= "110";
            when d(5) = '1' => y <= "101";
            when d(4) = '1' => y <= "100";
            when d(3) = '1' => y <= "011";
            when d(2) = '1' => y <= "010";
            when d(1) = '1' => y <= "001";
            when d(0) = '1' => y <= "000";
            when others => 
                y <= "000";
                valid <= '0';
        end case;
    end process;
end Behavioral;