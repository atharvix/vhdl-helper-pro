-- ======================================================
-- D Flip-Flop - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff is
    Port ( clk : in STD_LOGIC;
           d   : in STD_LOGIC;
           q   : out STD_LOGIC);
end d_ff;

architecture Behavioral of d_ff is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;