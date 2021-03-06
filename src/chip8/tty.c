#include "chip8/tty.h"
#include "hbios.h"
#include "xstdio.h"
#include <stdarg.h>
#include <stdio.h>

void sendDrawCommands(const char *msg, ...) {
  va_list arg;
  va_start(arg, msg);
  vsnprintf(xbuffer, MAX_MESSAGE_TEXT - 1, (char *)msg, arg);
  va_end(arg);
  print(xbuffer);
}
