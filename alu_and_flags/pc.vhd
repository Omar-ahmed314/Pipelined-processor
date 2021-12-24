library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity pc is
Port (
Port ( SEL : in  STD_LOGIC;
A : in  STD_LOGIC_VECTOR (31 downto 0);
B : in  STD_LOGIC_VECTOR (31 downto 0);
X : out STD_LOGIC_VECTOR (31 downto 0)
);
end pc;

architecture a_pc of pc is

component mux_2to1_top is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (31 downto 0);
           B   : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_VECTOR (31 downto 0)
);
end mux_2to1_top;

begin
    X <= A when (SEL = '1') else B;
end a_pc;
