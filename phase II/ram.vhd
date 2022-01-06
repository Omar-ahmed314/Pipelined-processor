LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ram IS
	PORT(
		we  : IN std_logic;
		address : IN  std_logic_vector(19 DOWNTO 0);
		isSixteen : IN std_logic;
		datain  : IN  std_logic_vector(31 DOWNTO 0);
		dataout : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY ram;

ARCHITECTURE syncrama OF ram IS

	TYPE ram_type IS ARRAY(0 TO 1048575) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type;
	
	BEGIN
		PROCESS(we,isSixteen,datain,address) IS
			BEGIN
					IF we = '1' THEN
						ram(to_integer(unsigned(address))) <= datain(31 downto 16);
						IF isSixteen = '0' THEN
							ram(to_integer(unsigned(address))+1) <= datain(15 downto 0);
						END IF;
					END IF;
		END PROCESS;
		dataout(31 downto 16) <= ram(to_integer(unsigned(address)));
		dataout(15 downto 0) <= ram(to_integer(unsigned(address))+1);
END syncrama;

