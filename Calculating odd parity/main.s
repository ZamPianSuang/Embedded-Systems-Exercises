		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
	
		MOV		R0, #0xAA	; number to be checked
		MOV		R1, #0		; odd parity-1, even parity-0
		
loop	CBZ		R0, stop
		CMP		R1, #0
		MOVEQ	R1, #1
		MOVNE	R1, #0
		SUBS	R2, R0, #1	; n-1
		ANDS	R0, R0, R2	; n & (n-1)	
		B		loop
	
vcstop	B		stop
		ENDP
		END
			