library ieee;
use ieee.std_logic_1164.all;

-- Forward unit entity
-- responsible for forwarding the data already evaluated in ALU or Memory stages
-- back to the previous instructions, in order not to fetch the wrong one
-- rSrc1 : The first source register address
-- rSrc2 : The second source register address
-- rDstAlu : The destination register address already evaluated in Alu stage
-- rDstMem : The destination register address already evaluated in memory stage
-- ctrl : The control signal told the forward unit that this's an alu instruction
-- select1: The select signal forwards to the mux1 at the alu source1
-- select2: The select signal forwards to the mux2 at the alu source2
entity forward_unit is
port(	rSrc1, rSrc2, rDstAlu, rDstMem: in std_logic_vector(2 downto 0);
	ctrl:				in std_logic;
	select1, select2: 		out std_logic_vector(1 downto 0));
end entity;

architecture arch1 of forward_unit is
begin
select1 <= "00" when ctrl = '0'
	else "01" when rSrc1 = rDstAlu and rSrc1 = rDstMem -- if the source matchs both stages, select the recent one at alu
	else "01" when rSrc1 = rDstAlu
	else "10" when rSrc1 = rDstMem
	else "00";					   -- if there is no dependency, select that comes from the decoder

select2 <= "00" when ctrl = '0'
	else "01" when rSrc2 = rDstAlu and rSrc2 = rDstMem
	else "01" when rSrc2 = rDstAlu
	else "10" when rSrc2 = rDstMem
	else "00";
end architecture;