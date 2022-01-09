LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY clockedram IS
	PORT(
		clk : IN std_logic;
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		isDataMemory: IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY clockedram;


ARCHITECTURE syncrama OF clockedram IS

	TYPE ram_type IS ARRAY(0 TO 1048575) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type;
signal temp: std_logic_vector(19 downto 0);
	
	BEGIN
		PROCESS(clk, we,isSixteen,datain,address) IS
			BEGIN
					IF (falling_edge(clk) and we = '1') THEN
						ram(to_integer(unsigned(address))) <= datain(15 downto 0);
						IF isSixteen = '0' THEN
							ram(to_integer(unsigned(address))-1) <= datain(31 downto 16);
						END IF;
					END IF;
		END PROCESS;
		dataout(31 downto 16) <= (others => 'Z') when address = x"00000" and isDataMemory ='1'
					else ram(to_integer(unsigned(address)))  when isDataMemory ='0'
					else ram(to_integer(unsigned(address)-1));
		dataout(15 downto 0) <= (others => 'Z') when address = x"fffff" and isDataMemory ='0'
					else ram(to_integer(unsigned(address))) when isDataMemory ='1'
					else ram(to_integer(unsigned(address)+1));
					
					
END syncrama;

