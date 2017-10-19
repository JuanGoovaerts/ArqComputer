library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity PSRModi is
Port (     Rst : in STD_LOGIC;
			  crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           SalidaMux : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));

end PSRModi;

architecture Behavioral of PSRModi is
begin
	process(crs1, SalidaMux, AluOp, AluResult)
	begin
		if(Rst = '1') then
			NZVC <= "0000";
		end if;
		--ADDcc y ADDXcc
		if(AluOp = "010000" or AluOp = "011000") then
			NZVC(3) <= AluResult(31);
		if(AluResult = "00000000000000000000000000000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (crs1(31) and SalidaMux(31) and not(AluResult(31))) or (not(crs1(31)) and not(SalidaMux(31)) and AluResult(31));
			NZVC(0) <= (crs1(31) and SalidaMux(31)) or (not(AluResult(31)) and (crs1(31) or SalidaMux(31)));
		end if;
		
		--SUBcc y SUBXcc
		if(AluOp = "010100" or AluOp = "011100") then
			NZVC(3) <= AluResult(31);
			if(AluResult = "00000000000000000000000000000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (crs1(31) and not(SalidaMux(31)) and not(AluResult(31))) or (not(crs1(31)) and SalidaMux(31) and AluResult(31));
			NZVC(0) <= (not(crs1(31)) and SalidaMux(31)) or (AluResult(31) and (not(crs1(31)) or SalidaMux(31)));
		end if;
		
		--ANDcc, ANDNcc, ORcc, ORNcc, XORcc, XNORcc 
		if(AluOp = "010001" or AluOp = "010101" or AluOp = "010010" or AluOp = "010110" or 
			AluOp = "010011" or AluOp = "010111") then
			NZVC(3) <= AluResult(31);
			if(AluResult = "00000000000000000000000000000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		end if;
	end process;


end Behavioral;

