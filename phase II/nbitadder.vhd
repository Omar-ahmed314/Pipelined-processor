
Library ieee;
use ieee.std_logic_1164.all;

entity n_bit_adder is 
generic(N: integer :=32);
port(
a,b : in std_logic_vector(N-1 downto 0);
cin: in std_logic;
cout: out std_logic;
s : out std_logic_vector(N-1 downto 0));

end entity;

Architecture struct of n_bit_adder is

COMPONENT one_bit_adder is
port(
a,b,cin : IN  std_logic;
s, cout : OUT std_logic );
END COMPONENT;

signal temp : std_logic_vector(N downto 0);

begin

temp(0) <= cin;
loop1: for i in 0 to N-1 generate
	fx: one_bit_adder PORT MAP(a(i),b(i),temp(i),s(i),temp(i+1));
end generate;
cout <= temp(N);


end Architecture;
