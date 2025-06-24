-- Uncategorized 4-bit Up Counter Example
entity up_counter is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        q     : out std_logic_vector(3 downto 0)
    );
end up_counter;

architecture Example of up_counter is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;
    q <= std_logic_vector(count);
end Example; 