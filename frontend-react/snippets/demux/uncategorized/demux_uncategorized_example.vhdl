-- Uncategorized 1-to-2 Demultiplexer Example
entity demux is
  Port ( din : in std_logic;
         sel : in std_logic;
         y0 : out std_logic;
         y1 : out std_logic);
end demux;

architecture Example of demux is
begin
  y0 <= din when sel = '0' else '0';
  y1 <= din when sel = '1' else '0';
end Example; 