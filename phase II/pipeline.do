vsim -gui work.pipeline_processor
# End time: 21:17:18 on Dec 24,2021, Elapsed time: 0:12:37
# Errors: 1, Warnings: 2
# vsim -gui work.pipeline_processor 
# Start time: 21:17:18 on Dec 24,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.pipeline_processor(arch1)
# Loading work.dff(dff)
# Loading work.fetch(struct)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# Loading work.fetchaddedvalue(struct)
# Loading work.n_bit_adder(struct)
# Loading work.one_bit_adder(a_one_bit_adder)
add wave -position insertpoint  \
sim:/pipeline_processor/clk \
sim:/pipeline_processor/reset \
sim:/pipeline_processor/fetchStage_ip_instMemory \
sim:/pipeline_processor/fetchStage_instMemory_IF_ID \
sim:/pipeline_processor/decodeStage_IF_ID_out \
sim:/pipeline_processor/decodeStage_registerFileOut1_ID_IE \
sim:/pipeline_processor/decodeStage_registerFileOut2_ID_IE \
sim:/pipeline_processor/fetchStage_mux_ip
mem load -skip 0 -filltype rand -filldata 16#0000 -fillradix symbolic /pipeline_processor/fetch_stage/r/ram
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/r
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/r
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
run
run
