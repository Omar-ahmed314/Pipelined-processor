vsim -gui work.pipeline_processor
mem load -filltype value -filldata {0011000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(0)
mem load -filltype value -filldata {0010100000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(2)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(4)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(5)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(6)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(7)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(8)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(9)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(10)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(11)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(12)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(13)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(14)
mem load -filltype value -filldata {0000000000000000} -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(15)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(0)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/Mem_stage/datamem/ram(1)
add wave -position insertpoint sim:/pipeline_processor/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/*
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 1111000011110000 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run

