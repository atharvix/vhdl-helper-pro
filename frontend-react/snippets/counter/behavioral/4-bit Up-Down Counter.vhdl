-- ======================================================
-- 4-bit Up-Down Counter - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter is
    Port ( clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           updown : in  STD_LOGIC;
           count  : out STD_LOGIC_VECTOR(3 downto 0));
end updown_counter;

architecture Behavioral of updown_counter is
    signal temp : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            temp <= "0000";
        elsif rising_edge(clk) then
            if updown = '1' then
                temp <= temp + 1;
            else
                temp <= temp - 1;
            end if;
        end if;
    end process;
    count <= temp;
end Behavioral;
