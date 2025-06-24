-- ======================================================
-- T Flip-Flop - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
    Port ( clk : in STD_LOGIC;
           t   : in STD_LOGIC;
           q   : out STD_LOGIC);
end t_ff;

architecture Behavioral of t_ff is
    signal temp : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if t = '1' then
                temp <= not temp;
            end if;
        end if;
    end process;
    q <= temp;
end Behavioral;