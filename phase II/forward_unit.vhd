library ieee;
use ieee.std_logic_1164.all;

entity forward_unit is
port(	rSrc1, rSrc2, rDstAlu, rDstMem: in std_logic_vector(2 downto 0);
	ctrl:				in std_logic;
	select1, select2: 		out std_logic_vector(1 downto 0));
end entity;

architecture arch1 of forward_unit is
begin
select1 <= "00" when ctrl = '0'
	else "01" when rSrc1 = rDstAlu and rSrc1 = rDstMem
	else "01" when rSrc1 = rDstAlu
	else "10" when rSrc1 = rDstMem
	else "00";

select2 <= "00" when ctrl = '0'
	else "01" when rSrc2 = rDstAlu and rSrc2 = rDstMem
	else "01" when rSrc2 = rDstAlu
	else "10" when rSrc2 = rDstMem
	else "00";
end architecture;