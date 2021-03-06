#ifndef __TOKEN_PARSER
#define __TOKEN_PARSER

#include "datatypes.h"

#define REGISTER_I 17

extern byte     expectToBeByte();
extern byte     expectToBeNibble();
extern byte     expectToBeVRegister();
extern uint16_t expectToBeInt();
extern uint16_t expectToBeInt16();
extern void     expectToBeComma();
extern void     expectToBeIRegister();
extern void     expectToBeIndexedI();
extern void     expectToBeOneOfVxOrIOrStOrDt();
extern void     expectToBeOneOfVxOrIOrIndexedIOrStOrDt();
extern void     expectToBeVxOrIRegister();
extern void     expectRangeOperator();

extern void expectToBeST();
extern void expectToBeDT();

extern void expectToBeDown();
extern void expectToBeUp();
extern void expectToBeLeft();
extern void expectToBeRight();

#define currentIsIRegister()     (token.type == RegisterI)
#define currentIsST()            (token.type == RegisterST)
#define currentIsVRegister()     (token.isVRegister)
#define currentIsDT()            (token.type == RegisterDT)
#define currentIsIndexedI()      (token.type == RegisterIndexedI)
#define currentIsComma()         (token.type == TokenComma)
#define currentIsBCD()           (token.type == TokenBCD)
#define currentIsRangeOperator() (token.type == TokenRangeOperator)
#define currentIsDown()          (token.type == TokenDown)
#define currentIsUp()            (token.type == TokenUp)
#define currentIsLeft()          (token.type == TokenLeft)
#define currentIsRight()         (token.type == TokenRight)

#endif
