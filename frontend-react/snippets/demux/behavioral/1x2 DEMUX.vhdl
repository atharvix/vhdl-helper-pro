-- ======================================================
-- 1x2 DEMUX - Behavioral
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x2 is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y0  : out STD_LOGIC;
           y1  : out STD_LOGIC);
end demux1x2;

architecture Behavioral of demux1x2 is
begin
    y0 <= i when sel = '0' else '0';
    y1 <= i when sel = '1' else '0';
end Behavioral;