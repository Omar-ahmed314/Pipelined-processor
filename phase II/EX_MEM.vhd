-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of EX - MEM <===> /// ==========*/ --
entity EXMEM is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 16 );

	port( 
		we, clk, reset: in std_logic;
		alu_data: in std_logic_vector(n-1 downto 0);
		dest_address:in std_logic_vector(2 downto 0);
		controlSignals: in std_logic_vector(18 downto 0);
		);
end EXMEM;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of EX - MEM  <===> /// ==========*/ --
architecture EXMEM of EXMEM is
begin

	process(clk,reset)
	begin
	if(reset = '1') then
		output <= (others => '0');

	elsif (falling_edge(clk)) then		
		if(we = '1') then
			output <= ;
		end if;
	end if;	
	end process;

end MEMWB;
-- /*=== End ====*/ --


