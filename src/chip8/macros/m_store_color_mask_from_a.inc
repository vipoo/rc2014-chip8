	; TASK LOWER 4 BIT COLOUR CODE IN A
	; ADD DUPLICATE TO UPPER NIBBLE
	; THEN STORE IN COLOR_MASK

	LD	C, A
	RRCA
	RRCA
	RRCA
	RRCA
	OR	C
	LD	(COLOR_MASK), A
