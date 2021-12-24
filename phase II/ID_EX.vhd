-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of ID - EX <===> /// ==========*/ --
entity IDEX is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 32 );

	port(
		bufferEn2, clk: in std_logic;
		Rs, Rt, newPC: in std_logic_vector(n-1 downto 0);
		control_signls: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(103 downto 0)
		);
end IDEX;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of IF - ID <===> /// ==========*/ --
architecture IDEX of IDEX is
begin

	process(clk)
	begin
		if(rising_edge(clk)) then		
			if(bufferEn2 = '1') then
				output(103 downto 96) <= control_signls;
				output(95 downto 64) <= Rs;
				output(63 downto 32) <= Rt;
				output(31 downto 0) <= newPC;
			end if;
		end if;	
	end process;

end IDEX;
-- /*=== End ====*/ --


