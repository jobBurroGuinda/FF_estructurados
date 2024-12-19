
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim_paralelo_paralelo IS
END sim_paralelo_paralelo;
 
ARCHITECTURE behavior OF sim_paralelo_paralelo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT paralelo_paralelo
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0);
         Clk50Mhz : IN  std_logic;
         led : OUT  std_logic;
         Reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal Clk50Mhz : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal led : std_logic;

   -- Clock period definitions
   constant Clk50Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: paralelo_paralelo PORT MAP (
          D => D,
          Q => Q,
          Clk50Mhz => Clk50Mhz,
          led => led,
          Reset => Reset
        );

   -- Clock process definitions
   Clk50Mhz_process :process
   begin
		Clk50Mhz <= '0';
		wait for Clk50Mhz_period/2;
		Clk50Mhz <= '1';
		wait for Clk50Mhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      D <= "1101";
      wait for 100 ns;
   end process;

END;
