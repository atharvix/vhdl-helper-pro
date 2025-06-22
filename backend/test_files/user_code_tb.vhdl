-- Testbench for 4-bit Up Counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity user_code_tb is
end entity user_code_tb;

architecture tb of user_code_tb is

    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal q     : std_logic_vector(3 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the unit under test (UUT)
    uut: entity work.up_counter
        port map (
            clk   => clk,
            reset => reset,
            q     => q
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Initial reset
        wait for 20 ns;
        reset <= '0';

        -- Run simulation for some time
        wait for 200 ns;

        -- Apply reset again
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- End simulation
        wait for 100 ns;
        assert false report "Testbench completed." severity note;
        wait;
    end process;

end architecture tb;
