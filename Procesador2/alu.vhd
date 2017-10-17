
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity alu is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           carry: in STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is
signal result : std_logic_vector (31 downto 0) := x"00000000";
begin 
process (op1,op2,carry,aluop)
begin
		case (aluop) is
		----------------------------------------------------------------
		-----------------------PRIMER PROCESADOR------------------------
		----------------------------------------------------------------
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

		-----------------------------------------------------------------
		-----------------------------LOS CC------------------------------
		-----------------------------------------------------------------
		                when "010000" => -- addcc
		                        result <= op1 + op2;
		                when "010100" => -- subcc
		                        result <= op1 - op2;
		                when "010010" => -- orcc
		                        result <= op1 or op2;
		            	when "010110" => -- orncc
		                        result <= op1 or not op2;
                        when "010001" => -- andcc
		                        result <= op1 and op2;
		                when "010101" => -- addncc
		                        result <= op1 and not op2;
		                when "010011" => -- xorcc
		                        result <= op1 xor op2;
		                when "010111" => -- xnorcc
		                        result <= op1 xnor op2;
		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-----------------------------------------------------------------
				        when "111100" => -- save
		                        result <= op1 + op2;
		                when "111101" => -- restore
		                        result <= op1 + op2;
		-----------------------------------------------------------------
		-----------------------------WITH CARRY--------------------------
		-----------------------------------------------------------------
						when "001000" => -- addx
		                        result <= op1 + op2 + carry;
		                when "001100" => -- subx
		                        result <= op1 - op2 - carry;
		-----------------------------------------------------------------
		------------------------WITH CARRY AND MODIFY ICC----------------
		-----------------------------------------------------------------
						when "011000" => -- addxcc
		                        result <= op1 + op2 + carry;
		                when "011100" => -- subxcc
		                        result <= op1 - op2 - carry;

					    	when others => --nops
				          result<= x"00000000";
		end case;	
end process; 
salida<= result;

end Behavioral;

