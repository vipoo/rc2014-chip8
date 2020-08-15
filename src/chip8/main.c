#include "chip8/byte_code_executor.h"
#include "chip8/instr_output.h"
#include "cpm.h"
#include "datatypes.h"
#include "hbios.h"
#include "systemstate.h"
#include "xstdio.h"
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

void chkMsg(int result, const char *msg) {
  if (result) {
    xprintf("%s\r\n", msg);
    exit(1);
  }
}

void main() {
  print("running ch8 app\r\n");

  cls();

  initSystemState();

  uint16_t *ptr = programStorage;
  int       noMoreData = 0;

  chkMsg(fOpen(defaultFCB), "Unable to open file");

  while (!noMoreData) {
    chkMsg(fDmaOff(ptr), "dma");
    ptr += 64;
    noMoreData = fRead(defaultFCB);
  }
  chkMsg(fClose(defaultFCB), "unable to close");

  while (executeSingleInstruction())
    ;

  xprintf("\033[33;0Hprogram end\r\n");

  for (int i = 0; i < 16; i++) {
    xprintf("  V%X = %02X\r\n", i, (int)registers[i]);
  }

  xprintf("  I = %04X\r\n", registerI);
}
