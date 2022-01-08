-- <=========> //// D-Flip-Flop //// <=========> --

-- <=========> //// Library Declaration //// <=========> --
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- <----- End ----->

-- <=========> //// Entity Declaration OF D-Flip-Flop //// <=========> -- 
ENTITY NDFF IS 

GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END NDFF;
-- <----- End ----->

-- <=========> //// Architecture Declaration D-Flip-Flop //// <=========> -- 
ARCHITECTURE NDFF OF NDFF IS
BEGIN
	process(clk,reset)
	begin
	if(reset = '1') then
		q <= (others => '0');

	elsif (falling_edge(clk)) then		
		if(en = '1') then
			q <= d;
		end if;
	end if;	
	end process;
END NDFF;
-- <----- End ----->


