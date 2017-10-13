
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_registerfile IS
END tb_registerfile;
 
ARCHITECTURE behavior OF tb_registerfile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerfile
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerfile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          rst => rst,
          crs1 => crs1,
          crs2 => crs2
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00000";
		dwr <= "00000000000000000000000000000100";
		wait for 20 ns;

		rs1 <= "00000";
		rs2 <= "00010";
		rd <= "00000";
		dwr <= "00000000000000000000000000000100";
      wait for 20 ns;	
		
		rs1 <= "00100";
		rs2 <= "00110";
		rd <= "00000";
		dwr <= "00000000000000000000000000000101";
      wait for 20 ns;	

		rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00101";
		dwr <= "00000000000000000000000000000100";

      wait;
   end process;

END;

