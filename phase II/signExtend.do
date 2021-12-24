vsim -gui work.signextend
# vsim -gui work.signextend 
# Start time: 09:37:37 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_signed(body)
# Loading work.signextend(signextend)
add wave -position insertpoint sim:/signextend/*
force -freeze sim:/signextend/input 16#ffff 0
run
force -freeze sim:/signextend/input 16#011a 0
run
force -freeze sim:/signextend/input 16#0000 0
run
force -freeze sim:/signextend/input 16#a1bf 0
run