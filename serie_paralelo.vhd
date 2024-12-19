
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity serie_paralelo is
	Port ( D : in  STD_LOGIC;
           Clk50Mhz : in  STD_LOGIC;
           Q : out  STD_LOGIC_vector(3 downto 0);
           led : out  STD_LOGIC;
           Reset : in  STD_LOGIC);
end serie_paralelo;

architecture Behavioral of serie_paralelo is
	constant max_count: integer := 5;
	signal count: INTEGER range 0 to max_count;
	signal clk_state: std_logic := '0';
	signal q0, q1, q2, q3 : std_logic;
begin

	DivisorFrec: process(Clk50Mhz, clk_state, count)
	begin
		if Clk50Mhz'event and Clk50Mhz = '1' then
			if count < max_count then
				count <= count+1;
			else
				clk_state <= not clk_state;
				count <= 0;
			end if;
		end if;
	end process;
	
	ff_d0: entity work.ff_d PORT MAP(
		D => D,
		Reset => Reset,
		Q => q0,
		clk => clk_state
	);
	
	ff_d1: entity work.ff_d PORT MAP(
		D => q0,
		Reset => Reset,
		Q => q1,
		clk => clk_state
	);
	
	ff_d2: entity work.ff_d PORT MAP(
		D => q1,
		Reset => Reset,
		Q => q2,
		clk => clk_state
	);
	
	ff_d3: entity work.ff_d PORT MAP(
		D => q2,
		Reset => Reset,
		Q => q3,
		clk => clk_state
	);

	led <= clk_state;
	Q <= q0 & q1 & q2 & q3;

end Behavioral;

