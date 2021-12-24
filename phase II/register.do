vsim -gui work.dff
# vsim -gui work.dff 
# Start time: 09:42:46 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.dff(dff)
add wave -position insertpoint sim:/dff/*
force -freeze sim:/dff/d 16#0101 0
force -freeze sim:/dff/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/dff/reset 0 0
force -freeze sim:/dff/en 1 0
run
force -freeze sim:/dff/d 16#fafa0101 0
run
force -freeze sim:/dff/en 0 0
force -freeze sim:/dff/d 16#ffffffff 0
run
force -freeze sim:/dff/en 1 0
run
force -freeze sim:/dff/reset 1 0
run