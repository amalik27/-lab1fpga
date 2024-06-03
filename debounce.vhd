library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity debounce is
    Port (
        btn : in std_logic;
        clk : in std_logic;
        dbnc : out std_logic
    );
end debounce;

architecture Behavioral of debounce is
    signal counter : std_logic_vector(21 downto 0) := (others => '0');
begin
    debounce: process(clk)
    begin
        if rising_edge(clk) then
            if btn = '1' then
                if (unsigned(counter) > 2499999) then
                    dbnc <= '1';
                else
                    counter <= std_logic_vector(unsigned(counter) + 1);
                end if;
            else
                dbnc <= '0';
                counter <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;
