-- Uncategorized 2-to-4 Decoder Example
entity decoder is
  Port ( a : in std_logic_vector(1 downto 0);
         y : out std_logic_vector(3 downto 0));
end decoder;

architecture Example of decoder is
begin
  process(a)
  begin
    y <= "0001" when a = "00" else
         "0010" when a = "01" else
         "0100" when a = "10" else
         "1000";
  end process;
end Example; 