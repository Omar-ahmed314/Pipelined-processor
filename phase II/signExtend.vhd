-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of Sign Extend <===> /// ==========*/ --
entity signExtend is
-- Generic OF Sign Extend --
GENERIC ( n : INTEGER := 32 );

	port(
		input: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(n-1 downto 0)
		);
end signExtend;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of signExtend <===> /// ==========*/ --
architecture signExtend of signExtend is
begin

	output(15 downto 0) <= input;
	output(n-1 downto 16) <= (others => input(15));

end signExtend;
-- /*=== End ====*/ --

