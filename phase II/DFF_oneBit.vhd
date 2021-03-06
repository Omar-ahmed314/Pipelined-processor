-- <=========> //// D-Flip-Flop //// <=========> --

-- <=========> //// Library Declaration //// <=========> --
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- <----- End ----->

-- <=========> //// Entity Declaration OF D-Flip-Flop //// <=========> -- 
ENTITY DFF_oneBit IS 

	PORT( 
			d: in std_logic;
			clk,reset,en : IN std_logic;
			q : OUT std_logic
		);
END DFF_oneBit;
-- <----- End ----->

-- <=========> //// Architecture Declaration D-Flip-Flop //// <=========> -- 
ARCHITECTURE DFF_oneBit OF DFF_oneBit IS
BEGIN
	process(clk,reset)
	begin
	if(reset = '1') then
		q <= '0';

	elsif (rising_edge(clk)) then		
		if(en = '1') then
			q <= d;
		end if;
	end if;	
	end process;
END DFF_oneBit;
-- <----- End ----->


