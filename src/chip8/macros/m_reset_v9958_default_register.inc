	;RESET DEFAULT STATUS REGISTER INDEX
	XOR	A
	OUT	(VDP_ADDR), A
	LD	A, 0x80 | 15
	OUT	(VDP_ADDR), A