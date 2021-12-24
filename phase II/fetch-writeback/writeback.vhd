Library ieee;
use ieee.std_logic_1164.all;

entity writeback is 

port(
dataAlu : in std_logic_vector(15 downto 0);
dataMemory : in std_logic_vector(15 downto 0);
reg_address: in std_logic_vector(2 downto 0);
isMemory: in std_logic;
decoderOut: out std_logic_vector(7 downto 0);
outdata: out std_logic_vector(15 downto 0));

end entity;

Architecture struct of writeback is

COMPONENT decoder IS
	port(
 en : in STD_LOGIC;
 s : in STD_LOGIC_VECTOR(2 downto 0);
 r : out STD_LOGIC_VECTOR(7 downto 0)
 );
END COMPONENT;


signal outDecoder : std_logic_vector(7 downto 0);

begin
PROCESS(reg_address,isMemory)
begin
if (isMemory = '1') then
outdata <= dataMemory;
else
outdata <= dataAlu;
end if;
end Process;

d: decoder port map('1', reg_address, outDecoder);

decoderOut <= outDecoder;



	

end Architecture;
