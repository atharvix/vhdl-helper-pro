-- Uncategorized 1-bit ALU Example
entity alu is
  Port ( a : in std_logic;
         b : in std_logic;
         sel : in std_logic;
         y : out std_logic);
end alu;

architecture Example of alu is
begin
  y <= (a and b) when sel = '0' else (a or b);
end Example; 