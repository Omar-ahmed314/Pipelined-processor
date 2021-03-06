Library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALSU is
generic(n: integer:= 16);
port(
a : in std_logic_vector(n-1 downto 0);
b : in std_logic_vector(n-1 downto 0);
--Cin : in std_logic;
S : in std_logic_vector(3 downto 0);

f_alu : out std_logic_vector(n-1 downto 0);
coutALU : out std_logic;
no_operation: in std_logic
);

end entity ALSU;

architecture myModel of ALSU is

component partA is
generic(n: integer:= 16);
port(
a : in std_logic_vector(n-1 downto 0);
b : in std_logic_vector(n-1 downto 0);
--cin : in std_logic;
S : in std_logic_vector(3 downto 0);

f : out std_logic_vector(n-1 downto 0);
cout: out std_logic
);
end component partA;

component partB is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
b : in std_logic_vector(n-1 downto 0);
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0)
);

end component partB;

component partC is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
--Cin : in std_logic;
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0);
Cout : out std_logic
);

end component partC;

component partD is
generic(n: integer:= 16);
port (
a : in std_logic_vector(n-1 downto 0);
--Cin : in std_logic;
s0 : in std_logic;
s1 : in std_logic;

f : out std_logic_vector(n-1 downto 0);
Cout : out std_logic
);

end component partD;

signal f_a,f_b,f_c,f_d, f_alu_signal: std_logic_vector(n-1 downto 0);
signal cout_a, cout_c, cout_d, coutALU_signal: std_logic;
begin

u0: partA PORT MAP(a,b,S,f_a,cout_a);
u1: partB PORT MAP(a,b,S(0),S(1),f_b);
u2: partC PORT MAP(a,S(0),S(1),f_c,cout_c);
u3: partD PORT MAP(a,S(0),S(1),f_d,cout_d);

--process(a,b,S,no_operation) is
--begin
--if(no_operation = '0') then
f_alu <= f_a when S(3)='0' and S(2)='0' and no_operation = '0'
       else f_b when S(3)='0' and S(2)='1' and no_operation = '0'
       else f_c when S(3)='1' and S(2)='0' and no_operation = '0'
      else f_d when S(3)='1' and S(2)='1' and no_operation = '0' ;

--if(S(3)='0' and S(2)='0') then
--f_alu <= f_a;
--elsif(S(3)='0' and S(2)='1') then
--f_alu <= f_b;
--elsif(S(3)='1' and S(2)='0') then
--f_alu <= f_c;
--elsif(S(3)='1' and S(2)='1') then
--f_alu <= f_d;
--end if;


--f_alu <= f_alu_signal;

coutALU <= cout_a when S(3)='0' and S(2)='0' 
        else Cout_c when S(3)='1' and S(2)='0'
        else Cout_d when S(3)='1' and S(2)='1';
--if(S(3)='0' and S(2)='0') then
--coutALU_signal <= cout_a;
--elsif(S(3)='0' and S(2)='1') then
--coutALU_signal <= Cout_c ;
--elsif(S(3)='1' and S(2)='0') then
--coutALU_signal <= Cout_d; 
--end if;

--coutALU <= coutALU_signal;

--zero_v <= (Others => '0');

--CCR <= CCR(2 downto 1) & '1' when f_alu_signal = zero_v; 
--CCR <= CCR(2) & '1' & CCR(0) when f_alu_signal(n-1) = '1';
--CCR <= '1' & CCR(1 downto 0) when coutALU_signal = '1';

--CCR_O <= CCR;

end architecture myModel;
