#include "test_system.h"
#include "systemstate.h"
#include "timers.h"
#include "ym2149.h"
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

bool appRunning = false;

char buffer[MAX_CAPTURE_TEXT];

void resetCaptureCommands() { buffer[0] = '\0'; }

void sendDrawCommands(const char *msg, ...) {
  va_list arg;
  va_start(arg, msg);
  char *pBuffer = buffer + strlen(buffer);
  int   max = MAX_CAPTURE_TEXT - strlen(buffer);
  vsnprintf(pBuffer, max - 1, (char *)msg, arg);
  va_end(arg);
}

bool simulateKeyReady;
char simulatedKeyValue;

void resetKeySimulator() {
  simulateKeyReady = false;
  simulatedKeyValue = 0;
  currentPressedKey = '\0';
  keyPressed = false;
  currentKeyTimeout = 0;
}

byte keyReady() { return simulateKeyReady; }

char getKey() { return simulatedKeyValue; }

void simulateKey(const char k) {
  simulateKeyReady = true;
  simulatedKeyValue = k;
  timerTick += 4;
}

uint16_t getSysTimer() { return timerTick; }

void simulateTimerTick() {
  timerTick++;
  manageTimers();
}

byte nextRandomNumber = 0;

byte chip8Rand() { return nextRandomNumber; }

void simulateRandomNumber(byte b) { nextRandomNumber = b; }

void updateMachineStateDisplay() {}

void tmsDriverNotFound() {}

void ym2149Play(uint16_t period) __z88dk_fastcall { (void *)period; }

void ym2149Stop() {}

uint8_t getControllerDirection(uint8_t port) __z88dk_fastcall {
  (void)port;

  return 0;
}

uint8_t getControllerButton(uint8_t b) __z88dk_fastcall { return b; }

bool ym2149Probe() { return false; }

audioCommand command;
