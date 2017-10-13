
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sumador is
    Port ( oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is

begin
resultado <= STD_LOGIC_VECTOR(SIGNED(oper1)+SIGNED(oper2));

end Behavioral;

