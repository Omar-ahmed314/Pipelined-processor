vsim -gui work.pipeline_processor 
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(0)
mem load -filltype value -filldata 16#00A0 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(1)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(2)
mem load -filltype value -filldata 16#0100 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(3)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(4)
mem load -filltype value -filldata 16#0150 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(5)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(6)
mem load -filltype value -filldata 16#0250 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(7)
mem load -filltype value -filldata {0001000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(160)


mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(161) 
mem load -filltype value -filldata {0001100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(162)
 
mem load -filltype value -filldata {0010000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(163)

mem load -filltype value -filldata {0011000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(164)
 
mem load -filltype value -filldata {0011000000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(165)
 
mem load -filltype value -filldata {0001100100000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(166)
 
mem load -filltype value -filldata {0010000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(167)
 
mem load -filltype value -filldata {0010100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(168)
 
mem load -filltype value -filldata {0010100100000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(169)
 
mem load -filltype value -filldata {0000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(170)
 
add wave -position insertpoint sim:/pipeline_processor/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/* 
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 16#0005 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
run
run
run
run
force -freeze sim:/pipeline_processor/inputData 16#000A 0
run
run
run
run



