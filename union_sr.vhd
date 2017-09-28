
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity union_sr is
    Port ( reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           rOut : out  STD_LOGIC_VECTOR (31 downto 0));
end union_sr;

architecture Behavioral of union_sr is
	COMPONENT sumador
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT registro
	PORT(
		reset : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;          
		dataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
			address : in  STD_LOGIC_VECTOR (31 downto 0);
         reset : in  STD_LOGIC;
         outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;


Signal tmpnext : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpnpc : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpsuma : std_logic_vector(31 downto 0):= (others=>'0');
Signal im_sal : std_logic_vector(31 downto 0):= (others=>'0');
Signal im_sal2 : std_logic_vector(31 downto 0):= (others=>'0');
begin
	
		
			Inst_registronext: registro PORT MAP(
		reset => reset ,
		dataIn => tmpnext,
		CLK => CLK,
		dataOut => tmpnpc
	);
		
		
		Inst_registro: registro PORT MAP(
		reset => reset,
		dataIn => tmpnpc,
		CLK => CLK,
		dataOut => tmpsuma
	);
	
	
	Inst_sumador: sumador PORT MAP(
		oper1 => X"00000001",
		oper2 => tmpsuma,
		resultado => tmpnext
	);
	
	
	Inst_IM: instructionMemory PORT MAP(
		address => tmpsuma,
		reset => reset,
		outInstruction => im_sal2
	);

	
	rOut <= im_sal2;
end Behavioral;

