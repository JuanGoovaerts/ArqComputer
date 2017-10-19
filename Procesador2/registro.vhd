
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity registro is
    Port ( reset : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end registro;

architecture Behavioral of registro is

begin
		
		process(CLK, reset, dataIn)
		begin
				if(reset = '1') then
					dataOut <= (others => '0');
				elsif(rising_edge(CLK)) then
					dataOut <= dataIn;
				end if;
		end process;
						


end Behavioral;

