
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_IM IS
END tb_IM;
 
ARCHITECTURE behavior OF tb_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		address <= x"00000000";
		reset <='0';
		wait for 20 ns;
		
		address <= x"00000001";
		reset <='0';		
		wait for 20 ns;
		
		address <= x"00000002";
		reset <='0';		
		wait for 5 ns;
		
		reset <='1';		
		wait for 5 ns;
		
		reset <= '0';
		wait for 10 ns;
		
		address <= x"00000000";
		reset <='0';
		wait for 20 ns;


      wait;
   end process;

END;

