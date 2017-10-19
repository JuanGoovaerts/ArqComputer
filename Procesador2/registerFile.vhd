library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity registerfile is
    Port ( rs1 : in  STD_LOGIC_VECTOR(5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR(5 downto 0);
           rd : in  STD_LOGIC_VECTOR(5 downto 0);
           dwr : in  STD_LOGIC_VECTOR(31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR(31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR(31 downto 0));
end registerfile;

architecture Behavioral of registerfile is
type ram is array(39 downto 0) of std_logic_vector(31 downto 0);
signal registers : ram := (others => "00000000000000000000000000000000");

begin

	process(rst, rs1, rs2, rd, dwr)
	begin
		if(rst = '1') then
			registers <= (others => "00000000000000000000000000000000");
			crs1 <= (others => '0');
			crs2 <= (others => '0');
		else
			if(rd /= "00000") then
				registers(conv_integer(rd)) <= dwr;
			end if;
			crs1 <= registers(conv_integer(rs1));
			crs2 <= registers(conv_integer(rs2)); 
		end if;
	end process;


end Behavioral;
