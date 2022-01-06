vsim -gui work.pipeline_processor
# vsim -gui work.pipeline_processor 
# Start time: 20:28:13 on Jan 06,2022
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.pipeline_processor(arch1)
# Loading work.dff(dff)
# Loading work.fetch(struct)
# Loading ieee.numeric_std(body)
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
# Loading work.alsu(mymodel)
# Loading work.parta(a_parta)
# Loading work.partb(mymodel)
# Loading work.partc(mymodel)
# Loading work.partd(mymodel)
# Loading work.flags(a_flags)
# Loading work.memwb(memwb)
# Loading work.writeback(struct)
add wave -position insertpoint  \
sim:/pipeline_processor/clk \
sim:/pipeline_processor/reset \
sim:/pipeline_processor/inputData \
sim:/pipeline_processor/outputData \
sim:/pipeline_processor/fetchStage_ip_instMemory \
sim:/pipeline_processor/fetchStage_instMemory_IF_ID \
sim:/pipeline_processor/fetchStage_mux_ip \
sim:/pipeline_processor/decodeStage_IF_ID_out \
sim:/pipeline_processor/jumpinstruction \
sim:/pipeline_processor/jmpinst \
sim:/pipeline_processor/decodeStage_registerFileOut1_ID_IE \
sim:/pipeline_processor/decodeStage_registerFileOut2_ID_IE \
sim:/pipeline_processor/hazardDetect \
sim:/pipeline_processor/controlSignals \
sim:/pipeline_processor/IDEX_Out \
sim:/pipeline_processor/ALU_out \
sim:/pipeline_processor/ALU_cout \
sim:/pipeline_processor/zero_enable \
sim:/pipeline_processor/carry_enable \
sim:/pipeline_processor/negative_enable \
sim:/pipeline_processor/CCR \
sim:/pipeline_processor/alu_data_from_input \
sim:/pipeline_processor/execution_stage_output \
sim:/pipeline_processor/MEM_WB_OUT \
sim:/pipeline_processor/writeBackStage_IM_IWB_registerFile_dataAddress \
sim:/pipeline_processor/writeBackStage_IM_IWB_registerFile_writeData \
sim:/pipeline_processor/wb_enable
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 16#00ff 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/inmem
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /pipeline_processor/fetch_stage/inmem
mem load -filltype value -filldata 0011000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(0)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1)
mem load -filltype value -filldata {0000000000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(2)
mem load -filltype value -filldata {0000000000000000  } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
mem load -filltype value -filldata 0010100000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
mem load -filltype value -filldata {0010100000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(4)
mem load -filltype value -filldata {0000000000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
force -freeze sim:/pipeline_processor/reset 0 0
run
run
run
run
run
run
run
run
