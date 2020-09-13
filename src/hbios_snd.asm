
	PUBLIC _hbSndReset, _hbSndVolume, _hbSndNote, _hbSndPlay, _hbSndPeriod

	SECTION CODE

BF_SND		EQU	$50
BF_SNDRESET	EQU	BF_SND + 0	; RESET SOUND SYSTEM
BF_SNDVOL	EQU	BF_SND + 1	; REQUEST SOUND VOL - L CONTAINS VOLUME (255 MAX, 0 SILENT) - SCALED AS REQUIRED BY DRIVER (EG: MAPS TO JUST 4 BIT RESOLUTION FOR SN76489)
BF_SNDPRD	EQU	BF_SND + 2	; REQUEST SOUND PERIOD - HL CONTAINS DRIVER SPECIFIC VALUE
BF_SNDNOTE	EQU	BF_SND + 3	; REQUEST NOTE - L CONTAINS NOTE - EACH VALUE IS QUARTER NOTE
BF_SNDPLAY	EQU	BF_SND + 4	; INITIATE THE REQUESTED SOUND COMMAND
BF_SNDQUERY	EQU	BF_SND + 5	; E IS SUBFUNCTION
BF_SNDDURATION	EQU	BF_SND + 6	; REQUEST DURATION HL MILLISECONDS
BF_SNDDEVICE	EQU	BF_SND + 7	; SOUND DEVICE INFO REQUEST

; BF_SNDQUERY SUBCOMMANDS
BF_SNDQ_STATUS		EQU	0
BF_SNDQ_CHCNT		EQU	BF_SNDQ_STATUS + 1	; RETURN COUNT OF CHANNELS
BF_SNDQ_VOLUME		EQU	BF_SNDQ_STATUS + 2	; 8 BIT NUMBER
BF_SNDQ_PERIOD		EQU	BF_SNDQ_STATUS + 3	; 16 BIT NUMBER
BF_SNDQ_DEV		EQU	BF_SNDQ_STATUS + 4	; RETURN DEVICE TYPE CODE AND IO PORTS - TYPE IN B, PORTS IN DE, HL

; extern byte hbSndReset(byte driver) __z88dk_fastcall;
_hbSndReset:
	PUSH	IX
	LD	B, BF_SNDRESET
  	LD 	C, L			; DRIVER INDEX
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

;extern byte hbSndVolume(hbSndParams* pParams) __z88dk_fastcall;
_hbSndVolume:
	PUSH	IX
	LD	C, (HL)
	INC	HL
	LD	L, (HL)
	LD	B, BF_SNDVOL
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

;extern byte hbSndNote(hbSndParams* pParams) __z88dk_fastcall;
_hbSndNote:
	PUSH	IX
	LD	C, (HL)
	INC	HL
	LD	A, (HL)
	INC	HL
	LD	H, (HL)
	LD	L, A
	LD	B, BF_SNDNOTE
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

;extern byte hbSndPeriod(hbSndParams* pParams) __z88dk_fastcall;
_hbSndPeriod:
	PUSH	IX
	LD	C, (HL)
	INC	HL
	LD	A, (HL)
	INC	HL
	LD	H, (HL)
	LD	L, A
	LD	B, BF_SNDPRD
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

;extern byte hbSndPlay(hbSndParams* pParams) __z88dk_fastcall;
_hbSndPlay:
	PUSH	IX
	LD	C, (HL)
	INC	HL
	LD	D, (HL)
	LD	B, BF_SNDPLAY
	RST	08
	LD	L, A			; RETURN SUCCESS/FAIL
	POP	IX
	RET

	SECTION IGNORE
