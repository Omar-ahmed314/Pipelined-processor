-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of MEM - WB <===> /// ==========*/ --
entity MEMWB is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 16 );

	port( 
		we, clk, reset, flush: in std_logic;
		alu_data: in std_logic_vector(n-1 downto 0); 
		mem_data: in std_logic_vector(n-1 downto 0); 
		dest_address:in std_logic_vector(2 downto 0);
		isMemory: in std_logic;
		controlSignals: in std_logic_vector(18 downto 0);
		output: out std_logic_vector(54 downto 0)
		);
end MEMWB;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of MEM - WB <===> /// ==========*/ --
architecture MEMWB of MEMWB is
begin

	process(clk,reset)
	begin
	if(reset = '1') then
		output <= (others => '0');

	elsif (rising_edge(clk)) then		
		if(we = '1') then
			output <= controlSignals & alu_data(15 downto 0) & mem_data(15 downto 0) & dest_address(2 downto 0) & isMemory;
		end if;
	end if;	
	end process;

end MEMWB;
-- /*=== End ====*/ --


