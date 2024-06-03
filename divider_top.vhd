library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Enabled as it might be necessary for arithmetic functions.

entity divider_top is
    Port (
        div: inout std_logic;
        clk: in std_logic
    );
end divider_top;

architecture Behavioral of divider_top is
    -- Signals
    signal divider_output : std_logic;
    
begin
    -- Instantiating clock divider directly from the work library
    clo: entity work.clock_div
        port map(
            clk => clk,
            div => divider_output
        );

    -- Toggling div signal based on divider_output
    process(CLK)
    begin
        if rising_edge(CLK) then
            if divider_output = '1' then
                div <= not div;
            end if;
        end if;
    end process;

end Behavioral;
