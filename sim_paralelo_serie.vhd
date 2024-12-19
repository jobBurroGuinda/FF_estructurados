--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:03:36 12/19/2024
-- Design Name:   
-- Module Name:   /home/ise/tutorias_DSD/FF_estructurados/sim_paralelo_serie.vhd
-- Project Name:  FF_estructurados
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: paralelo_serie
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim_paralelo_serie IS
END sim_paralelo_serie;
 
ARCHITECTURE behavior OF sim_paralelo_serie IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT paralelo_serie
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         SL : IN  std_logic;
         Clk50Mhz : IN  std_logic;
         Q : OUT  std_logic;
         led : OUT  std_logic;
         Reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal SL : std_logic := '0';
   signal Clk50Mhz : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal led : std_logic;

   -- Clock period definitions
   constant Clk50Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: paralelo_serie PORT MAP (
          D => D,
          SL => SL,
          Clk50Mhz => Clk50Mhz,
          Q => Q,
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
      -- hold reset state for 100 ns.
		SL <= '1';
		D <= "0110";
      wait for 100 ns;   end process;

END;
