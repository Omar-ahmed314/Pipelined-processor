Library ieee;
use ieee.std_logic_1164.all;

entity partB is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
b : in std_logic_vector(n-1 downto 0);
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0)
);

end entity partB;

Architecture myModel of partB is
begin
f <= (a and b) when s0='0' and s1 ='0'
     else
     a when s0='1' and s1 ='0'
     else
     (a xor b) when s0='0' and s1 ='1'
     else
     (not a) when s0='1' and s1 ='1';
end Architecture myModel;