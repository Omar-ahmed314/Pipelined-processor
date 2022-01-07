-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of ID - EX <===> /// ==========*/ --
entity IDEX is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 16 );

	port(
		bufferEn2, clk,reset: in std_logic;
		Rs, Rt: in std_logic_vector(n-1 downto 0);
		Rd_address: in std_logic_vector(2 downto 0);
		control_signls: in std_logic_vector(18 downto 0);
		imm_value: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(69 downto 0)
		);
end IDEX;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of ID - EX <===> /// ==========*/ --
architecture IDEX of IDEX is
begin

	process(clk)
	begin
		if(reset = '1') then
			output <= (others => '0');
		
		elsif(rising_edge(clk)) then		
			if(bufferEn2 = '1') then
				output(69 downto 54) <= imm_value;
				output (53 downto 51) <= Rd_address;
				output(50 downto 32) <= control_signls;
				output(31 downto 16) <= Rs;
				output(15 downto 0) <= Rt;
			end if;
		end if;	
	end process;

end IDEX;
-- /*=== End ====*/ --


