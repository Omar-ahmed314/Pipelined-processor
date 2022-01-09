vsim -gui work.pipeline_processor 
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(0)
mem load -filltype value -filldata 16#0010 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(1)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(2)
mem load -filltype value -filldata 16#0400 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(3)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(4)
mem load -filltype value -filldata 16#0450 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(5)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(6)
mem load -filltype value -filldata 16#0200 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(7)
mem load -filltype value -filldata 16#0000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(8)
mem load -filltype value -filldata 16#0250 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(9)


mem load -filltype value -filldata {0101100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(512) 
mem load -filltype value -filldata {0010111000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(513)
mem load -filltype value -filldata {1111100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(514) 


mem load -filltype value -filldata {0001000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(592) 
mem load -filltype value -filldata {0101100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(593)
mem load -filltype value -filldata {0010101000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(594)
mem load -filltype value -filldata {1110100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(595)




mem load -filltype value -filldata {0011000000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(16) 
mem load -filltype value -filldata {0011000000001000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(17)
mem load -filltype value -filldata {0011000000001100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(18)
mem load -filltype value -filldata {0011000000010000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(19)

mem load -filltype value -filldata {1000010000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(20)
 
mem load -filltype value -filldata {1101100100000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(21)


mem load -filltype value -filldata {0101100110110100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(48)
 
mem load -filltype value -filldata {1100001000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(49)

mem load -filltype value -filldata {0001000000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(50)

mem load -filltype value -filldata {1100000100000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(80)
mem load -filltype value -filldata {1101001100000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(81)

mem load -filltype value -filldata {0001110100010100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(82)

mem load -filltype value -filldata {0011000000011000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(83)

mem load -filltype value -filldata {1100111000000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(84)

mem load -filltype value -filldata {0010000100000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(85)


mem load -filltype value -filldata {0001000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1792)
mem load -filltype value -filldata {1000100000011000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1793)
mem load -filltype value -filldata {1110011000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1794)

mem load -filltype value -filldata {0010011000011000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1795)

mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1796)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1797)



mem load -filltype value -filldata {0100101111011000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(768)
mem load -filltype value -filldata {0100100101000100} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(769)
mem load -filltype value -filldata {1110100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(770)
mem load -filltype value -filldata {0001000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(771)



mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(772)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(773)



 
add wave -position insertpoint sim:/pipeline_processor/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/* 
add wave -position insertpoint sim:/pipeline_processor/register_file/regFile
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 16#0030 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
force -freeze sim:/pipeline_processor/inputData 16#0050 0
run
force -freeze sim:/pipeline_processor/inputData 16#0100 0
run
force -freeze sim:/pipeline_processor/inputData 16#0300 0
run
force -freeze sim:/pipeline_processor/inputData 16#0700 0
run



