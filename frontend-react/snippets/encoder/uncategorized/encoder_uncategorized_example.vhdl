-- Uncategorized 2-to-1 Encoder Example
entity encoder is
  Port ( d0 : in std_logic;
         d1 : in std_logic;
         y : out std_logic);
end encoder;

architecture Example of encoder is
begin
  y <= d1;
end Example; 