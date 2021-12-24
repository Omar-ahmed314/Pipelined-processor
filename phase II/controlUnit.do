vsim -gui work.controlunit
# vsim -gui work.controlunit 
# Start time: 18:45:36 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_signed(body)
# Loading work.controlunit(controlunit)
add wave -position insertpoint sim:/controlunit/*
force -freeze sim:/controlunit/hazard_detected 0 0
force -freeze sim:/controlunit/opCode 00000 0
run
force -freeze sim:/controlunit/opCode 00001 0
run
run
force -freeze sim:/controlunit/hazard_detected 1 0
run
run
force -freeze sim:/controlunit/hazard_detected 0 0
force -freeze sim:/controlunit/opCode 00011 0
run
run
force -freeze sim:/controlunit/opCode 00000 0
run