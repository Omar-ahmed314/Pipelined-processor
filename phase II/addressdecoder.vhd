library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder is
 port(
 en : in STD_LOGIC;
 s : in STD_LOGIC_VECTOR(2 downto 0);
 r : out STD_LOGIC_VECTOR(7 downto 0)
 );
end decoder;
 
architecture arch_decoder of decoder is
begin
 
process(s,en)
begin
if (en='1') then
 if (s="000") then
 r <= "00000001";
 elsif (s="001") then
 r <= "00000010";
 elsif (s="010") then
 r <= "00000100";
 elsif (s="011") then
 r <= "00001000";
 elsif (s="100") then
 r <= "00010000";
 elsif (s="101") then
 r <= "00100000";
 elsif (s="110") then
 r <= "01000000";
 else
 r <= "10000000";
 end if;
else
 r <= "00000000";
end if;
end process;
 
end arch_decoder;
