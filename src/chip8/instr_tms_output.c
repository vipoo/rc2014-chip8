
#include "instr_tms_output.h"
#include "systemstate.h"
#include "tms.h"
#include "vid_int.h"
#include <string.h>

typedef struct {
  byte x;
  byte y;
  byte data;
  byte topBits;
  byte bottomBits;
  byte length;
} bitsDrawCommand;

static bitsDrawCommand drawCommand;

#define PIXEL_WIDTH  64
#define PIXEL_HEIGHT 32

#define CHAR_FRAME_SIZE (PIXEL_WIDTH / 2 * PIXEL_HEIGHT / 2)
#define CHAR_FRAME_MASK (CHAR_FRAME_SIZE - 1)

static uint8_t  charFrameBuffer[CHAR_FRAME_SIZE];
static uint16_t currentFrameBufferIndex = 0;

void drawBits() {
  // clang-format off
  __asm
	ld	a, (_currentFrameBufferIndex + 1)
  and a, 0x01
	ld	(_currentFrameBufferIndex + 1), a
  __endasm;
  // clang-format on

  tmsSetWriteAddr(TMS_MD1_NAME_TABLE + currentFrameBufferIndex);
  drawCommand.data = charFrameBuffer[currentFrameBufferIndex];

  if (drawCommand.topBits & 0x2) {
    drawCommand.data ^= 1; // top left
    if ((drawCommand.data & 1) == 0)
      registers[0xF] = 1;
  }

  if (drawCommand.topBits & 1) {
    drawCommand.data ^= 2; // top right
    if ((drawCommand.data & 2) == 0)
      registers[0xF] = 1;
  }

  if (drawCommand.bottomBits & 2) {
    drawCommand.data ^= 4; // bottom left
    if ((drawCommand.data & 4) == 0)
      registers[0xF] = 1;
  }

  if (drawCommand.bottomBits & 1) {
    drawCommand.data ^= 8; // bottom right
    if ((drawCommand.data & 8) == 0)
      registers[0xF] = 1;
  }

  charFrameBuffer[currentFrameBufferIndex] = drawCommand.data;
  tmsWriteByte(drawCommand.data);
}

inline void incrementXBy2() {
  drawCommand.x += 2;
  currentFrameBufferIndex += 1;

  if (drawCommand.x >= 64 && drawCommand.x <= 65)
    currentFrameBufferIndex -= (32);
}

inline void decrementXBy2() {
  drawCommand.x -= 2;
  currentFrameBufferIndex -= 1;

  if (drawCommand.x >= 62 && drawCommand.x <= 63)
    currentFrameBufferIndex += (32);
}

inline void moveToNextRow() {
  drawCommand.y += 2;
  currentFrameBufferIndex += (32 - 4);
  drawCommand.x -= 8;

  if (drawCommand.x >= 56 && drawCommand.x <= 63)
    currentFrameBufferIndex += (32);
}

inline void moveTo(byte xx, byte yy) {
  drawCommand.y = yy & (PIXEL_HEIGHT - 1);
  drawCommand.x = xx & (PIXEL_WIDTH - 1);
  currentFrameBufferIndex = (drawCommand.y << 4) + (drawCommand.x >> 1);
}

static byte topPixelData;
static byte bottomPixelData;

void drawBytesEven() {
  byte end = drawCommand.x + 8;
  for (; drawCommand.x < end; incrementXBy2()) {
    drawCommand.topBits = (topPixelData & 0xC0) >> 6;
    drawCommand.bottomBits = (bottomPixelData & 0xC0) >> 6;
    bottomPixelData <<= 2;
    topPixelData <<= 2;
    drawBits();
  }
}

void drawBytesOdd() {
  drawCommand.topBits = (topPixelData & 0x80) >> 7;
  drawCommand.bottomBits = (bottomPixelData & 0x80) >> 7;
  bottomPixelData <<= 1;
  topPixelData <<= 1;

  drawBits();
  incrementXBy2();

  byte end = drawCommand.x + 7;

  for (; drawCommand.x < end; incrementXBy2()) {
    drawCommand.topBits = (topPixelData & 0xC0) >> 6;
    drawCommand.bottomBits = (bottomPixelData & 0xC0) >> 6;
    bottomPixelData <<= 2;
    topPixelData <<= 2;
    drawBits();
  }

  decrementXBy2();
}

void drawSpriteEvenEven() __z88dk_fastcall {
  byte *p = (byte *)registerI;

  if (drawCommand.length & 1) {
    for (byte i = 0; i < drawCommand.length - 1; i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesEven();
      moveToNextRow();
    }

    topPixelData = *p++;
    bottomPixelData = 0;
    drawBytesEven();
  } else
    for (byte i = 0; i < drawCommand.length; i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesEven();
      moveToNextRow();
    }
}

void drawSpriteOddEven() __z88dk_fastcall {
  byte *p = (byte *)registerI;

  if (drawCommand.length & 1) {
    for (byte i = 0; i < drawCommand.length - 1; i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesOdd();
      moveToNextRow();
    }

    topPixelData = *p++;
    bottomPixelData = 0;
    drawBytesOdd();
  } else
    for (byte i = 0; i < drawCommand.length; i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesOdd();
      moveToNextRow();
    }
}

void drawSpriteEvenOdd() __z88dk_fastcall {
  byte *p = (byte *)registerI;
  topPixelData = 0;
  bottomPixelData = *p++;
  drawBytesEven();
  moveToNextRow();

  if (drawCommand.length == 1)
    return;

  if (drawCommand.length >= 3)
    for (byte i = 0; i < ((drawCommand.length - 1) & 0xFE); i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesEven();
      moveToNextRow();
    }

  if (drawCommand.length & 1)
    return;

  topPixelData = *p;
  bottomPixelData = 0;
  drawBytesEven();
}

void drawSpriteOddOdd() __z88dk_fastcall {
  byte *p = (byte *)registerI;
  topPixelData = 0;
  bottomPixelData = *p++;
  drawBytesOdd();
  moveToNextRow();

  if (drawCommand.length == 1)
    return;

  if (drawCommand.length >= 3)
    for (byte i = 0; i < ((drawCommand.length - 1) & 0xFE); i += 2) {
      topPixelData = *p++;
      bottomPixelData = *p++;
      drawBytesOdd();
      moveToNextRow();
    }

  if (drawCommand.length & 1)
    return;

  topPixelData = *p;
  bottomPixelData = 0;
  drawBytesOdd();
}

static tmsClearParams clsParams = {TMS_MD1_NAME_TABLE, 0x400, 0};

void tmsCls() {
  tmsClearData(&clsParams);
  memset(charFrameBuffer, 0, sizeof(charFrameBuffer));
}

static void buildPatternData(byte *pData) {
  for (byte i = 0; i < 16; i++) {
    byte top = 0;
    byte bottom = 0;

    if (i & 0x1) {
      top = 0xF0;
    }
    if (i & 0x2) {
      top |= 0x0F;
    }
    if (i & 0x4) {
      bottom = 0xF0;
    }
    if (i & 0x8) {
      bottom |= 0x0F;
    }

    *pData++ = top;
    *pData++ = top;
    *pData++ = top;
    *pData++ = top;
    *pData++ = bottom;
    *pData++ = bottom;
    *pData++ = bottom;
    *pData++ = bottom;
  }
}

void tmsInitPatterns() {
  byte          pixelData[8 * 16];
  tmsDataParams patternParams = {TMS_MD1_PATTERN_TABLE, sizeof(pixelData), pixelData};

  buildPatternData(pixelData);
  tmsWriteData(&patternParams);
}

static byte xx;
static byte yy;

void tmsDraw() {
  drawCommand.length = fourthNibble;
  xx = registers[nibble2nd];
  yy = registers[nibble3rd];

  registers[0xF] = 0;

  moveTo(xx & 0xFE, yy & 0xFE);

  const bool oddOnX = xx & 1;
  const bool oddOnY = yy & 1;
  if (oddOnX) {
    if (oddOnY)
      drawSpriteOddOdd();
    else
      drawSpriteOddEven();
  } else {
    if (oddOnY)
      drawSpriteEvenOdd();
    else
      drawSpriteEvenEven();
  }
}

static tmsClearParams colourParams = {TMS_MD1_COLOUR_TABLE, 32, (COL_DRKGREEN << 4) + COL_BLACK};

void tmsVideoInit() {
  vsyncInstallInterruptHandler();

  tmsInit();
  tmsRegisterColours(gameColours[0], gameColours[1]);
  colourParams.data = (gameColours[1] << 4) + gameColours[0];
  tmsSetMode1();
  tmsClearData(&colourParams);
  tmsInitPatterns();
  tmsCls();
}
