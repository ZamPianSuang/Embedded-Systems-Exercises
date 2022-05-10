		AREA	myData, DATA, READWRITE
		ALIGN	4
str		DCB		"1234567",0				; 0x0012D687
	
		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
	
		LDR		R0, =str
		MOV		R2, #0			; result
		
loop	LDRB	R1, [R0], #1
		CBZ		R1, stop		
		CMP		R1, #0x30
		BLO		stop			; '0' = 0x30
		CMP		R1, #0x39
		BHI		stop			; '9' = 0x39
		SUB		R1, R1, #0x30	; *p - 0x30
		; MOV		R4, #10
		; MLA		R2, R2, R4, R1
		ADD		R3, R2, R2, LSL #2	; R3 = R2 + R2 * 4 = 5r2	
		ADD		R2, R1, R3, LSL #1	; R2 = R1 + R3 * 2 = R1 + 10r2 
		B		loop
	
stop	B		stop
		ENDP
		END
			