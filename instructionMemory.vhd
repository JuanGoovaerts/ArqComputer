----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:39 09/28/2017 
-- Design Name: 
-- Module Name:    instructionMemory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionMemory is
    Port ( 
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));
end instructionMemory;

architecture arqInstructionMemory of instructionMemory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
   signal instructions : rom_type:= (X"A0100010", X"0010000F", X"A010100F", X"A010101A", X"A1110101", X"A110110B",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000E", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010080F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F", X"A010000F",
                             X"A010000F", X"A010000F", X"A010000F", X"A010000F");                        
	
begin

	process(reset,address, instructions)
	begin
		--if(rising_edge(clk))then
			if(reset = '1')then
				outInstruction <= "00000000000000000000000000000000";
			else
				outInstruction <= instructions(conv_integer(address(5 downto 0)));
			end if;
		--end if;
	end process;
end arqInstructionMemory;


