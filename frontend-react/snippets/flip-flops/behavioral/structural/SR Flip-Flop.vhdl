-- ======================================================
-- SR Flip-Flop - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_ff is
    Port ( clk : in STD_LOGIC;
           s   : in STD_LOGIC;
           r   : in STD_LOGIC;
           q   : out STD_LOGIC);
end sr_ff;

architecture Behavioral of sr_ff is
    signal temp : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (s = '1' and r = '0') then
                temp <= '1';
            elsif (s = '0' and r = '1') then
                temp <= '0';
            elsif (s = '1' and r = '1') then
                temp <= 'X'; -- invalid
            end if;
        end if;
    end process;
    q <= temp;
end Behavioral;