library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port (
        REG_IN : in std_logic;
        CE, CLK : in std_logic;
        REG_OUT : out std_logic
    );
end reg;

architecture reg of reg is
begin
    reg: process(CLK)
    begin
        if rising_edge(CLK) then
            if CE = '1' then
                REG_OUT <= REG_IN;
            end if;
        end if;
    end process;
end reg;
