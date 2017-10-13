
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux IS
END tb_mux;
 
ARCHITECTURE behavior OF tb_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         i : IN  std_logic;
         crs32 : IN  std_logic_vector(31 downto 0);
         imm32 : IN  std_logic_vector(31 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal crs32 : std_logic_vector(31 downto 0) := (others => '0');
   signal imm32 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          i => i,
          crs32 => crs32,
          imm32 => imm32,
          salida => salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		--wait for 100 ns;
      crs32 <= x"00005000";
		imm32 <= x"00000004";
		i <= '1';
		wait for 10 ns;
		crs32 <= x"00004000";
		imm32 <= x"00000003";
		i <= '0';

      wait;
   end process;

END;

