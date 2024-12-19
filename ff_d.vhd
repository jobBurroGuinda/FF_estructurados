library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
    Port ( D : in  STD_LOGIC;
				Reset : in STD_LOGIC;
           Q : out  STD_LOGIC;
			  clk : in STD_LOGIC);
end ff_d;

architecture Behavioral of ff_d is
	signal q0 : std_logic;
begin
	process(clk, D)
	begin
		if clk'event and clk = '1' then
			if Reset = '1' then
				q0 <= '0';
			elsif Reset = '0' then
				q0 <= D;
			end if;
		end if;
		Q <= q0;
	end process;

end Behavioral;

