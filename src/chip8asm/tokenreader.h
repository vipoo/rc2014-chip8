#ifndef __TOKENREADER
#define __TOKENREADER

#include "token.h"
#include <stdbool.h>

typedef enum {
  TokenEnd,
  TokenAlphanumeric,
  TokenComma,
  TokenRangeOperator,
  TokenLabel,
  TokenExpression,
  TokenDown,
  TokenUp,
  TokenLeft,
  TokenRight,

  RegisterV0,
  RegisterV1,
  RegisterV2,
  RegisterV3,
  RegisterV4,
  RegisterV5,
  RegisterV6,
  RegisterV7,
  RegisterV8,
  RegisterV9,
  RegisterVA,
  RegisterVB,
  RegisterVC,
  RegisterVD,
  RegisterVE,
  RegisterVF,
  RegisterI,
  RegisterST,
  RegisterDT,
  RegisterIndexedI,

  InstructionRet,
  InstructionLd,
  InstructionDb,
  InstructionDs,
  InstructionDrw,
  InstructionCall,
  InstructionCls,
  InstructionAdd,
  InstructionSe,
  InstructionSne,
  InstructionJp,
  InstructionSkp,
  InstructionSknp,
  InstructionRnd,
  InstructionAnd,
  InstructionOr,
  InstructionShr,
  InstructionShl,
  InstructionSub,
  InstructionXor,
  InstructionBcd,
  InstructionLdf,
  InstructionKey,
  InstructionSubn,
  InstructionHigh,
  InstructionPlane,
  InstructionAudio,
  InstructionScrl
} TokenType;

#define MAX_LINE_LENGTH 256

typedef struct TokenStruct {
  char      currentLine[MAX_LINE_LENGTH];
  char      value[MAX_LINE_LENGTH];
  TokenType type;
  bool      isInstruction;
  bool      isVRegister;
} Token;

extern Token token;

#endif
