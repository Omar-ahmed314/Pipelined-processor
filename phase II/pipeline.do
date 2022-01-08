vsim -gui work.pipeline_processor
# vsim -gui work.pipeline_processor 
# Start time: 15:25:49 on Jan 08,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.pipeline_processor(arch1)
# Loading work.dff(dff)
# Loading work.fetch(struct)
# Loading work.ram(syncrama)
# Loading work.fetchaddedvalue(struct)
# Loading work.n_bit_full_adder(a_n_bit_fa)
# Loading work.one_bit_full_adder(a_1_bit_fa)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_signed(body)
# Loading work.ifid(ifid)
# Loading work.registerfile(registerfile)
# Loading work.decoder(decoder)
# Loading work.controlunit(controlunit)
# Loading work.idex(idex)
# Loading work.hazard_detection(a_hazard_detection)
# Loading work.alsu(mymodel)
# Loading work.parta(a_parta)
# Loading work.partb(mymodel)
# Loading work.partc(mymodel)
# Loading work.partd(mymodel)
# Loading work.flags(a_flags)
# Loading work.dff_onebit(dff_onebit)
# Loading work.exmem(exmem)
# Loading work.resetregister(resetregister)
# Loading work.memorystage(struct)
# Loading work.memwb(memwb)
# Loading work.writeback(struct)
mem load -filltype value -filldata {0001100000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(0)
mem load -filltype value -filldata {0001100000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1)
mem load -filltype value -filldata {0000000000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(2)
mem load -filltype value -filldata {0000000000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
add wave -position insertpoint sim:/pipeline_processor/controlU/*
add wave -position insertpoint sim:/pipeline_processor/*
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/Mem_stage/datamem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/Mem_stage/datamem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/inmem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/inmem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 2  Instance: /pipeline_processor/Mem_stage/datamem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 2  Instance: /pipeline_processor/Mem_stage/datamem
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
run
run
run
