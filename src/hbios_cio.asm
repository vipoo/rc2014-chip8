
	PUBLIC	_hbCioIn, _hbCioIst, _hbCioOut

	SECTION CODE

BF_CIO		EQU	$00
BF_CIOIN	EQU	BF_CIO + 0	; CHARACTER INPUT
BF_CIOOUT	EQU	BF_CIO + 1	; CHARACTER OUTPUT
BF_CIOIST	EQU	BF_CIO + 2	; CHARACTER INPUT STATUS
BF_CIOOST	EQU	BF_CIO + 3	; CHARACTER OUTPUT STATUS
BF_CIOINIT	EQU	BF_CIO + 4	; INIT/RESET DEVICE/LINE CONFIG
BF_CIOQUERY	EQU	BF_CIO + 5	; REPORT DEVICE/LINE CONFIG
BF_CIODEVICE	EQU	BF_CIO + 6	; REPORT DEVICE INFO

	;extern byte hbCioIn(hbCioParams* ) __z88dk_fastcall;
_hbCioIn:
	PUSH	IX

	LD	C, (HL)
	INC	HL
	PUSH	HL

	LD	B, BF_CIOIN
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL

	POP	BC
	LD	A, E
	LD	(BC), A

	POP	IX
	RET

	;extern byte hbCioIst(byte driver) __z88dk_fastcall;
_hbCioIst:
	PUSH	IX
	LD	B, BF_CIOIST
  	LD 	C, L			; DRIVER INDEX
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

	; extern byte hbCioOut(hbCioParams*) __z88dk_fastcall;
_hbCioOut:
	PUSH	IX
	LD	C, (HL)
	INC	HL
	LD	E, (HL)
	LD	B, BF_CIOOUT
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

	SECTION IGNORE
