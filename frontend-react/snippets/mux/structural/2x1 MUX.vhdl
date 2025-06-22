-- ======================================================
-- 2x1 MUX - Structural
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1_struct is
    Port ( a, b : in STD_LOGIC;
           sel : in STD_LOGIC;
           y   : out STD_LOGIC);
end mux2x1_struct;

architecture Structural of mux2x1_struct is
    signal not_sel, and1, and2: STD_LOGIC;
begin
    not_sel <= not sel;
    and1 <= a and not_sel;
    and2 <= b and sel;
    y <= and1 or and2;
end Structural;
