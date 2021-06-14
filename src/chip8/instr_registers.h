
#ifndef __INSTR_REGISTERS
#define __INSTR_REGISTERS

#include "fontsets.h"
#include "timers.h"

uint8_t *register2ndNibble;


static byte units;
static byte hundreds;
static byte tens;

void bcdIVx() {
  const byte x = registers[nibble2nd];

  const byte im = x / 10;
  units = x - im * 10;
  hundreds = im / 10;
  tens = im - hundreds * 10;

  byte *p = (byte *)registerI;
  *p++ = hundreds;
  *p++ = tens;
  *p++ = units;
}

void ldfIVx() {
  const byte x = registers[nibble2nd];

  registerI = (uint16_t)&fonts[x * 5];
}

#endif
