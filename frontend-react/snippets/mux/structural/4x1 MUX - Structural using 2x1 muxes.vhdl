-- ======================================================
-- 4x1 MUX - Structural using 2x1 muxes
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1_struct is
    Port ( a, b, c, d : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           y   : out STD_LOGIC);
end mux4x1_struct;

architecture Structural of mux4x1_struct is
    component mux2x1
        Port ( a, b : in STD_LOGIC;
               sel : in STD_LOGIC;
               y   : out STD_LOGIC);
    end component;

    signal y1, y2: STD_LOGIC;
begin
    m1: mux2x1 port map(a => a, b => b, sel => sel(0), y => y1);
    m2: mux2x1 port map(a => c, b => d, sel => sel(0), y => y2);
    m3: mux2x1 port map(a => y1, b => y2, sel => sel(1), y => y);
end Structural;