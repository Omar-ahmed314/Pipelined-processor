library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity hazard_detection is
Port (
IDEX_Out: in std_logic_vector(69 downto 0);
IFID_Out: in std_logic_vector(31 downto 0);
hazard_detect: out std_logic
);
end hazard_detection;

architecture a_hazard_detection of hazard_detection is
begin
hazard_detect <= '1' when IDEX_Out(36) = '1' and (IDEX_Out(53 downto 51) = IFID_Out(26 downto 24) or IDEX_Out(53 downto 51) = IFID_Out(23 downto 21))
		else '0';
end a_hazard_detection;
