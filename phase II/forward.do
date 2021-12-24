vsim -gui work.forward_unit
# vsim -gui work.forward_unit 
# Start time: 22:30:16 on Dec 23,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.forward_unit(arch1)
add wave -position insertpoint  \
sim:/forward_unit/rSrc1 \
sim:/forward_unit/rSrc2 \
sim:/forward_unit/rDstAlu \
sim:/forward_unit/rDstMem \
sim:/forward_unit/ctrl \
sim:/forward_unit/select1 \
sim:/forward_unit/select2
force -freeze sim:/forward_unit/ctrl 0 0
force -freeze sim:/forward_unit/rSrc1 111 0
force -freeze sim:/forward_unit/rSrc2 101 0
force -freeze sim:/forward_unit/rDstAlu 000 0
force -freeze sim:/forward_unit/rDstMem 100 0
run
force -freeze sim:/forward_unit/ctrl 1 0
run
force -freeze sim:/forward_unit/rDstAlu 111 0
run
force -freeze sim:/forward_unit/rDstMem 111 0
run
force -freeze sim:/forward_unit/rSrc2 111 0
run
force -freeze sim:/forward_unit/rDstMem 001 0
force -freeze sim:/forward_unit/rSrc2 001 0
run
force -freeze sim:/forward_unit/rSrc1 001 0
run
force -freeze sim:/forward_unit/rSrc1 000 0
force -freeze sim:/forward_unit/rDstMem 010 0
run
