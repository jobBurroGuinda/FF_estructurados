
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paralelo_serie is
    Port ( D : in  STD_LOGIC_VECTOR(3 downto 0);
			  SL : in std_logic;
           Clk50Mhz : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           led : out  STD_LOGIC;
           Reset : in  STD_LOGIC);
end paralelo_serie;

architecture Behavioral of paralelo_serie is
	constant max_count: integer := 5;
	signal count: INTEGER range 0 to max_count;
	signal clk_state: std_logic := '0';
	signal q0, q1, q2 : std_logic;
	signal sc1, sc2, sc3, sc4: std_logic;
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
		D => sc1,
		Reset => Reset,
		Q => q0,
		clk => clk_state
	);
	
	ff_d1: entity work.ff_d PORT MAP(
		D => sc2,
		Reset => Reset,
		Q => q1,
		clk => clk_state
	);
	
	ff_d2: entity work.ff_d PORT MAP(
		D => sc3,
		Reset => Reset,
		Q => q2,
		clk => clk_state
	);
	
	ff_d3: entity work.ff_d PORT MAP(
		D => sc4,
		Reset => Reset,
		Q => Q,
		clk => clk_state
	);

	led <= clk_state;
	
	sc1 <= (not SL) and D(0);
	sc2 <= (q0 and SL) or ((not SL) and D(1));
	sc3 <= (q1 and SL) or ((not SL) and D(2));
	sc4 <= (q2 and SL) or ((not SL) and D(3));


end Behavioral;

