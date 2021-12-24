Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity partD is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
Cin : in std_logic;
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0);
Cout : out std_logic
);

end entity partD;

Architecture myModel of partD is
begin

f <= a(14 downto 0) & '0' when s0='0' and s1 ='0'
     
     else a(14 downto 0) & a(15) when s0='1' and s1 ='0'
     
     else a(14 downto 0) & Cin when s0='0' and s1 ='1'
     
     else "0000000000000000" when s0='1' and s1 ='1';

Cout <= a(15) when s0='0' and s1 ='0'
     
     else a(15) when s0='1' and s1 ='0'
     
     else a(15) when s0='0' and s1 ='1'
     
     else '0' when s0='1' and s1 ='1';


end Architecture myModel;



