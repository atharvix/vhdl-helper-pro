-- ======================================================
-- JK Flip-Flop - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( clk : in STD_LOGIC;
           j   : in STD_LOGIC;
           k   : in STD_LOGIC;
           q   : out STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is
    signal temp : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case (j & k) is
                when "00" => temp <= temp;    -- no change
                when "01" => temp <= '0';      -- reset
                when "10" => temp <= '1';      -- set
                when others => temp <= not temp; -- toggle
            end case;
        end if;
    end process;
    q <= temp;
end Behavioral;