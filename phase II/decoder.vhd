-- <=========> //// Decoder //// <=========> --

-- <=========> //// Library Declaration //// <=========> --
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- <----- End ----->

-- <=========> //// Entity Declaration OF Decoder //// <=========> -- 
ENTITY decoder IS 
	PORT( 
			input: in std_logic_vector(2 downto 0);
			enable : IN std_logic;
			output : OUT std_logic_vector(7 downto 0)
		);
END decoder;
-- <----- End ----->

-- <=========> //// Architecture Declaration Decoder //// <=========> -- 
ARCHITECTURE decoder OF decoder IS
BEGIN
	process(input , enable)
	begin
		if(enable = '1') then
			if(input = "000") then
				output <= "00000001";
			elsif( input = "001" ) then
				output <= "00000010";
			elsif( input = "010" ) then
				output <= "00000100";
			elsif( input = "011" ) then
				output <= "00001000";
			elsif( input = "100" ) then
				output <= "00010000";
			elsif( input = "101" ) then
				output <= "00100000";
			elsif( input = "110" ) then
				output <= "01000000";
			elsif( input = "111" ) then
				output <= "10000000";
			end if;
		elsif(enable = '0') then
			output <= "00000000";
		end if;
	end process;
END decoder;
-- <----- End ----->
