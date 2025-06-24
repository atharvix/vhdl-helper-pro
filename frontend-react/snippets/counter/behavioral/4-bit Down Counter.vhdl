-- ======================================================
-- 4-bit Down Counter - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity down_counter is
    Port ( clk  : in  STD_LOGIC;
           rst  : in  STD_LOGIC;
           count : out STD_LOGIC_VECTOR(3 downto 0));
end down_counter;

architecture Behavioral of down_counter is
    signal temp : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            temp <= "1111";
        elsif rising_edge(clk) then
            temp <= temp - 1;
        end if;
    end process;
    count <= temp;
end Behavioral;