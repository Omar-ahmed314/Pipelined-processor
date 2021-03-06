-- /*========= /// <===> Import libraries <===> /// ==========*/ --
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;
use ieee.std_logic_signed.all;
-- /*=== End ====*/ --

-- /*========= /// <===> Entity Of Register File <===> /// ==========*/ --
entity registerFile is
-- Generic OF Register File --
GENERIC ( n : INTEGER := 32 );

	port(
		clk, rst, writeEn: in std_logic;
		src1, src2, dest: in std_logic_vector(2 downto 0);
		writeVal: in std_logic_vector(15 downto 0);
		out1, out2: out std_logic_vector(15 downto 0)
		);
end registerFile;
-- /*=== End ====*/ --

-- /*========= /// <===> Architecture Of Register File <===> /// ==========*/ --
architecture registerFile of registerFile is


component decoder is 
		PORT( 
			input: in std_logic_vector(2 downto 0);
			enable : IN std_logic;
			output : OUT std_logic_vector(7 downto 0)
		);
		end component;

component DFF is 
GENERIC ( n : INTEGER := 32 );
		PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
		end component;
component NDFF IS 

GENERIC ( n : INTEGER := 32 );

	PORT( 
			d: in std_logic_vector(n - 1 downto 0);
			clk,reset,en : IN std_logic;
			q : OUT std_logic_vector(n - 1 downto 0)
		);
END component;
signal re : std_logic;
signal decROut1, decROut2, decWOut1 : std_logic_vector(7 downto 0);

TYPE reg_type IS ARRAY(0 TO 7) OF std_logic_vector(15 DOWNTO 0);
SIGNAL regFile : reg_type ; 

begin
	
	re <= '1';

	decRead1: decoder generic map (n) port map (src1,re,decROut1);
	decRead2: decoder generic map (n) port map (src2,re,decROut2);
	decWrite1: decoder generic map (n) port map (dest,writeEn,decWOut1);

	reg1 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(0), regFile(0));	
	reg2 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(1), regFile(1));	
	reg3 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(2), regFile(2));	
	reg4 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(3), regFile(3));	
	reg5 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(4), regFile(4));	
	reg6 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(5), regFile(5));	
	reg7 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(6), regFile(6));	
	reg8 : NDFF generic map (n) port map (writeVal, clk, rst, decWOut1(7), regFile(7));	
	
	out1 <= regFile(0) when decROut1(0)='1' else
	regFile(1) when decROut1(1)='1' else
	regFile(2) when decROut1(2)='1' else
	regFile(3) when decROut1(3)='1' else
	regFile(4) when decROut1(4)='1' else
	regFile(5) when decROut1(5)='1' else
	regFile(6) when decROut1(6)='1' else
	regFile(7) when decROut1(7)='1' else
	(others => 'Z');

	out2 <= regFile(0) when decROut2(0)='1' else
	regFile(1) when decROut2(1)='1' else
	regFile(2) when decROut2(2)='1' else
	regFile(3) when decROut2(3)='1' else
	regFile(4) when decROut2(4)='1' else
	regFile(5) when decROut2(5)='1' else
	regFile(6) when decROut2(6)='1' else
	regFile(7) when decROut2(7)='1' else
	(others => 'Z');

end registerFile;
-- /*=== End ====*/ --

