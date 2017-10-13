----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:27 10/05/2017 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( i: in STD_LOGIC;
	        crs32 : in  STD_LOGIC_VECTOR(31 downto 0);
           imm32 : in  STD_LOGIC_VECTOR(31 downto 0);
           salida : out  STD_LOGIC_VECTOR(31 downto 0));
end mux;

architecture Behavioral of mux is

begin
process(crs32,imm32,i) begin
       case(i) is
		      when '0'=>
				salida<=crs32;
				when '1' =>
				salida<=imm32;
				when others => null;
		 end case;		
end process;
end Behavioral;

