-- ======================================================
-- 8x1 MUX - Structural using 4x1 and 2x1 muxes
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8x1_struct is
    Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           y   : out STD_LOGIC);
end mux8x1_struct;

architecture Structural of mux8x1_struct is
    component mux4x1
        Port ( a, b, c, d : in STD_LOGIC;
               sel : in STD_LOGIC_VECTOR(1 downto 0);
               y   : out STD_LOGIC);
    end component;

    component mux2x1
        Port ( a, b : in STD_LOGIC;
               sel : in STD_LOGIC;
               y   : out STD_LOGIC);
    end component;

    signal y0, y1: STD_LOGIC;
begin
    u1: mux4x1 port map(a => a(0), b => a(1), c => a(2), d => a(3), sel => sel(1 downto 0), y => y0);
    u2: mux4x1 port map(a => a(4), b => a(5), c => a(6), d => a(7), sel => sel(1 downto 0), y => y1);
    u3: mux2x1 port map(a => y0, b => y1, sel => sel(2), y => y);
end Structural;