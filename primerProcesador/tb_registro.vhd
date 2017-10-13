
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_registro IS
END tb_registro;
 
ARCHITECTURE behavior OF tb_registro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro
    PORT(
         reset : IN  std_logic;
         dataIn : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
          reset => reset,
          dataIn => dataIn,
          CLK => CLK,
          dataOut => dataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset<='1';
      wait for 100 ns;	
		
		reset<='0';
		dataIn <="00000000000000000000000000000010";
      wait for 100 ns;	
		
		reset<='0';
		dataIn <="00000000000000000000000000000100";
		wait for 100 ns;	
		
		reset<='0';
		dataIn <="00000000000000000000000000000101";

      

      -- insert stimulus here 

      wait;
   end process;

END;

