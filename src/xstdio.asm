
	SECTION	CODE

	PUBLIC	_xprintf
	EXTERN	_printf


_xprintf:
		EXX
		ld	(SAVE_REGS), HL
		POP	HL		; RETURN ADDRESS
		LD	(SAVE_RET), HL
		EXX
		CALL	_printf
		EXX
		LD	HL, (SAVE_REGS)
		EXX
		JP	0
SAVE_RET	EQU	$-2
SAVE_REGS:
	DS	2
