----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:52 10/05/2017 
-- Design Name: 
-- Module Name:    cu - Behavioral 
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

entity cu is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end cu;

architecture Behavioral of cu is
signal result : std_logic_vector (5 downto 0) := "000000";
begin
	process(op3,op)
		begin
		case(op) is
		
			when "10" =>
			case op3 is
				when "000000" =>--Add
					result <= "000000";
				
				when "000001" =>--	And
					result <= "000001";
			
				when "000101" =>--	Sub
					result <= "000101";
			
				when "000010" =>--	OR
					result <= "000010";
			
				when "000011" =>--	xor
					result <= "000011";
				
				when "000111"=>--nor
					result<= "000111";
					
				when "000110"=>--Nand
					result<="000110";
					
				when "000100" => --	xnor
					result <= "000100";
					
				when others => result <= "111111";
				end case;
				
				when others => result <= "111111";
		end case;

	end process;
 salida<=result;

end Behavioral;

