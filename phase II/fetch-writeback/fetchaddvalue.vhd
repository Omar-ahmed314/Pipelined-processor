Library ieee;
use ieee.std_logic_1164.all;

entity fetchaddedvalue is 

port(
opcode : in std_logic_vector(4 downto 0);
addedvalue : out std_logic_vector(19 downto 0));

end entity;

Architecture struct of fetchaddedvalue is


begin
	
addedvalue <= "00000000000000000000" when opcode="00001"
	else "00000000000000000010" when opcode="01100"
	else "00000000000000000010" when opcode="10010"
	else "00000000000000000001";


end Architecture;



