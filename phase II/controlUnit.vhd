-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of Control Unit <===> /// ==========*/ --
entity controlUnit is
GENERIC ( n : INTEGER := 32 );

	port(
		hazard_detected: in std_logic;
		opCode: in std_logic_vector(4 downto 0);
		
		brachEn, flagChange: out std_logic;
		is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN,NO_OP: out std_logic
		);
end controlUnit;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of Control Unit <===> /// ==========*/ --
architecture controlUnit of controlUnit is
begin

	process(opCode, hazard_detected)
	begin
		if(hazard_detected = '0') then
			
			brachEn <= '0';
			flagChange <= '0';
			is_Imm <= '0';
			ST_or_BNE <= '0';
			WB_EN <= '0';
			MEM_R_EN <= '0';
			MEM_W_EN <= '0';
			NO_OP <= '0';
			
-- -----------------------------------
-- Enable No operation signal
--------------------------------------

			if(opCode = "00000" ) then
				NO_OP <= '1';

-- -----------------------------------
-- Enable change flags signal
--------------------------------------

			elsif(opCode = "00010" or opCode = "00011" or opCode = "00100") then
				flagChange <= '1';
			end if;	
------------------------------------------------------------------------------------------------------
-- preventing any writes to the register file or the memory
		elsif(hazard_detected = '1') then		
			WB_EN <= '0';
			MEM_W_EN <= '0';
		end if;	
	end process;

end controlUnit;
-- /*=== End ====*/ --

