Library ieee;
use ieee.std_logic_1164.all;

entity fetch is 

port(
ip_in : in std_logic_vector(19 downto 0);
jumpinstSel: in std_logic;
jumpinst: in std_logic_vector(19 downto 0);
ip_out: out std_logic_vector(19 downto 0);
instruction : out std_logic_vector(31 downto 0);
hazard_detect: in std_logic);

end entity;

Architecture struct of fetch is

COMPONENT ram IS
	PORT(
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		isDataMemory: IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT n_bit_full_adder is
generic(n: integer:= 8);
port(
a, b: in std_logic_vector(n-1 downto 0);
cin: in std_logic;

cout: out std_logic;
s: out std_logic_vector(n-1 downto 0)
);

END COMPONENT;

COMPONENT fetchaddedvalue is 

port(
opcode : in std_logic_vector(4 downto 0);
hazard_detect: in std_logic;
addedvalue : out std_logic_vector(19 downto 0));

end COMPONENT;

signal previnstruction : std_logic_vector(31 downto 0);
signal temp : std_logic_vector(31 downto 0);
signal tempadder : std_logic_vector(19 downto 0);
signal couttemp : std_logic;
signal addedvalue: std_logic_vector(19 downto 0);
signal instructionread: std_logic_vector(31 downto 0);
begin
	
	inmem: ram PORT MAP('0', ip_in, '0', '0',temp, instructionread);
	instruction <= instructionread;
	v: fetchaddedvalue PORT MAP(instructionread(31 downto 27), hazard_detect, addedvalue);
	a: n_bit_full_adder GENERIC MAP(20) PORT MAP(ip_in,addedvalue, '0', couttemp, tempadder);
	
	
	--ip_out<=tempadder;

	--with jumpinstSel select 
	ip_out <= tempadder when jumpinstSel = '0'
    		 else jumpinst;

    		 
		
end Architecture;