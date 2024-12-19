library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  clk : in STD_LOGIC);
end ff_d;

architecture Behavioral of ff_d is

begin
	process(clk, D)
	begin
		if clk'event and clk = '1' then
			Q <= D;
		end if;
	end process;

end Behavioral;

