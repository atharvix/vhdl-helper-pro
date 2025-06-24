-- ======================================================
-- 2x1 MUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    Port ( a, b : in STD_LOGIC;
           sel : in STD_LOGIC;
           y   : out STD_LOGIC);
end mux2x1;

architecture Behavioral of mux2x1 is
begin
    y <= a when sel = '0' else b;
end Behavioral;