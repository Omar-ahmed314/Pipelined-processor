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
		is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN, NO_OP, setC, inEN, outEN: out std_logic;
		alu_selection: out std_logic_vector(3 downto 0);
		isStack, isPush, isStore, isFunction: out std_logic
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
			setC <= '0';
			inEN <= '0';
			outEN <= '0';
			isStack<= '0'; 
			isPush<= '0'; 
			isStore<= '0'; 
			isFunction<= '0';
--------------------------------------------------------------------------------
-- ------------------------ One Operand Signals Handling -----------------------
--------------------------------------------------------------------------------

			if(opCode = "00000" ) then -- NoOperations
				NO_OP <= '1';
				alu_selection <= "0000";
			elsif(opCode = "00001") then -- HLT
				alu_selection <= "0000";
				NO_OP <= '1';
			elsif(opCode = "00010") then -- SETC
				alu_selection <= "0000";
				flagChange <= '1';
				setC <='1';
			elsif(opCode = "00011") then -- NOT
				alu_selection <= "0111";
				flagChange <= '1';
				WB_EN <= '1';
			elsif(opCode = "00100") then -- INC
				alu_selection <= "0000";
				flagChange <= '1';
				WB_EN <= '1';
			elsif(opCode = "00101") then -- OUT
				alu_selection <= "0000";
				outEN <= '1';	
				NO_OP <= '1';
			elsif(opCode = "00110") then -- IN
				alu_selection <= "0000";
				WB_EN <= '1';
				inEN <= '1';
				NO_OP <= '1';

--------------------------------------------------------------------------------
-- ------------------------ Two Operands Signals Handling ----------------------
--------------------------------------------------------------------------------

			elsif(opCode = "01000") then -- Mov
				alu_selection <= "0101";
				WB_EN <= '1';
			elsif(opCode = "01001") then -- Add
				alu_selection <= "0001";
				flagChange <= '1';
				WB_EN <= '1';
			elsif(opCode = "01010") then -- Sub
				alu_selection <= "0010";
				flagChange <= '1';
				WB_EN <= '1';
			elsif(opCode = "01011") then -- AND
				alu_selection <= "0100";
				flagChange <= '1';
				WB_EN <= '1';
			elsif(opCode = "01100") then -- IADD
				alu_selection <= "0001";
				flagChange <= '1';
				WB_EN <= '1';
				is_Imm <= '1';

-------------------------------------------------------------------------------------
-- ------------------------ Memory Operations Signals Handling ----------------------
-------------------------------------------------------------------------------------

			elsif(opCode = "10000") then -- Push
				alu_selection <= "0000";
				NO_OP <= '1';
				MEM_W_EN <= '1';
				isStack<= '1'; 
				isPush<= '1'; 
				isStore<= '0'; 
				isFunction<= '0';
			elsif(opCode = "10001") then -- Pop
				alu_selection <= "0000";
				NO_OP <= '1';
				MEM_R_EN <= '1';
				isStack<= '1'; 
				isPush<= '0'; 
				isStore<= '0'; 
				isFunction<= '0';
				WB_EN <= '1';
			elsif(opCode = "10010") then -- LDM 
				alu_selection <= "0110";
				NO_OP <= '1';
				is_Imm <= '1';
				WB_EN <= '1';
	
			elsif(opCode = "10011") then -- LDD
				alu_selection <= "0001";
				WB_EN <= '1';
				is_Imm <= '1'; 
				isStack<= '0'; 
				isPush<= '0'; 
				isStore<= '0'; 
				isFunction<= '0';
			elsif(opCode = "10100") then -- STD
				alu_selection <= "0001"; -----handle add sources
				ST_or_BNE <= '1';
				is_Imm <= '1';
				MEM_W_EN <= '1';
				isStack<= '0'; 
				isPush<= '0'; 
				isStore<= '1'; 
				isFunction<= '0';

-----------------------------------------------------------------------------------------------------------
-- ------------------------ Branch and Change of Control Operations Signals Handling ----------------------
-----------------------------------------------------------------------------------------------------------

			elsif(opCode = "11000") then -- JZ
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				flagChange <= '1';
			elsif(opCode = "11001") then -- JN
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				flagChange <= '1';
			elsif(opCode = "11010") then -- JC
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				flagChange <= '1';
			elsif(opCode = "11011") then -- JMP
				alu_selection <= "ZZZZ";
				brachEn <= '1';
			elsif(opCode = "11100") then -- CALL
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				MEM_W_EN <= '1';
				isStack<= '0'; 
				isPush<= '1'; 
				isStore<= '0'; 
				isFunction<= '1';
			elsif(opCode = "11101") then -- RET
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				MEM_R_EN <= '1';
				isStack<= '0'; 
				isPush<= '0'; 
				isStore<= '0'; 
				isFunction<= '1';
			elsif(opCode = "11110") then -- INT
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				MEM_W_EN <= '1';
				isStack<= '0'; 
				isPush<= '1'; 
				isStore<= '0'; 
				isFunction<= '1';
			elsif(opCode = "11111") then -- RTI
				alu_selection <= "ZZZZ";
				brachEn <= '1';
				MEM_R_EN <= '1';
				isStack<= '0'; 
				isPush<= '0'; 
				isStore<= '0'; 
				isFunction<= '1';
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

