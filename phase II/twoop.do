vsim -gui work.pipeline_processor 
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(0)
mem load -filltype value -filldata 16#00FF -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(1)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(2)
mem load -filltype value -filldata 16#0100 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(3)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(4)
mem load -filltype value -filldata 16#0150 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(5)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(6)
mem load -filltype value -filldata 16#0200 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(7)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(8)
mem load -filltype value -filldata 16#0250 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(9)



mem load -filltype value -filldata {0011000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(255)
mem load -filltype value -filldata {0011000000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(256) 
mem load -filltype value -filldata {0011000000001000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(257)
mem load -filltype value -filldata {0011000000001100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(258)

mem load -filltype value -filldata {0100001000010000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(259)
 
mem load -filltype value -filldata {0100100001101100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(260)
 
mem load -filltype value -filldata {0101010001110100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(261)
 
mem load -filltype value -filldata {0101111001101100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(262)
 
mem load -filltype value -filldata {0110000100000111} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(263)
 
mem load -filltype value -filldata {1111111111111100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(264)
 
mem load -filltype value -filldata {0100100000100100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(265)
 
add wave -position insertpoint sim:/pipeline_processor/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/* 
add wave -position insertpoint sim:/pipeline_processor/register_file/regFile
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 16#0005 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
force -freeze sim:/pipeline_processor/inputData 16#0019 0
run
force -freeze sim:/pipeline_processor/inputData 16#ffff 0
run
force -freeze sim:/pipeline_processor/inputData 16#f320 0
run
run
run
run
run
run
run




