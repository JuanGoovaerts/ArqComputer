----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:37 10/05/2017 
-- Design Name: 
-- Module Name:    seu - Behavioral 
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

entity seu is
    Port ( imm13 : in  STD_LOGIC_VECTOR(12 downto 0);
           salida : out  STD_LOGIC_VECTOR(31 downto 0));
end seu;
architecture Behavioral of seu is
signal seusalida : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
begin
   process (imm13) begin
	     if (imm13(12)='1')then
		       seusalida(31 downto 13) <= (others => '1');
				 else
				     seusalida(31 downto 13) <=(others => '0');
			    end if;
			seusalida(12 downto 0) <= imm13;
   end process;
   salida <= seusalida;	

end Behavioral;

