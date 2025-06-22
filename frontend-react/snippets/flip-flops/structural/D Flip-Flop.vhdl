-- ======================================================
-- D Flip-Flop - Structural
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff_struct is
    Port ( clk : in STD_LOGIC;
           d   : in STD_LOGIC;
           q   : out STD_LOGIC);
end d_ff_struct;

architecture Structural of d_ff_struct is
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            q <= d;
        end if;
    end process;
end Structural;