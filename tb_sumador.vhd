--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_sumador IS
END tb_sumador;
 
ARCHITECTURE behavior OF tb_sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         oper1 : IN  std_logic_vector(31 downto 0);
         oper2 : IN  std_logic_vector(31 downto 0);
         resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal oper2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal resultado : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          oper1 => oper1,
          oper2 => oper2,
          resultado => resultado
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		oper1 <="00000000000000000000000000000001";
		oper2 <="00000000000000000000000000000010";
      wait for 100 ns;	
		
		oper1 <="00000000000000000000000000000101";
		oper2 <="00000000000000000000000000000111";
      --wait for 20 ns;	

      

      -- insert stimulus here 

      wait;
   end process;

END;

