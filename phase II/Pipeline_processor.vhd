-- /*========= /// <===> Import libraries <===> /// ==========*/ --
Library ieee;
use ieee.std_logic_1164.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity OF Pipeline Processor <===> /// ==========*/ --
entity Pipeline_processor is
	port(
		clk, reset: in std_logic
		);
end entity;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture OF Pipeline Processor <===> /// ==========*/ --
architecture arch1 of Pipeline_processor is


-- /*========= /// <===> Components OF Pipeline Processor <===> /// ==========*/ --
component fetch is 
	port(
		ip_in : in std_logic_vector(19 downto 0);
		ip_out: out std_logic_vector(19 downto 0);
		instruction : out std_logic_vector(31 downto 0)
	);
end component;

component DFF IS 
GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END component;

component IFID is
GENERIC ( n : INTEGER := 32 );
	port(
		we, clk, reset: in std_logic;
		instr: in std_logic_vector(n-1 downto 0); 
		output: out std_logic_vector(n - 1 downto 0)
	);
end component;

component registerFile is
GENERIC ( n : INTEGER := 32 );
	port(
		clk, rst, writeEn: in std_logic;
		src1, src2, dest: in std_logic_vector(2 downto 0);
		writeVal: in std_logic_vector(15 downto 0);
		out1, out2: out std_logic_vector(15 downto 0)
	);
end component;

component controlUnit is
GENERIC ( n : INTEGER := 32 );

	port(
		hazard_detected: in std_logic;
		opCode: in std_logic_vector(4 downto 0);
		brachEn, flagChange: out std_logic;
		is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN,NO_OP, setC, inEN, outEN: out std_logic;
		alu_selection: out std_logic_vector(3 downto 0)
	);
end component;

component IDEX is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 32 );

	port(
		bufferEn2, clk,reset: in std_logic;
		Rs, Rt: in std_logic_vector(n-1 downto 0);
		Rd_address: in std_logic_vector(2 downto 0);
		control_signls: in std_logic_vector(14 downto 0);
		output: out std_logic_vector(49 downto 0)
	);
end component;

component ALSU is
generic(n: integer:= 16);
	port(
		a : in std_logic_vector(n-1 downto 0);
		b : in std_logic_vector(n-1 downto 0);
		--Cin : in std_logic;
		S : in std_logic_vector(3 downto 0);

		f_alu : out std_logic_vector(n-1 downto 0);
		coutALU : out std_logic;
		no_operation: in std_logic
	);
end component;

component MEMWB is
GENERIC ( n : INTEGER := 16 );

	port( 
		we, clk, reset: in std_logic;
		alu_data: in std_logic_vector(n-1 downto 0); 
		mem_data: in std_logic_vector(n-1 downto 0); 
		dest_address:in std_logic_vector(2 downto 0);
		isMemory: in std_logic;
		controlSignals: in std_logic_vector(14 downto 0);
		output: out std_logic_vector(50 downto 0)
	);
end component;

component writeback is 

	port(
		controlSignals: in std_logic_vector(14 downto 0);
		dataAlu : in std_logic_vector(15 downto 0);
		dataMemory : in std_logic_vector(15 downto 0);
		reg_address: in std_logic_vector(2 downto 0);
		isMemory: in std_logic;
		address_out: out std_logic_vector(2 downto 0);
		outdata: out std_logic_vector(15 downto 0);
		wb_enable_out: out std_logic
	);

end component;
-- /*=== End ====*/ --

-- fetch stage signals --
signal fetchStage_ip_instMemory: std_logic_vector(19 downto 0);
signal fetchStage_instMemory_IF_ID: std_logic_vector(31 downto 0);
signal fetchStage_mux_ip: std_logic_vector(19 downto 0);
signal decodeStage_IF_ID_out: std_logic_vector(31 downto 0);

-- decode stage signals --
signal decodeStage_registerFileOut1_ID_IE: std_logic_vector(15 downto 0);
signal decodeStage_registerFileOut2_ID_IE: std_logic_vector(15 downto 0);
signal hazardDetect: std_logic;
signal controlSignals: std_logic_vector(14 downto 0);
signal IDEX_Out: std_logic_vector(49 downto 0);

-- ALU stage --
signal ALU_out: std_logic_vector(15 downto 0);
signal ALU_cout: std_logic;

-- WB stage signals --
signal MEM_WB_OUT: std_logic_vector(50 downto 0);
signal writeBackStage_IM_IWB_registerFile_dataAddress: std_logic_vector(2 downto 0);
signal writeBackStage_IM_IWB_registerFile_writeData: std_logic_vector(15 downto 0);
signal wb_enable: std_logic;


begin

--wb_enable <= '0';

-- fetch stage --
instruction_pointer: DFF generic map(20) port map(fetchStage_mux_ip, clk, reset, '1', fetchStage_ip_instMemory);
fetch_stage: fetch port map(fetchStage_ip_instMemory, fetchStage_mux_ip, fetchStage_instMemory_IF_ID);
if_id: IFID generic map(32) port map('1', clk, reset, fetchStage_instMemory_IF_ID, decodeStage_IF_ID_out);

-- decoding stage --
hazardDetect <= '0';

register_file: registerFile generic map(16) port map(clk, reset, wb_enable, decodeStage_IF_ID_out(26 downto 24), decodeStage_IF_ID_out(23 downto 21), writeBackStage_IM_IWB_registerFile_dataAddress, writeBackStage_IM_IWB_registerFile_writeData,decodeStage_registerFileOut1_ID_IE, decodeStage_registerFileOut2_ID_IE);
controlU : controlUnit generic map(16) port map(hazardDetect, decodeStage_IF_ID_out(31 downto 27),controlSignals(0),controlSignals(1),controlSignals(2),controlSignals(3),controlSignals(4),controlSignals(5),controlSignals(6),controlSignals(7),controlSignals(8),controlSignals(9),controlSignals(10),controlSignals(14 downto 11));
id_ex: IDEX generic map(16) port map('1', clk, reset,decodeStage_registerFileOut1_ID_IE,decodeStage_registerFileOut2_ID_IE, decodeStage_IF_ID_out(26 downto 24), controlSignals, IDEX_Out);

-- ALU stage --
ALSU_Stage : ALSU generic map(16) port map(IDEX_Out(15 downto 0), IDEX_Out(31 downto 16), IDEX_Out(46 downto 43),ALU_out,ALU_cout,'0');
mem_wb : MEMWB generic map(16) port map('1', clk, reset, ALU_out, "1010101010101010", IDEX_Out(49 downto 47), '0', IDEX_Out(46 downto 32), MEM_WB_OUT  );
-- mem stage
-- WB stage
wb_Stage : writeback port map(MEM_WB_OUT(50 downto 36),MEM_WB_OUT(35 downto 20), MEM_WB_OUT(19 downto 4), MEM_WB_OUT(3 downto 1), MEM_WB_OUT(0), writeBackStage_IM_IWB_registerFile_dataAddress, writeBackStage_IM_IWB_registerFile_writeData, wb_enable );


end arch1;
-- /*=== End ====*/ --
