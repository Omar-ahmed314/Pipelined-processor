Library ieee;
use ieee.std_logic_1164.all;

entity memoryStage is 

port(
	--memoryEnabled: in std_logic;
	isStack: in std_logic;
	isStore: in std_logic;
	isPush: in std_logic;
	isFunction: in std_logic;
	spIn: in std_logic_vector(31 downto 0);
	address: in std_logic_vector(31 downto 0);
	datain: in std_logic_vector (31 downto 0);
	dataout: out std_logic_vector (31 downto 0);
	spOut: out std_logic_vector (31 downto 0)
);

end entity;

Architecture struct of memoryStage is

COMPONENT ram IS
	PORT(
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0)
);
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

signal we : std_logic;
signal isSixteen : std_logic;
signal spOutResult: std_logic_vector(31 downto 0);
signal coutsignal: std_logic;
signal addedValue: std_logic_vector(31 downto 0);
signal accessAddress: std_logic_vector(19 downto 0);
signal dataReadOut: std_logic_vector(31 downto 0);

begin
	

	addedValue <= "11111111111111111111111111111111" when isStack ='1' and isPush ='1'
           else  "11111111111111111111111111111110" when isFunction ='1' and isPush ='1'
	   else "00000000000000000000000000000001" when isStack ='1'
	   else "00000000000000000000000000000010" when isFunction ='1'
	   else "00000000000000000000000000000000";

	adder: n_bit_full_adder GENERIC MAP(32) PORT MAP(spIn, addedValue, '0', coutsignal, spOutResult);

	we <= '1' when isPush ='1' or isStore ='1'
           else  '0';

	accessAddress <= spIn(19 downto 0) when isPush ='1'
		else spOutResult(19 downto 0) when (isStack = '1' or isFunction = '1') and isPush = '0'
		else address(19 downto 0);

	isSixteen <= '1' when (isStack = '1' and isPush = '1') or isStore ='1'
           else  '0';
	
	datamem: ram PORT MAP(we, accessAddress, isSixteen, datain, dataout);

	spOut <= spOutResult;

		
end Architecture;