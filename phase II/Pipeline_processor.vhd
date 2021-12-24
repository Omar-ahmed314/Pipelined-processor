Library ieee;
use ieee.std_logic_1164.all;

entity Pipeline_processor is
port(clk, reset: in std_logic);

end entity;

architecture arch1 of Pipeline_processor is
component fetch is 
port(
ip_in : in std_logic_vector(19 downto 0);
ip_out: out std_logic_vector(19 downto 0);
instruction : out std_logic_vector(31 downto 0));
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

-- fetch stage signals --
signal fetchStage_ip_instMemory: std_logic_vector(19 downto 0);
signal fetchStage_instMemory_IF_ID: std_logic_vector(31 downto 0);
signal fetchStage_mux_ip: std_logic_vector(19 downto 0);
signal decodeStage_IF_ID_out: std_logic_vector(31 downto 0);

-- decode stage signals --
signal decodeStage_registerFileOut1_ID_IE: std_logic_vector(15 downto 0);
signal decodeStage_registerFileOut2_ID_IE: std_logic_vector(15 downto 0);

-- WB stage signals --
signal writeBackStage_IM_IWB_registerFile_dataAddress: std_logic_vector(2 downto 0);
signal writeBackStage_IM_IWB_registerFile_writeData: std_logic_vector(15 downto 0);

begin

-- fetch stage --
instruction_pointer: DFF generic map(20) port map(fetchStage_mux_ip, clk, reset, '1', fetchStage_ip_instMemory);
fetch_stage: fetch port map(fetchStage_ip_instMemory, fetchStage_mux_ip, fetchStage_instMemory_IF_ID);
if_id: IFID generic map(32) port map('1', clk, reset, fetchStage_instMemory_IF_ID, decodeStage_IF_ID_out);

-- decoding stage --
register_file: registerFile generic map(16) port map(clk, reset, '0', decodeStage_IF_ID_out(26 downto 24), decodeStage_IF_ID_out(23 downto 21), writeBackStage_IM_IWB_registerFile_dataAddress, writeBackStage_IM_IWB_registerFile_writeData,decodeStage_registerFileOut1_ID_IE, decodeStage_registerFileOut2_ID_IE);


end arch1;
