
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
	
	COMPONENT seu
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux
	PORT(
		i : IN std_logic;
		crs32 : IN std_logic_vector(31 downto 0);
		imm32 : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registerfile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		dwr : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT cu
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT alu
	PORT(
		op1 : IN std_logic_vector(31 downto 0);
		op2 : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	

	
Signal tmpnext : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpnpc : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpsuma : std_logic_vector(31 downto 0):= (others=>'0');
Signal im_sal : std_logic_vector(31 downto 0):= (others=>'0');
Signal im_sal2 : std_logic_vector(31 downto 0):= (others=>'0');
Signal sal_imm : std_logic_vector(31 downto 0):= (others=>'0');
Signal alu_register : std_logic_vector(31 downto 0):= (others=>'0');
Signal register_alu : std_logic_vector(31 downto 0):= (others=>'0');
Signal register_mux : std_logic_vector(31 downto 0):= (others=>'0');
Signal seu_mux : std_logic_vector(31 downto 0):= (others=>'0');
Signal mux_alu : std_logic_vector(31 downto 0):= (others=>'0');

Signal cu_alu : std_logic_vector(5 downto 0):= (others=>'0');


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
		outInstruction => im_sal
	);
	
	Inst_seu: seu PORT MAP(
		imm13 => im_sal(12 downto 0) ,
		salida => seu_mux 
	);
	
	Inst_registerfile: registerfile PORT MAP(
		rs1 => im_sal(18 downto 14),
		rs2 => im_sal(4 downto 0) ,
		rd =>  im_sal(29 downto 25) ,
		dwr => alu_register ,
		rst => reset ,
		crs1 => register_alu ,
		crs2 => register_mux 
	);
	
	Inst_cu: cu PORT MAP(
		op =>im_sal(31 downto 30) ,
		op3 =>im_sal(24 downto 19) ,
		salida => cu_alu
	);
	
	Inst_mux: mux PORT MAP(
		i => im_sal(13),
		crs32 => register_mux,
		imm32 => seu_mux,
		salida => mux_alu
	);
	
	Inst_alu: alu PORT MAP(
		op1 => register_alu,
		op2 => mux_alu,
		aluop => cu_alu,
		salida => alu_register
	);
	
	rOut <= alu_register;
end Behavioral;

