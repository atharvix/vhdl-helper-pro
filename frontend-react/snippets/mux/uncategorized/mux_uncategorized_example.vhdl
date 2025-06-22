-- Uncategorized 2-to-1 Multiplexer Example
entity mux is
  Port ( a : in std_logic;
         b : in std_logic;
         sel : in std_logic;
         y : out std_logic);
end mux;

architecture Example of mux is
begin
  y <= a when sel = '0' else b;
end Example; 