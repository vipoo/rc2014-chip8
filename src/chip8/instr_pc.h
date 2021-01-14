inline uint8_t call() {
  if (addr < 0x200) {
    xprintf("Illegal jump to %04X at %p\r\n", addr, chip8PC - 1);
    return true;
  }

  pushPc();
  chip8PC = (uint16_t *)addr;

  return false;
}

#define ret() popPc()

#define testForLargeInstruction()             \
  {                                           \
    if (*chip8PC == LOAD_I_LARGE_INSTRUCTION) \
      chip8PC += 1;                           \
  }

inline void seVxByte() {
  if (registers[nibble2nd] == lowByte) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline void seVxVy() {
  if (registers[nibble2nd] == registers[nibble3rd]) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline void sneVxByte() {
  if (registers[nibble2nd] != lowByte) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline void sneVxVy() {
  if (registers[nibble2nd] != registers[nibble3rd]) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline uint8_t jp() {
  if (addr < 0x200) {
    xprintf("Illegal jump to %04X at %p\r\n", addr, chip8PC - 1);
    return true;
  }

  chip8PC = (uint16_t *)addr;
  return false;
}

inline uint8_t jpV0Addr() {
  chip8PC = (uint16_t *)(addr + registers[0]);

  if ((uint16_t)chip8PC < 0x200) {
    xprintf("Illegal jump to %04X at %p\r\n", addr, chip8PC - 1);
    return true;
  }

  return false;
}

inline void skpVx() {
  if (keyPressed && registers[nibble2nd] == currentPressedKey) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline void sknpVx() {
  if (!keyPressed || registers[nibble2nd] != currentPressedKey) {
    testForLargeInstruction();
    chip8PC += 1;
  }
}

inline void keyVx() {
  if (keyPressed) {
    registers[nibble2nd] = currentPressedKey;
    return;
  }
  chip8PC -= 1;
}
