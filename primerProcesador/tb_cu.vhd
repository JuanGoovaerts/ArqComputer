
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_cu IS
END tb_cu;
 
ARCHITECTURE behavior OF tb_cu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cu
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cu PORT MAP (
          op => op,
          op3 => op3,
          salida => salida
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      op <= "10";
		op3 <="000000";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000001";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000010";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000011";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000111";
		wait for 20 ns;

      
      wait;
   end process;

END;

