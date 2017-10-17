--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:29 10/15/2017
-- Design Name:   
-- Module Name:   C:/Users/Clemencia/Desktop/SEGUNDO/SegundoProcesador/tb_cu.vhd
-- Project Name:  SegundoProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cu
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
     op<="10";
	  op3<="010000";--ADDCC = 
	  wait for 20 ns;
	  
	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010100";--SUBCC = 0000 0000 1010
	  wait for 20 ns;
	  
	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010010";--ORcc = 0000 0000 1111
	  wait for 20 ns;
	  
	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010110";--ORNcc = 
	  wait for 20 ns;
	  
	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010001";--ANDcc = 
	  wait for 20 ns;
	  
	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010101";--ANDNcc = 
	  wait for 20 ns;
      
	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010011";--XORcc = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="010111";--XORNcc = 
	  wait for 20 ns;
	  
	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="111100";--SAVE = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="111101";--RESTOREcc = 
	  wait for 20 ns;
	  
	  	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="001000";--ADDX = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="001100";--SUBX = 
	  wait for 20 ns;
	  
	  	  	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="011000";--ADDXCC = 
	  wait for 20 ns;

	  	  	  	  	  -- hold reset state for 100 ns.
     op<="10";
	  op3<="011100";--SUBXCC = 
	  wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
