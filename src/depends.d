
./chartesters.asm: chartesters.c chartesters.h
./chip8/audio.asm: chip8/audio.c chip8/audio.h datatypes.h hbios.h \
 chip8/hbios_audio.h chip8/systemstate.h chip8/ym2149.h
./chip8/byte_code_executor.asm: chip8/byte_code_executor.c datatypes.h \
 chip8/key_monitor.h chip8/stack.h chip8/systemstate.h chip8/systimer.h \
 hbios.h chip8/timers.h chip8/tty.h xstdio.h chip8/instr_output.h \
 chip8/v9958.h chip8/instr_pc.h chip8/instr_random.h chip8/random.h \
 chip8/instr_registers.h chip8/fontsets.h chip8/instr_sound.h
./chip8/configreader.asm: chip8/configreader.c chip8/configreader.h token.h \
 datatypes.h charconstants.h datatypes.h chip8/error_reports.h \
 filereader.h cpm.h chip8/systemstate.h chip8/tms.h xstdlib.h
./chip8/configuration_loader.asm: chip8/configuration_loader.c \
 chip8/configreader.h token.h datatypes.h cpm.h chip8/error_reports.h \
 datatypes.h filereader.h cpm.h chip8/systemstate.h chip8/v9958.h
./chip8/error_reports.asm: chip8/error_reports.c chip8/error_reports.h \
 datatypes.h chip8/configreader.h token.h datatypes.h xstdio.h
./chip8/fontsets.asm: chip8/fontsets.c chip8/fontsets.h datatypes.h
./chip8/hbios_audio.asm: chip8/hbios_audio.c chip8/hbios_audio.h datatypes.h \
 hbios.h chip8/instr_sound.h chip8/systemstate.h chip8/timers.h
./chip8/instr_output.asm: chip8/instr_output.c chip8/instr_output.h chip8/v9958.h \
 datatypes.h chip8/error_reports.h hbios.h chip8/instr_tms_output.h \
 chip8/vid_int.h chip8/instr_v9958_output.h chip8/systemstate.h \
 chip8/tms.h chip8/vdp.h xstdio.h
./chip8/instr_sound.asm: chip8/instr_sound.c chip8/instr_sound.h datatypes.h \
 chip8/audio.h hbios.h chip8/systemstate.h chip8/timers.h
./chip8/instr_tms_output.asm: chip8/instr_tms_output.c chip8/instr_tms_output.h \
 datatypes.h chip8/vid_int.h chip8/systemstate.h chip8/tms.h
./chip8/instr_v9958_output.asm: chip8/instr_v9958_output.c \
 chip8/instr_v9958_output.h datatypes.h chip8/instr_output.h \
 chip8/v9958.h chip8/systemstate.h
./chip8/keys.asm: chip8/keys.c chip8/keys.h datatypes.h hbios.h
./chip8/key_monitor.asm: chip8/key_monitor.c chip8/key_monitor.h datatypes.h \
 charconstants.h chip8/keys.h chip8/systemstate.h chip8/timers.h \
 chip8/ym2149.h chip8/audio.h
./chip8/main.asm: chip8/main.c chip8/audio.h datatypes.h \
 chip8/byte_code_executor.h chip8/configuration_loader.h cpm.h \
 chip8/error_reports.h hbios.h chip8/instr_output.h chip8/v9958.h \
 chip8/instr_sound.h chip8/random.h chip8/systemstate.h chip8/systimer.h \
 chip8/timers.h chip8/tms.h xstdio.h xstdlib.h
./chip8/random.asm: chip8/random.c chip8/random.h datatypes.h chip8/systimer.h \
 hbios.h chip8/systemstate.h
./chip8/stack.asm: chip8/stack.c chip8/stack.h datatypes.h chip8/systemstate.h \
 xstdio.h
./chip8/systemstate.asm: chip8/systemstate.c chip8/systemstate.h datatypes.h \
 chip8/tms.h
./chip8/test_configuration.asm: chip8/test_configuration.c \
 chip8/test_configuration.h chip8/configreader.h token.h datatypes.h \
 chip8/configuration_loader.h cpm.h chip8/systemstate.h datatypes.h \
 test_expectations.h terminal_codes.h chip8/tms.h chip8/v9958.h xstdio.h
./chip8/test_instruction.asm: chip8/test_instruction.c chip8/byte_code_executor.h \
 datatypes.h chip8/fontsets.h chip8/stack.h chip8/systemstate.h \
 terminal_codes.h test_expectations.h datatypes.h terminal_codes.h \
 test_opcodes.h chip8/test_system.h xstdio.h
./chip8/test_system.asm: chip8/test_system.c chip8/test_system.h datatypes.h \
 chip8/systemstate.h chip8/timers.h chip8/ym2149.h chip8/audio.h
./chip8/timers.asm: chip8/timers.c chip8/timers.h datatypes.h chip8/tty.h hbios.h \
 chip8/instr_sound.h chip8/systemstate.h chip8/systimer.h
./chip8/tms.asm: chip8/tms.c chip8/tms.h datatypes.h hbios.h chip8/keys.h \
 chip8/systemstate.h
./chip8/tty.asm: chip8/tty.c chip8/tty.h hbios.h xstdio.h
./chip8/v9958.asm: chip8/v9958.c chip8/v9958.h datatypes.h chip8/systemstate.h
./chip8/ym2149.asm: chip8/ym2149.c chip8/ym2149.h chip8/audio.h datatypes.h \
 chip8/systemstate.h chip8/timers.h
./chip8asm/assembler.asm: chip8asm/assembler.c chip8asm/assembler.h datatypes.h \
 cpm.h chip8asm/emitters.h chip8asm/error_reports.h filereader.h cpm.h \
 chip8asm/labels.h chip8asm/systemstate.h chip8asm/token_parser.h \
 chip8asm/tokenreader.h token.h datatypes.h
./chip8asm/emitters.asm: chip8asm/emitters.c chip8asm/emitters.h datatypes.h \
 chip8asm/systemstate.h
./chip8asm/error.asm: chip8asm/error.c chip8asm/error.h hbios.h xstdio.h
./chip8asm/error_reports.asm: chip8asm/error_reports.c chip8asm/error_reports.h \
 datatypes.h chip8asm/error.h chip8asm/exit.h chip8asm/tokenreader.h \
 token.h datatypes.h
./chip8asm/exit.asm: chip8asm/exit.c
./chip8asm/expr.asm: chip8asm/expr.c chip8asm/expr.h chartesters.h datatypes.h \
 chip8asm/error.h chip8asm/error_reports.h chip8asm/exit.h \
 chip8asm/labels.h xstdlib.h
./chip8asm/labels.asm: chip8asm/labels.c chip8asm/labels.h datatypes.h \
 chip8asm/error_reports.h chip8asm/systemstate.h xstdio.h
./chip8asm/main.asm: chip8asm/main.c chip8asm/assembler.h datatypes.h \
 chip8asm/labels.h chip8asm/systemstate.h cpm.h xstdio.h
./chip8asm/systemstate.asm: chip8asm/systemstate.c chip8asm/systemstate.h \
 datatypes.h
./chip8asm/test_assembler.asm: chip8asm/test_assembler.c chip8asm/assembler.h \
 datatypes.h chip8asm/labels.h chip8asm/systemstate.h cpm.h \
 chip8asm/expr.h test_opcodes.h xstdio.h test_expectations.h datatypes.h \
 terminal_codes.h chip8asm/test_helper.h terminal_codes.h \
 chip8asm/tokenreader.h token.h
./chip8asm/tokenreader.asm: chip8asm/tokenreader.c chip8asm/tokenreader.h token.h \
 datatypes.h chartesters.h cpm.h datatypes.h chip8asm/error.h \
 chip8asm/exit.h filereader.h cpm.h
./chip8asm/token_parser.asm: chip8asm/token_parser.c chip8asm/token_parser.h \
 datatypes.h chip8asm/error_reports.h chip8asm/expr.h hbios.h \
 chip8asm/tokenreader.h token.h datatypes.h xstdio.h
./cpm.asm: cpm.c cpm.h hbios.h
./filereader.asm: filereader.c filereader.h cpm.h charconstants.h \
 datatypes.h
./hbios.asm: hbios.c hbios.h
./test_expectations.asm: test_expectations.c test_expectations.h \
 datatypes.h terminal_codes.h xstdio.h
./token.asm: token.c token.h datatypes.h charconstants.h chartesters.h \
 filereader.h cpm.h
./xstdio.asm: xstdio.c xstdio.h datatypes.h hbios.h
./chartesters.o: ./chartesters.asm
./chip8/audio.o: ./chip8/audio.asm
./chip8/byte_code_executor.o: ./chip8/byte_code_executor.asm
./chip8/configreader.o: ./chip8/configreader.asm
./chip8/configuration_loader.o: ./chip8/configuration_loader.asm
./chip8/error_reports.o: ./chip8/error_reports.asm
./chip8/fontsets.o: ./chip8/fontsets.asm
./chip8/hbios_audio.o: ./chip8/hbios_audio.asm
./chip8/instr_output.o: ./chip8/instr_output.asm
./chip8/instr_registerasm.o: ./chip8/instr_registerasm.asm
./chip8/instr_sound.o: ./chip8/instr_sound.asm
./chip8/instr_tms_output.o: ./chip8/instr_tms_output.asm
./chip8/instr_v9958_output/draw_planeasm.o: ./chip8/instr_v9958_output/draw_planeasm.asm ./chip8/v9958.inc
./chip8/instr_v9958_output/draw_rowasm.o: ./chip8/instr_v9958_output/draw_rowasm.asm ./chip8/v9958.inc
./chip8/instr_v9958_output/scroll_commonasm.o: ./chip8/instr_v9958_output/scroll_commonasm.asm ./chip8/v9958.inc
./chip8/instr_v9958_output/test_segmentasm.o: ./chip8/instr_v9958_output/test_segmentasm.asm ./chip8/v9958.inc
./chip8/instr_v9958_output.o: ./chip8/instr_v9958_output.asm
./chip8/keys.o: ./chip8/keys.asm
./chip8/key_monitor.o: ./chip8/key_monitor.asm
./chip8/main.o: ./chip8/main.asm
./chip8/random.o: ./chip8/random.asm
./chip8/stack.o: ./chip8/stack.asm
./chip8/sub_vx_vy_asm.o: ./chip8/sub_vx_vy_asm.asm
./chip8/systemstate.o: ./chip8/systemstate.asm
./chip8/test_configuration.o: ./chip8/test_configuration.asm
./chip8/test_instruction.o: ./chip8/test_instruction.asm
./chip8/test_system.o: ./chip8/test_system.asm
./chip8/timerasm.o: ./chip8/timerasm.asm
./chip8/timers.o: ./chip8/timers.asm
./chip8/tms.o: ./chip8/tms.asm
./chip8/tmsasm.o: ./chip8/tmsasm.asm ./chip8/v9958.inc
./chip8/tty.o: ./chip8/tty.asm
./chip8/v9958.o: ./chip8/v9958.asm
./chip8/v9958asm.o: ./chip8/v9958asm.asm ./chip8/v9958.inc
./chip8/video_detection.o: ./chip8/video_detection.asm
./chip8/vid_intasm.o: ./chip8/vid_intasm.asm ./hbios_sys.inc ./chip8/v9958.inc
./chip8/ym2149.o: ./chip8/ym2149.asm
./chip8/ym2149asm.o: ./chip8/ym2149asm.asm
./chip8asm/assembler.o: ./chip8asm/assembler.asm
./chip8asm/data.o: ./chip8asm/data.asm
./chip8asm/emitters.o: ./chip8asm/emitters.asm
./chip8asm/error.o: ./chip8asm/error.asm
./chip8asm/error_reports.o: ./chip8asm/error_reports.asm
./chip8asm/exit.o: ./chip8asm/exit.asm
./chip8asm/expr.o: ./chip8asm/expr.asm
./chip8asm/labels.o: ./chip8asm/labels.asm
./chip8asm/main.o: ./chip8asm/main.asm
./chip8asm/systemstate.o: ./chip8asm/systemstate.asm
./chip8asm/test_assembler.o: ./chip8asm/test_assembler.asm
./chip8asm/tokenreader.o: ./chip8asm/tokenreader.asm
./chip8asm/token_parser.o: ./chip8asm/token_parser.asm
./cpm.o: ./cpm.asm
./cpmasm.o: ./cpmasm.asm
./crt.o: ./crt.asm
./filereader.o: ./filereader.asm
./hbios.o: ./hbios.asm
./hbios_cio.o: ./hbios_cio.asm
./hbios_snd.o: ./hbios_snd.asm
./loader.o: ./loader.asm
./memap.o: ./memap.asm
./nonreloccrt.o: ./nonreloccrt.asm
./reloccrt.o: ./reloccrt.asm
./relocmem.o: ./relocmem.asm
./test_expectations.o: ./test_expectations.asm
./token.o: ./token.asm
./xstdio.o: ./xstdio.asm
./xstrtol.o: ./xstrtol.asm
./chip8/instr_v9958_output/draw_segmentasm.o: ./chip8/instr_v9958_output/draw_segmentasm.asm.m4 ./chip8/macros.inc.m4 ./chip8/v9958.inc
./chip8/instr_v9958_output/scrl_downasm.o: ./chip8/instr_v9958_output/scrl_downasm.asm.m4 ./chip8/macros.inc.m4 ./chip8/v9958.inc
./chip8/instr_v9958_output/scrl_leftasm.o: ./chip8/instr_v9958_output/scrl_leftasm.asm.m4 ./chip8/macros.inc.m4 ./chip8/v9958.inc
./chip8/instr_v9958_output/scrl_rightasm.o: ./chip8/instr_v9958_output/scrl_rightasm.asm.m4 ./chip8/macros.inc.m4 ./chip8/v9958.inc
./chip8/instr_v9958_output/scrl_upasm.o: ./chip8/instr_v9958_output/scrl_upasm.asm.m4 ./chip8/macros.inc.m4 ./chip8/v9958.inc
