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
mem load -filltype value -filldata {1001101000000100 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(0)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1)
mem load -filltype value -filldata 0100100100101000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(2)
mem load -filltype value -filldata {0100100100101000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
mem load -filltype value -filldata {0000000000000000 } -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(4)
add wave -position insertpoint  \
sim:/pipeline_processor/clk \
sim:/pipeline_processor/reset \
sim:/pipeline_processor/inputData \
sim:/pipeline_processor/outputData \
sim:/pipeline_processor/flush \
sim:/pipeline_processor/fetchStage_ip_instMemory \
sim:/pipeline_processor/fetchStage_instMemory_IF_ID \
sim:/pipeline_processor/fetchStage_mux_ip \
sim:/pipeline_processor/decodeStage_IF_ID_out \
sim:/pipeline_processor/jump_execute \
sim:/pipeline_processor/jmpinst \
sim:/pipeline_processor/IF_ID_Out_IP \
sim:/pipeline_processor/decodeStage_registerFileOut1_ID_IE \
sim:/pipeline_processor/decodeStage_registerFileOut2_ID_IE \
sim:/pipeline_processor/hazardDetect \
sim:/pipeline_processor/controlSignals \
sim:/pipeline_processor/IDEX_Out \
sim:/pipeline_processor/decode_execute_source2 \
sim:/pipeline_processor/conrtol_zero_flag_out \
sim:/pipeline_processor/conrtol_negative_flag_out \
sim:/pipeline_processor/conrtol_carry_flag_out \
sim:/pipeline_processor/hazard_detect \
sim:/pipeline_processor/decode_muxOfControlAndHazardUnit_IDIX \
sim:/pipeline_processor/ALU_out \
sim:/pipeline_processor/ALU_cout \
sim:/pipeline_processor/zero_enable \
sim:/pipeline_processor/carry_enable \
sim:/pipeline_processor/negative_enable \
sim:/pipeline_processor/CCR \
sim:/pipeline_processor/alu_data_from_input \
sim:/pipeline_processor/execution_stage_output \
sim:/pipeline_processor/ALU_input1 \
sim:/pipeline_processor/ALU_input2 \
sim:/pipeline_processor/CRR_Out \
sim:/pipeline_processor/carry_signal \
sim:/pipeline_processor/opcode_execution \
sim:/pipeline_processor/branch_address \
sim:/pipeline_processor/execute_branch \
sim:/pipeline_processor/ID_EX_IP_Out \
sim:/pipeline_processor/jump_execute_ex \
sim:/pipeline_processor/jmpinst_ex \
sim:/pipeline_processor/stackPointer_Mem_Input \
sim:/pipeline_processor/stackPointer_Output_Mem \
sim:/pipeline_processor/memorydataoutput \
sim:/pipeline_processor/EXMEM_Out \
sim:/pipeline_processor/datain_memory \
sim:/pipeline_processor/addressin_memory \
sim:/pipeline_processor/ex_mem_data_in \
sim:/pipeline_processor/jump_execute_mem \
sim:/pipeline_processor/jmpinst_mem \
sim:/pipeline_processor/MEM_WB_OUT \
sim:/pipeline_processor/writeBackStage_IM_IWB_registerFile_dataAddress \
sim:/pipeline_processor/writeBackStage_IM_IWB_registerFile_writeData \
sim:/pipeline_processor/wb_enable
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
