-- ======================================================
-- 1x4 DEMUX - Structural using 1x2
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x4_struct is
    Port ( i   : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
           y   : out STD_LOGIC_VECTOR(3 downto 0));
end demux1x4_struct;

architecture Structural of demux1x4_struct is
    component demux1x2
        Port ( i   : in STD_LOGIC;
               sel : in STD_LOGIC;
               y0  : out STD_LOGIC;
               y1  : out STD_LOGIC);
    end component;

    signal d0, d1: STD_LOGIC;
begin
    u1: demux1x2 port map(i => i, sel => sel(1), y0 => d0, y1 => d1);
    u2: demux1x2 port map(i => d0, sel => sel(0), y0 => y(0), y1 => y(1));
    u3: demux1x2 port map(i => d1, sel => sel(0), y0 => y(2), y1 => y(3));
end Structural;