library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
    Port ( clk : in std_logic;
           div : out std_logic);
end clock_div;

architecture Behavioral of clock_div is
    signal clk_count : std_logic_vector(26 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (unsigned(clk_count) < 62499999) then
                clk_count <= std_logic_vector(unsigned(clk_count) + 1);
                div <= '0';
            else
                clk_count <= (others => '0');
                div <= '1';
            end if;
        end if;
    end process;
end Behavioral;
