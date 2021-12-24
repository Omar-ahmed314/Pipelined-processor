-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of IF - ID <===> /// ==========*/ --
entity IFID is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 32 );

	port(
		we, clk: in std_logic;
		instr, newPC: in std_logic_vector(n-1 downto 0); 
		output: out std_logic_vector(63 downto 0)
		);
end IFID;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of IF - ID <===> /// ==========*/ --
architecture IFID of IFID is
begin

	process(clk)
	begin
		if(rising_edge(clk)) then		
			if(we = '1') then
				output(63 downto 32) <= instr;
				output(31 downto 0) <= newPC;
			end if;
		end if;	
	end process;

end IFID;
-- /*=== End ====*/ --


