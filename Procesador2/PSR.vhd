
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR is
Port (     Clk : in  STD_LOGIC;
			  Rst : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC;
           cwp : out  STD_LOGIC;
           Carry : out  STD_LOGIC); 
end PSR;

architecture Behavioral of PSR is

signal Aux : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
	process(Rst, Clk, NZVC, ncwp)
	begin
		if(Rst = '1') then
			cwp <= '0';
			Carry <= '0';
			Aux <= "0000";
		elsif(rising_edge(Clk)) then
			Aux <= NZVC;
			cwp <= ncwp;
			Carry <= Aux(0);
		end if;
	end process;
 

end Behavioral;

