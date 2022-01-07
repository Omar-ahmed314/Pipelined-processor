vsim -gui work.pipeline_processor
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

add wave -position insertpoint sim:/pipeline_processor/zeroFlag/*
add wave -position insertpoint sim:/pipeline_processor/flags_stage/*
add wave -position insertpoint sim:/pipeline_processor/negativeFlag/*
add wave -position insertpoint sim:/pipeline_processor/carryFlag/*
add wave -position insertpoint sim:/pipeline_processor/Mem_stage/*
mem load -filltype value -filldata 0001000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(0)
mem load -filltype value -filldata 0011000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(1)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(2)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(3)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(4)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(5)
mem load -filltype value -filldata 1110000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(6)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(7)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(8)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(9)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(10)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(11)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(12)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(13)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(14)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(15)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(16)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(17)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(18)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(19)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(20)
mem load -filltype value -filldata 1110100000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(21)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(22)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(23)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(24)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /pipeline_processor/fetch_stage/inmem/ram(25)
force -freeze sim:/pipeline_processor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/pipeline_processor/reset 1 0
force -freeze sim:/pipeline_processor/inputData 0000000000010100 0
run
force -freeze sim:/pipeline_processor/reset 0 0
run
