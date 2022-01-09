Library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity memoryStage is 

port(
	--memoryEnabled: in std_logic;
=======
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

end entity;

Architecture struct of memoryStage is

COMPONENT ram IS
	PORT(
		
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		isDataMemory: IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0)
		
		);
END COMPONENT;
component clockedram IS
	PORT(
		clk : IN std_logic;
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		isDataMemory: IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0));
END component;

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
signal addressComparison: std_logic_vector(31 downto 0);
signal isException: std_logic;

begin
	

	addedValue <= "11111111111111111111111111111111" when isStack ='1' and isPush ='1' and isException ='0'
           else  "11111111111111111111111111111110" when isFunction ='1' and isPush ='1' and isException ='0'
	   else "00000000000000000000000000000001" when isStack ='1' and isException ='0'
	   else "00000000000000000000000000000010" when isFunction ='1' and isException ='0'
	   else "00000000000000000000000000000000";

	adder: n_bit_full_adder GENERIC MAP(32) PORT MAP(spIn, addedValue, '0', coutsignal, spOutResult);

	we <= '1' when (isPush ='1' or isStore ='1') and isException ='0'
           else  '0';

	addressComparison <= std_logic_vector(65280-(signed(address)));

	isException <= '1' when ((isStack ='1' or isFunction='1') and isPush ='0' and isStore ='0' and spIn = x"000FFFFF") or ((isStack ='0' and isFunction='0') and addressComparison(31) = '1')
			else '0';
	--we <= '0' when isException ='1' or (isPush ='0' and isStore ='0')
		--else '1' when (isPush ='1' or isStore ='1') and isException ='0'
		--else '0';

	addressComparison <= std_logic_vector(65280-(signed(address)));

	isException <= '1' when ((isStack ='1' or isFunction='1') and isPush ='0' and isStore ='0' and spIn = x"000FFFFF") or (((isStack ='0' and isFunction='0') and (isStore='1' or wb='1'))  and addressComparison(31) = '1' )
			else '0';
	
	
	we <= '1' when (isPush ='1' or isStore ='1') and isException ='0'
           else  '0';



	accessAddress <= x"00001" when reset = '1'
		else x"00003" when ((isStack ='1' or isFunction='1') and isPush ='0' and isStore ='0' and spIn = x"000FFFFF")
		else x"00005" when ((isStack ='0' and isFunction='0') and addressComparison(31) = '1')

		else x"00005" when (((isStack ='0' and isFunction='0') and (isStore='1' or wb='1'))  and addressComparison(31) = '1' )

		else spIn(19 downto 0) when isPush ='1'
		else spOutResult(19 downto 0) when (isStack = '1' or isFunction = '1') and isPush = '0'
		else address(19 downto 0);

	isSixteen <= '1' when ((isStack = '1' and isPush = '1') or isStore ='1') and isException ='0'
           else  '0';
	
	datamem: clockedram PORT MAP(clk, we, accessAddress, isSixteen, '1', datain, dataout);

	isExceptionOut <= isException;

	isExceptionOut <= isException;

	spOut <= spOutResult;

		
end Architecture;