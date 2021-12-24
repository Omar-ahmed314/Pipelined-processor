vsim -gui work.registerfile
# vsim -gui work.registerfile 
# Start time: 17:32:01 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_signed(body)
# Loading work.registerfile(registerfile)
# Loading work.decoder(decoder)
# Loading work.dff(dff)
add wave -position insertpoint sim:/registerfile/*
force -freeze sim:/registerfile/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/registerfile/rst 0 0
force -freeze sim:/registerfile/writeEn 1 0
force -freeze sim:/registerfile/src1 000 0
force -freeze sim:/registerfile/src2 001 0
force -freeze sim:/registerfile/dest 000 0
force -freeze sim:/registerfile/writeVal 16#ffff 0
run
force -freeze sim:/registerfile/writeVal 16#abcd 0
force -freeze sim:/registerfile/dest 001 0
run
force -freeze sim:/registerfile/dest 010 0
force -freeze sim:/registerfile/writeVal 16#5555 0
run
force -freeze sim:/registerfile/writeEn 0 0
run
force -freeze sim:/registerfile/src1 010 0
force -freeze sim:/registerfile/src2 010 0
run