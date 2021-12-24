library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity integ is
generic(n: integer:= 16);
port(

IN_PORT : in std_logic_vector(n-1 downto 0);
OUT_PORT : out std_logic_vector(n-1 downto 0);

);
end integ;

architecture a_integ of integ is
begin
    
end a_integ;