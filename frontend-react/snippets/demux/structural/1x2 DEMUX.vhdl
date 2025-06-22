-- ======================================================
-- 1x2 DEMUX - Structural
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x2_struct is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y0  : out STD_LOGIC;
           y1  : out STD_LOGIC);
end demux1x2_struct;

architecture Structural of demux1x2_struct is
    signal not_sel: STD_LOGIC;
begin
    not_sel <= not sel;
    y0 <= i and not_sel;
    y1 <= i and sel;
end Structural;