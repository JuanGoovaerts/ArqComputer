library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
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
			
				when "000010" =>--	OR
					result <= "000010";
					
				when "000100" =>--	Sub
					result <= "000100";
			
				when "000011" =>--	xor
					result <= "000011";
				
				when "000111" => --	xnor
					result <= "000111";
					
				when "000101"=>--Nand
					result<="000101";
				
				when "000110"=>--nor
					result<= "000110";
		-----------------------------------------------------------------
		-----------------------------LOS CC------------------------------
		-----------------------------------------------------------------
		                when "010000" => -- addcc
		                        result <= "010000";
		                when "010100" => -- subcc
		                        result <= "010100";
		                when "010010" => -- orcc
		                        result <= "010010";
		            	when "010110" => -- orncc
		                        result <= "010110";
                        when "010001" => -- andcc
		                        result <= "010001";
		                when "010101" => -- addncc
		                        result <= "010101";
		                when "010011" => -- xorcc
		                        result <= "010011";
		                when "010111" => -- xnorcc
		                        result <= "010111";
		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-----------------------------------------------------------------
				        when "111100" => -- save
		                        result <= "111100";
		                when "111101" => -- restore
		                        result <= "111101";
		-----------------------------------------------------------------
		-----------------------------WITH CARRY--------------------------
		-----------------------------------------------------------------
						when "001000" => -- addx
		                        result <= "001000";
		                when "001100" => -- subx
		                        result <= "001100";
		-----------------------------------------------------------------
		------------------------WITH CARRY AND MODIFY ICC----------------
		-----------------------------------------------------------------
						when "011000" => -- addxcc
		                        result <="011000";
		                when "011100" => -- subxcc
		                        result <= "011100";					
					
					
				when others => result <= "111111";
				end case;
				
				when others => result <= "111111";
		end case;

	end process;
 salida<=result;

end Behavioral;

