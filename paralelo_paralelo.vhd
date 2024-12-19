
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity paralelo_paralelo is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Clk50Mhz : in  STD_LOGIC;
           led : out  STD_LOGIC;
           Reset : in  STD_LOGIC
			  );
end paralelo_paralelo;

architecture Behavioral of paralelo_paralelo is
	constant max_count: integer := 5;
	signal count: INTEGER range 0 to max_count;
	signal clk_state: std_logic := '0';
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
		D => D(0),
		Reset => Reset,
		Q => Q(0),
		clk => clk_state
	);
	
	ff_d1: entity work.ff_d PORT MAP(
		D => D(1),
		Reset => Reset,
		Q => Q(1),
		clk => clk_state
	);
	
	ff_d2: entity work.ff_d PORT MAP(
		D => D(2),
		Reset => Reset,
		Q => Q(2),
		clk => clk_state
	);
	
	ff_d3: entity work.ff_d PORT MAP(
		D => D(3),
		Reset => Reset,
		Q => Q(3),
		clk => clk_state
	);

	led <= clk_state;

end Behavioral;

