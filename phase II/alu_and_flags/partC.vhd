Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity partC is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
Cin : in std_logic;
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0);
Cout : out std_logic
);

end entity partC;

Architecture myModel of partC is
begin

Cout <= a(0);
f <= '0' & a(15 downto 1) when s0='0' and s1 ='0'
     
     else a(0) & a(15 downto 1) when s0='1' and s1 ='0'
     
     else Cin & a(15 downto 1) when s0='0' and s1 ='1'
     
     else Cin & a(15 downto 1) when s0='1' and s1 ='1';

end Architecture myModel;
