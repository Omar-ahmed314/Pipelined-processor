Library ieee;
use ieee.std_logic_1164.all;

entity partA is
generic(n: integer:= 16);
port(
a : in std_logic_vector(n-1 downto 0);
b : in std_logic_vector(n-1 downto 0);
--cin : in std_logic;
S : in std_logic_vector(3 downto 0);

f : out std_logic_vector(n-1 downto 0);
cout: out std_logic
);

end entity partA;


architecture a_partA of partA is
component n_bit_full_adder is
generic(n: integer:= 8);
port(
a, b: in std_logic_vector(n-1 downto 0);
cin: in std_logic;
s: out std_logic_vector(n-1 downto 0);
cout: out std_logic
);
end component n_bit_full_adder;

signal f0,f1,f2,f3,f4,f5: std_logic_vector(n-1 downto 0);
signal co0,co1,co2,co3,co4,co5: std_logic;
signal b_dash, a_dash: std_logic_vector(n-1 downto 0);
--signal cin_dash: std_logic;

begin

b_dash <= (0 => '1', Others => '0') when S(1)='0' and S(0)='0' --and cin='0'
       --else (Others => '0') when S(1)='0' and S(0)='0' --and cin='1'
       else b when S(1)='0' and S(0)='1' --and cin='0'
       --else b when S(1)='0' and S(0)='1' --and cin='1'
       else not b when S(1)='1' and S(0)='0' --and --cin='0'
       --else not b when S(1)='1' and S(0)='0' --and cin='1'
       else (Others => '1') when S(1)='1' and S(0)='1' --and cin='0'
       else (Others => '0') when S(1)='1' and S(0)='1'; --and cin='1';

a_dash <= (Others => '0') when S(1)='1' and S(0)='1' --and cin='1'
      else a;

--cin_dash <= '0' when S(1)='1' and S(0)='1' and cin='1'
      --else cin;

u: n_bit_full_adder generic map(16) port map(a_dash,b_dash,'0',f,cout);

end architecture a_partA;
