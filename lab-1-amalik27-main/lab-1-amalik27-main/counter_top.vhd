library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_top is
    Port (
        btn, sw : in std_logic_vector(3 downto 0);
        clk : in std_logic;
        cnt : out std_logic_vector(3 downto 0)
    );
end counter_top;

architecture Behavioral of counter_top is
    -- Signals
    signal rst, en, updn, ld, div: std_logic;

begin
    -- Instantiating debounce for reset
    reset: entity work.debounce
        port map(
            btn => btn(0),
            clk => clk,
            dbnc => rst
        );

    -- Instantiating debounce for enable
    enable: entity work.debounce
        port map(
            btn => btn(1),
            clk => clk,
            dbnc => en
        );

    -- Instantiating debounce for up/down
    updown: entity work.debounce
        port map(
            btn => btn(2),
            clk => clk,
            dbnc => updn
        );

    -- Instantiating debounce for load
    load: entity work.debounce
        port map(
            btn => btn(3),
            clk => clk,
            dbnc => ld
        );

    -- Instantiating clock divider
    clockdiv: entity work.clock_div
        port map(
            clk => clk,
            div => div
        );

    -- Instantiating fancy counter
    u6: entity work.fancy_counter
        port map(
            clk => clk,
            clk_en => div,
            dir => sw(0),
            en => en,
            ld => ld,
            rst => rst,
            updn => updn,
            val => sw,
            cnt => cnt
        );

end Behavioral;
