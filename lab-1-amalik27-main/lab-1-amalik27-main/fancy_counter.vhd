library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fancy_counter is
    Port (
        clk, clk_en, dir, en, ld, rst, updn : in std_logic;
        val : in std_logic_vector(3 downto 0);
        cnt : out std_logic_vector(3 downto 0)
    );
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal direction_register_output : std_logic := '0';
    signal value_register_output : std_logic_vector(3 downto 0) := (others => '0');
    signal cnt_val : std_logic_vector(3 downto 0) := (others => '0');
begin
    cnt <= cnt_val;

    counter: process(clk)
    begin
        if en = '1' and rising_edge(clk) then
            if rst = '1' then
                cnt_val <= "0000";
            elsif clk_en = '1' then
                if ld = '1' then
                    value_register_output <= val;
                end if;

                if updn = '1' then
                    direction_register_output <= dir;
                end if;

                if direction_register_output = '1' then
                    cnt_val <= std_logic_vector(unsigned(cnt_val) + 1);
                    if cnt_val >= value_register_output then
                        cnt_val <= "0000";
                    end if;
                elsif direction_register_output = '0' then
                    if cnt_val = "0000" then
                        cnt_val <= value_register_output;
                    else
                        cnt_val <= std_logic_vector(unsigned(cnt_val) - 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
