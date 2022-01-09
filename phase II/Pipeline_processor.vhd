-- /*========= /// <===> Import libraries <===> /// ==========*/ --
Library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity OF Pipeline Processor <===> /// ==========*/ --
entity Pipeline_processor is
	port(
		clk, reset: in std_logic;
		inputData: in std_logic_vector(15 downto 0);
		outputData: out std_logic_vector(15 downto 0)
		);
end entity;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture OF Pipeline Processor <===> /// ==========*/ --
architecture arch1 of Pipeline_processor is


-- /*========= /// <===> Components OF Pipeline Processor <===> /// ==========*/ --
component fetch is 
	
port(
ip_in : in std_logic_vector(19 downto 0);
jumpinstSel: in std_logic;
jumpinst: in std_logic_vector(19 downto 0);
ip_out: out std_logic_vector(19 downto 0);
instruction : out std_logic_vector(31 downto 0);
hazard_detect: in std_logic);

end component;

component DFF IS 
GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END component;

component NDFF IS 

GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END component;

COMPONENT resetRegister IS 

GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			resetvalue: IN std_logic_vector(n-1 downto 0);
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END COMPONENT;

component IFID is
GENERIC ( n : INTEGER := 32 );
	port( 
		we, clk, reset, flush: in std_logic;
		ip_in: in std_logic_vector(15 downto 0);
		instr: in std_logic_vector(n-1 downto 0); 
		output: out std_logic_vector(n - 1 downto 0);
		ip_out: out std_logic_vector(15 downto 0)
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
		is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN, NO_OP, setC, inEN, outEN: out std_logic;
		alu_selection: out std_logic_vector(3 downto 0);
		isStack, isPush, isStore, isFunction: out std_logic;
		zFlag, nFlag, cFlag: out std_logic
		);
end component;

component IDEX is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 32 );

	port(
		bufferEn2, clk,reset,flush: in std_logic;
		ip_in: in std_logic_vector(15 downto 0);
		opcode_in: std_logic_vector(4 downto 0);
		Rs, Rt: in std_logic_vector(n-1 downto 0);
		Rd_address: in std_logic_vector(2 downto 0);
		Rs_address, Rt_address: in std_logic_vector(2 downto 0);
		control_signls: in std_logic_vector(18 downto 0);
		imm_value: in std_logic_vector(15 downto 0);
		zf,nf,cf: in std_logic;
		output: out std_logic_vector(69 downto 0);
		zfOut, nfOut, cfOut: out std_logic;
		opcode_out: out std_logic_vector(4 downto 0);
		ip_out: out std_logic_vector(15 downto 0);
		Rs_address_out, Rt_address_out: out std_logic_vector(2 downto 0)
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
		we, clk, reset, flush: in std_logic;
		alu_data: in std_logic_vector(n-1 downto 0); 
		mem_data: in std_logic_vector(n-1 downto 0); 
		dest_address:in std_logic_vector(2 downto 0);
		isMemory: in std_logic;
		controlSignals: in std_logic_vector(18 downto 0);
		output: out std_logic_vector(54 downto 0)
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
		wb_enable_out: out std_logic);

end component;

component flags is
generic(n : integer := 16);
Port (
alu_o : in  STD_LOGIC_VECTOR (n - 1 downto 0);
alu_cout : in STD_LOGIC;
CCR_I: in std_logic_vector(2 downto 0);
CCR_O: out std_logic_vector(2 downto 0)
);
end component;

component EXMEM is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 16 );

	port( 
		we, clk, reset: in std_logic;
		rsrc1: in std_logic_vector(15 downto 0);
		alu_data: in std_logic_vector(n-1 downto 0);
		dest_address:in std_logic_vector(2 downto 0);
		controlSignals: in std_logic_vector(18 downto 0);
		output: out std_logic_vector(53 downto 0)
		);
end component;

component memoryStage is
port(
	clk : IN std_logic;
	wb : IN std_logic;
	reset: in std_logic;
	isStack: in std_logic;
	isPush: in std_logic;
	isStore: in std_logic;
	isFunction: in std_logic;
	spIn: in std_logic_vector(31 downto 0);
	address: in std_logic_vector(31 downto 0);
	datain: in std_logic_vector (31 downto 0);
	dataout: out std_logic_vector (31 downto 0);
	spOut: out std_logic_vector (31 downto 0);
	isExceptionOut: OUT std_logic
);

end component;

component DFF_oneBit IS 

	PORT( 
			d: in std_logic;
			clk,reset,en : IN std_logic;
			q : OUT std_logic
		);
END component;

component hazard_detection is
Port (
opcode: in std_logic_vector(4 downto 0);
IDEX_Out: in std_logic_vector(69 downto 0);
IFID_Out: in std_logic_vector(31 downto 0);
hazard_detect: out std_logic
);
end component;

component forward_unit is
port(	clk: std_logic;
 rSrc1, rSrc2, rDstAlu, rDstMem: in std_logic_vector(2 downto 0);
	alu_wb_ctrl, mem_wb_ctrl:	in std_logic;
	select1, select2: 		out std_logic_vector(1 downto 0));
end component;

-- /*=== End ====*/ --
signal flush: std_logic;
-- fetch stage signals --
signal fetchStage_ip_instMemory: std_logic_vector(19 downto 0);
signal flush_ifid: std_logic;
signal fetchStage_instMemory_IF_ID: std_logic_vector(31 downto 0);
signal fetchStage_mux_ip: std_logic_vector(19 downto 0);
signal decodeStage_IF_ID_out: std_logic_vector(31 downto 0);
signal jump_execute : std_logic;
signal jmpinst: std_logic_vector(19 downto 0);
signal IF_ID_Out_IP: std_logic_vector(15 downto 0);

-- decode stage signals --
signal decodeStage_registerFileOut1_ID_IE: std_logic_vector(15 downto 0);
signal decodeStage_registerFileOut2_ID_IE: std_logic_vector(15 downto 0);
signal hazardDetect: std_logic;
signal controlSignals: std_logic_vector(18 downto 0);
signal IDEX_Out: std_logic_vector(69 downto 0);
signal flush_idex: std_logic;
signal decode_execute_source2: std_logic_vector(15 downto 0);
signal conrtol_zero_flag_out, conrtol_negative_flag_out, conrtol_carry_flag_out: std_logic;
signal hazard_detect: std_logic;
signal not_hazard_detect: std_logic;
signal decode_muxOfControlAndHazardUnit_IDIX: std_logic_vector(18 downto 0);

-- ALU stage --
signal ALU_out: std_logic_vector(15 downto 0);
signal ALU_cout: std_logic;
signal zero_enable: std_logic;
signal carry_enable: std_logic;
signal negative_enable: std_logic;
signal CCR: std_logic_vector(2 downto 0);
signal alu_data_from_input: std_logic_vector(15 downto 0);
signal execution_stage_output: std_logic_vector(15 downto 0);
signal ALU_input1: std_logic_vector(15 downto 0);
signal ALU_input2: std_logic_vector(15 downto 0);
signal CRR_Out: std_logic_vector(2 downto 0);
signal carry_signal: std_logic;
signal opcode_execution: std_logic_vector(4 downto 0);
signal branch_address: std_logic_vector(15 downto 0);
signal execute_branch: std_logic;
signal ID_EX_IP_Out: std_logic_vector(15 downto 0);
signal forward_mux_alu_input1: std_logic_vector(15 downto 0);
signal forward_mux_alu_input2: std_logic_vector(15 downto 0);
signal Rsrc1_address: std_logic_vector(2 downto 0);
signal Rsrc2_address: std_logic_vector(2 downto 0);
signal forward_mux_selection1: std_logic_vector(1 downto 0);
signal forward_mux_selection2: std_logic_vector(1 downto 0);

signal CCR_Temp: std_logic_vector(2 downto 0);
signal enable_flags_temp: std_logic_vector(2 downto 0);

signal jump_execute_ex : std_logic;
signal jmpinst_ex: std_logic_vector(19 downto 0);
-- MEM stage -- 
signal stackPointer_Mem_Input : std_logic_vector(31 downto 0);
signal stackPointer_Output_Mem: std_logic_vector(31 downto 0);
signal memorydataoutput: std_logic_vector(31 downto 0);
signal EXMEM_Out: std_logic_vector(53 downto 0);
signal datain_memory: std_logic_vector(31 downto 0);
signal addressin_memory: std_logic_vector(31 downto 0);
signal ex_mem_data_in: std_logic_vector(15 downto 0);
signal isException_out: std_logic;

signal jump_execute_mem : std_logic;
signal jmpinst_mem: std_logic_vector(19 downto 0);

signal memoryFlush: std_logic;

-- WB stage signals --
signal MEM_WB_OUT: std_logic_vector(54 downto 0);
signal writeBackStage_IM_IWB_registerFile_dataAddress: std_logic_vector(2 downto 0);
signal writeBackStage_IM_IWB_registerFile_writeData: std_logic_vector(15 downto 0);
signal wb_enable: std_logic;


begin

--wb_enable <= '0';
--jumpinstruction <= '0';
flush_ifid <= '0' when IDEX_Out(50 downto 32) = "0000000000000000000"
		else jump_execute;
flush_idex <= jump_execute_mem;
-- fetch stage --

instruction_pointer: resetRegister generic map(20) port map(fetchStage_mux_ip, clk, reset, '1',memorydataoutput(19 downto 0), fetchStage_ip_instMemory);
fetch_stage: fetch port map(fetchStage_ip_instMemory, jump_execute, jmpinst, fetchStage_mux_ip, fetchStage_instMemory_IF_ID, hazard_detect);
if_id: IFID generic map(32) port map(not_hazard_detect, clk, reset, flush_ifid,fetchStage_ip_instMemory(15 downto 0), fetchStage_instMemory_IF_ID, decodeStage_IF_ID_out, IF_ID_Out_IP);
not_hazard_detect <= not hazard_detect;
-- decoding stage --
hazardDetect <= '0';

register_file: registerFile generic map(16) port map(clk, reset, wb_enable, decodeStage_IF_ID_out(26 downto 24), decodeStage_IF_ID_out(23 downto 21), writeBackStage_IM_IWB_registerFile_dataAddress, writeBackStage_IM_IWB_registerFile_writeData,decodeStage_registerFileOut1_ID_IE, decodeStage_registerFileOut2_ID_IE);
controlU : controlUnit generic map(16) port map(hazardDetect, decodeStage_IF_ID_out(31 downto 27),controlSignals(0),controlSignals(1),controlSignals(2),controlSignals(3),controlSignals(4),controlSignals(5),controlSignals(6),controlSignals(7),controlSignals(8),controlSignals(9),controlSignals(10),controlSignals(14 downto 11), controlSignals(15),controlSignals(16),controlSignals(17),controlSignals(18),conrtol_zero_flag_out,conrtol_negative_flag_out,conrtol_carry_flag_out);

--decode_execute_source2 <= decodeStage_registerFileOut2_ID_IE when controlSignals(2) = '0'
--	else decodeStage_IF_ID_out(17 downto 2);

id_ex: IDEX generic map(16) port map('1', clk, reset, flush_idex, IF_ID_Out_IP, decodeStage_IF_ID_out(31 downto 27), decodeStage_registerFileOut1_ID_IE,decodeStage_registerFileOut2_ID_IE, decodeStage_IF_ID_out(20 downto 18), decodeStage_IF_ID_out(26 downto 24), decodeStage_IF_ID_out(23 downto 21), decode_muxOfControlAndHazardUnit_IDIX, decodeStage_IF_ID_out(17 downto 2),conrtol_zero_flag_out,conrtol_negative_flag_out,conrtol_carry_flag_out, IDEX_Out,zero_enable, negative_enable,carry_enable , opcode_execution, ID_EX_IP_Out, Rsrc1_address, Rsrc2_address);
hd: hazard_detection port map(opcode_execution, IDEX_Out, decodeStage_IF_ID_out, hazard_detect);
decode_muxOfControlAndHazardUnit_IDIX <= controlSignals when hazard_detect = '0'
	else (Others => '0');


------------------------- EXECUTION stage ---------------------
ALU_input2 <= IDEX_Out(15 downto 0) when IDEX_Out(34) = '0' --immediate value in operand 2 if it is used
	   else IDEX_Out(69 downto 54);
ALU_input1 <= IDEX_Out(15 downto 0) when IDEX_Out(49) = '1' ---for store instruction: src2 is in operand1 to be added with offset in operand 2
	   else IDEX_Out(31 downto 16);

forward_mux_alu_input1 <= EXMEM_Out(37 downto 22) when forward_mux_selection2 = "01" and IDEX_Out(49) = '1'
	else writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection2 = "10" and IDEX_Out(49) = '1'
	else EXMEM_Out(37 downto 22) when forward_mux_selection1 = "01"
	else writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection1 = "10"
	else ALU_input1;

forward_mux_alu_input2 <= EXMEM_Out(37 downto 22) when forward_mux_selection2 = "01" and IDEX_Out(49) = '0'
	else writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection2 = "10" and IDEX_Out(49) = '0'
	else ALU_input2;

forwardUnit : forward_unit port map(clk,Rsrc1_address, Rsrc2_address, EXMEM_Out(21 downto 19), writeBackStage_IM_IWB_registerFile_dataAddress, EXMEM_Out(4), wb_enable, forward_mux_selection1, forward_mux_selection2);
ALSU_Stage : ALSU generic map(16) port map(forward_mux_alu_input1, forward_mux_alu_input2, IDEX_Out(46 downto 43),ALU_out,ALU_cout,'0');
carry_signal <= '1' when IDEX_out(40) = '1'
		else ALU_cout;
flags_stage : flags generic map(16) port map(ALU_out, carry_signal,CRR_Out, CCR);

-- ALU Flags

CCR_Temp(0) <= '0' when opcode_execution = "11000" and jump_execute_ex ='1'
		else CCR(0);

CCR_Temp(1) <= '0' when opcode_execution = "11001" and jump_execute_ex ='1'
		else CCR(1);

CCR_Temp(2) <= '0' when opcode_execution = "11010" and jump_execute_ex ='1'
		else CCR(2);

enable_flags_temp(0) <= '1' when opcode_execution = "11000" and jump_execute_ex ='1'
		else zero_enable;


enable_flags_temp(1) <= '1' when opcode_execution = "11001" and jump_execute_ex ='1'
		else negative_enable;


enable_flags_temp(2) <= '1' when opcode_execution = "11010" and jump_execute_ex ='1'
		else carry_enable;

zeroFlag: DFF_oneBit port map(CCR_Temp(0), clk, reset, enable_flags_temp(0), CRR_Out(0));
negativeFlag: DFF_oneBit port map(CCR_Temp(1), clk, reset, enable_flags_temp(1), CRR_Out(1));
carryFlag: DFF_oneBit port map(CCR_Temp(2), clk, reset, enable_flags_temp(2), CRR_Out(2));
-- End

execution_stage_output <= inputData when IDEX_Out(41) = '1'
	else ALU_out;
outputData <= EXMEM_Out(37 downto 22) when forward_mux_selection1 = "01" and IDEX_Out(42) = '1' 
	else writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection1 = "10" and IDEX_Out(42) = '1'
	else IDEX_Out(31 downto 16) when IDEX_Out(42) = '1'
	else (others => 'Z');
---- branching -----
jmpinst_ex <=  "0000"&EXMEM_Out(37 downto 22) when forward_mux_selection1 = "01" 
	else "0000"&writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection1 = "10"
	else "0000"&IDEX_Out(31 downto 16);

jump_execute_ex <= '1' when (opcode_execution = "11000" and CRR_Out(0) = '1') or (opcode_execution = "11001" and CRR_Out(1) = '1') or (opcode_execution = "11010" and CRR_Out(2) = '1') or (opcode_execution = "11011") or (opcode_execution = "11100") or (opcode_execution="11110")
		else '0'; 		

----- branching end ----
ex_mem_data_in <= std_logic_vector((unsigned(ID_EX_IP_Out))+1) when opcode_execution = "11100" or opcode_execution="11110"
		else EXMEM_Out(37 downto 22) when forward_mux_selection1 = "01"
		else writeBackStage_IM_IWB_registerFile_writeData when forward_mux_selection1 = "10" 
		else IDEX_Out(31 downto 16);


------------------------- EXECutION stage END ---------------------
ex_mem: EXMEM port map('1', clk, reset, ex_mem_data_in, execution_stage_output, IDEX_Out(53 downto 51), IDEX_Out(50 downto 32), EXMEM_Out);
-- mem stage --
stack_pointer: resetRegister generic map(32) port map(stackPointer_Mem_Input, clk, reset, '1', x"000fffff",stackPointer_Output_Mem); ---change stack pointer reset address

datain_memory <= x"0000" & EXMEM_Out(53 downto 38);
addressin_memory <= x"0000" & EXMEM_Out(37 downto 22);

Mem_stage: memoryStage port map(clk, EXMEM_Out(5),reset,EXMEM_Out(15),EXMEM_Out(16),EXMEM_Out(17),EXMEM_Out(18), stackPointer_Output_Mem, addressin_memory , datain_memory,  memorydataoutput, stackPointer_Mem_Input, isException_Out); 

---return---
jmpinst_mem <= memorydataoutput(19 downto 0);
jump_execute_mem <= '1' when isException_Out ='1' or (EXMEM_Out(15)='0' and EXMEM_Out(16)='0' and EXMEM_Out(17)='0' and EXMEM_Out(18) ='1')
			else '0';

jmpinst <= jmpinst_mem when jump_execute_mem = '1'
	else jmpinst_ex;

jump_execute <= '0' when IDEX_Out(50 downto 32) = "0000000000000000000" and jump_execute_mem = '0'
		else jump_execute_mem when jump_execute_mem = '1'
		else jump_execute_ex;
---end return---
memoryFlush <= isException_Out;
		
mem_wb : MEMWB generic map(16) port map('1', clk, memoryFlush, reset, EXMEM_Out(37 downto 22), memorydataoutput(15 downto 0), EXMEM_Out(21 downto 19), EXMEM_Out(5), EXMEM_Out(18 downto 0), MEM_WB_OUT);

-- WB stage --
wb_Stage : writeback port map(MEM_WB_OUT(50 downto 36),MEM_WB_OUT(35 downto 20), MEM_WB_OUT(19 downto 4), MEM_WB_OUT(3 downto 1), MEM_WB_OUT(0), writeBackStage_IM_IWB_registerFile_dataAddress, writeBackStage_IM_IWB_registerFile_writeData, wb_enable );


end arch1;
-- /*=== End ====*/ --
