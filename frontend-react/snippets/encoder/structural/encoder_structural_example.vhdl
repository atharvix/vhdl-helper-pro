-- Structural 2-to-1 Encoder Example
library ieee;
use ieee.std_logic_1164.all;

entity encoder2to1_structural is
    port (
        d0, d1 : in std_logic;
        y : out std_logic
    );
end encoder2to1_structural;

architecture structural of encoder2to1_structural is
begin
    y <= d1;
end structural; 