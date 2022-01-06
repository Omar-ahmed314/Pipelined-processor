library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity flags is
generic(n : integer := 16);
Port (
alu_o : in  STD_LOGIC_VECTOR (n - 1 downto 0);
alu_cout : in STD_LOGIC;
en_z: in std_logic;
en_n: in std_logic;
en_c: in std_logic;
CCR_O: out std_logic_vector(2 downto 0)
);
end flags;

architecture a_flags of flags is
signal CCR: std_logic_vector(2 downto 0);
signal zero_v: std_logic_vector(n - 1 downto 0);

begin
zero_v <= (Others => '0');
PROCESS(en_z, en_n, en_c) IS  
BEGIN
    IF en_z = '1' and alu_o = zero_v THEN   
          CCR <= CCR(2 downto 1) & '1';
   END IF;
    IF en_n = '1' and alu_o(n - 1) = '1' THEN   
          CCR <= CCR(2) & '1' & CCR(0);
   END IF;
     IF en_c = '1' and alu_cout = '1'THEN   
          CCR <= '1' & CCR(1 downto 0);
   END IF;
END PROCESS;
CCR_O <= CCR;
end a_flags;