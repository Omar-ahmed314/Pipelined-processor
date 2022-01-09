-- <=========> //// D-Flip-Flop //// <=========> --

-- <=========> //// Library Declaration //// <=========> --
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- <----- End ----->

-- <=========> //// Entity Declaration OF D-Flip-Flop //// <=========> -- 
ENTITY DFF IS 

GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END DFF;
-- <----- End ----->

-- <=========> //// Architecture Declaration D-Flip-Flop //// <=========> -- 
ARCHITECTURE DFF OF DFF IS
BEGIN
	process(clk,reset)
	begin
	if(reset = '1') then
		q <= (others => '0');

	elsif (rising_edge(clk)) then		
		if(en = '1') then
			q <= d;
		end if;
	end if;	
	end process;
END DFF;
-- <----- End ----->


