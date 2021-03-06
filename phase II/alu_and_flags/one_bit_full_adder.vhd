Library ieee;
use ieee.std_logic_1164.all;

entity one_bit_full_adder is

port(
a, b, cin: in std_logic;
s, cout: out std_logic
);

end entity one_bit_full_adder;


architecture a_1_bit_fa of one_bit_full_adder is
begin

s <= a xor b xor cin;
cout <= (a and b) or (cin and (a xor b));

end architecture a_1_bit_fa;