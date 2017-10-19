--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:43 10/19/2017
-- Design Name:   
-- Module Name:   C:/Users/Clemencia/Desktop/SEGUNDO/SegundoProcesador/procesador2.vhd
-- Project Name:  SegundoProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: union_sr
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
 
ENTITY procesador2 IS
END procesador2;
 
ARCHITECTURE behavior OF procesador2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT union_sr
    PORT(
         reset : IN  std_logic;
         CLK : IN  std_logic;
         rOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal rOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: union_sr PORT MAP (
          reset => reset,
          CLK => CLK,
          rOut => rOut
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
      reset <= '1';
      wait for 20 ns;
		reset <= '0';
      wait;
   end process;

END;
