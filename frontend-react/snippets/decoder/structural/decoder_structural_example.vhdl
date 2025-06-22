-- Structural 2-to-4 Decoder Example
library ieee;
use ieee.std_logic_1164.all;

entity decoder2to4_structural is
    port (
        a : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end decoder2to4_structural;

architecture structural of decoder2to4_structural is
    signal n0, n1 : std_logic;
begin
    n0 <= not a(0);
    n1 <= not a(1);
    y(0) <= n1 and n0;
    y(1) <= n1 and a(0);
    y(2) <= a(1) and n0;
    y(3) <= a(1) and a(0);
end structural; 