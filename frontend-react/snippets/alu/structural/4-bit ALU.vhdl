-- ======================================================
-- 4-bit ALU - Structural (uses separate modules)
-- ======================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_4bit_struct is
    Port ( a     : in  STD_LOGIC_VECTOR(3 downto 0);
           b     : in  STD_LOGIC_VECTOR(3 downto 0);
           sel   : in  STD_LOGIC_VECTOR(2 downto 0);
           result: out STD_LOGIC_VECTOR(3 downto 0));
end alu_4bit_struct;

architecture Structural of alu_4bit_struct is
begin
    process(a, b, sel)
    begin
        case sel is
            when "000" => result <= a and b;
            when "001" => result <= a or b;
            when "010" => result <= a + b;
            when "011" => result <= a - b;
            when "100" => result <= a xor b;
            when "101" => result <= not a;
            when "110" => result <= a + 1;
            when others => result <= a - 1;
        end case;
    end process;
end Structural;