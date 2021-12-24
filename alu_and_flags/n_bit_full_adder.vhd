Library ieee;
use ieee.std_logic_1164.all;

entity n_bit_full_adder is
generic(n: integer:= 8);
port(
a, b: in std_logic_vector(n-1 downto 0);
cin: in std_logic;
s: out std_logic_vector(n-1 downto 0);
cout: out std_logic
);
end entity n_bit_full_adder;


architecture a_n_bit_fa of n_bit_full_adder is
component one_bit_full_adder is
port(
a, b, cin: in std_logic;
s, cout: out std_logic
);
end component one_bit_full_adder;

signal temp: std_logic_vector(n downto 0);

begin

temp(0) <= cin;
loop1 : for i in 0 to n-1 generate	
	fx: one_bit_full_adder port map(a(i),b(i),temp(i),s(i),temp(i+1));
end generate;
Cout <= temp(n);

end architecture a_n_bit_fa;