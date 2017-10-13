----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:12 10/05/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is
signal result : std_logic_vector (31 downto 0) := x"00000000";
begin 
process (op1,op2,aluop)
begin
		case (aluop) is
                  when "000000" => -- add 
								result <= op1 + op2;
                  when "000001" =>--AND
								result <= op1 and op2;
						when "000010" =>--OR
								result <= op1 or op2;
						when  "000100"=>--Sub
								result<=op1-op2;
						when "000011" => --XOR
								result <= op1 xor op2;
						when "000111" => --XNOR
								result <= op1 xnor op2;
						when "000101"=>--Nand
								result<=op1 and not (op2);
						when "000110"=>--NOR
								result<= op1 or not op2;
						
					
				    	when others => --nops
				          result<= x"00000000";
	
		end case;	
end process; 
salida<= result;

end Behavioral;

