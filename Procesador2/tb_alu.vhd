LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         carry : IN  std_logic;
         aluop : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal carry : std_logic := '0';
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
          carry => carry,
          aluop => aluop,
          salida => salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000008F"; --143
	  aluop<="010000";--ADDCC = 
	  wait for 20 ns;
	  
	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"00000005"; --5
	  aluop<="010100";--SUBCC = 0000 0000 1010
	  wait for 20 ns;
	  
	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"00000005"; --5
	  aluop<="010010";--ORcc = 0000 0000 1111
	  wait for 20 ns;
	  
	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="010110";--ORNcc = 
	  wait for 20 ns;
	  
	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000000A"; --10
	  aluop<="010001";--ANDcc = 
	  wait for 20 ns;
	  
	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="010101";--ANDNcc = 
	  wait for 20 ns;
      
	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000000A"; --10
	  aluop<="010011";--XORcc = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="010111";--XORNcc = 
	  wait for 20 ns;
	  
	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000000A"; --10
	  aluop<="111100";--SAVE = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="111101";--RESTOREcc = 
	  wait for 20 ns;
	  
	  	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000000A"; --10
	  aluop<="001000";--ADDX = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="001100";--SUBX = 
	  wait for 20 ns;
	  
	  	  	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000F" ;--15
	  op2<=x"0000000A"; --10
	  aluop<="011000";--ADDXCC = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op1<=x"0000000A" ;--10
	  op2<=x"0000000F"; --15
	  aluop<="011100";--SUBXCC = 
	  wait for 20 ns;




      
      -- insert stimulus here 

      wait;
   end process;

END;
