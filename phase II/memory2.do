vsim -gui work.pipeline_processor 
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(0)
mem load -filltype value -filldata 16#0300 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(1)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(2)
mem load -filltype value -filldata 16#0100 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(3)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(4)
mem load -filltype value -filldata 16#0150 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(5)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(6)
mem load -filltype value -filldata 16#0200 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(7)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(8)
mem load -filltype value -filldata 16#0250 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(9)


mem load -filltype value -filldata {0010100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(256) 
mem load -filltype value -filldata {0000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(257)

mem load -filltype value -filldata {0010000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(336) 
mem load -filltype value -filldata {0010100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(337)
mem load -filltype value -filldata {0000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(338)




mem load -filltype value -filldata {0011000000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(768) 
mem load -filltype value -filldata {0011000000001000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(769)
mem load -filltype value -filldata {0011000000001100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(770)

mem load -filltype value -filldata {1001000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(771)
mem load -filltype value -filldata {0000000000010100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(772)
 
mem load -filltype value -filldata {1000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(773)
mem load -filltype value -filldata {1000000100000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(774)
 
mem load -filltype value -filldata {1000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(775)
mem load -filltype value -filldata {1000100000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(776)
mem load -filltype value -filldata {0011000000010000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(777)
mem load -filltype value -filldata {1010000110000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(778)
mem load -filltype value -filldata {0000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(779)


mem load -filltype value -filldata {1010000010000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(780)
mem load -filltype value -filldata {0000100000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(781)

mem load -filltype value -filldata {1001110000001000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(782)
mem load -filltype value -filldata {0000100000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(783)

mem load -filltype value -filldata {1001110000001100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(784)
mem load -filltype value -filldata {0000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(785)
mem load -filltype value -filldata {1000100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(786)

 
add wave -position insertpoint sim:/pipeline_processor/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/* 
add wave -position insertpoint sim:/pipeline_processor/register_file/regFile
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 16#0019 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
force -freeze sim:/pipeline_processor/inputData 16#ffff 0
run
force -freeze sim:/pipeline_processor/inputData 16#f320 0
run
force -freeze sim:/pipeline_processor/inputData 16#10 0
run




