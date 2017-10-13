
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          op1 => op1,
          op2 => op2,
          aluop => aluop,
          salida => salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      op1 <= x"0000000F";
		op2 <= x"0000008F";
	   aluop <= "000001";--AND
		wait for 20 ns;
			
		op1 <= x"0000000F";
		op2 <= x"000000AF";
		aluop <= "000010";--OR
		wait for 20 ns;
		
		op1 <= x"00000009";
		op2 <= x"00000005";
		aluop <= "000000";--ADD
		wait for 20 ns;
		
		op1 <= x"00000009";
		op2 <= x"00000005";
		aluop <= "000101";--SUB
		wait for 20 ns;
		
		op1 <= x"00000005";
		op2 <= x"00000009";
		aluop <= "000101";--SUB
		wait for 20 ns;


      wait;
   end process;

END;

