vsim -gui work.ifid
# vsim -gui work.ifid 
# Start time: 19:14:56 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_signed(body)
# Loading work.ifid(ifid)
add wave -position insertpoint sim:/ifid/*
force -freeze sim:/ifid/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/ifid/we 1 0
force -freeze sim:/ifid/instr 16#ffffffff 0
force -freeze sim:/ifid/newPC 16#00000000 0
run
run
run
run
run
run
force -freeze sim:/ifid/newPC 16#10100101 0
run
run
run