		AREA	myData, DATA
		ALIGN
result	DCD		4			; allocate 4 bytes

		AREA	GCD, CODE
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
	
		MOV		R0, #21		; 1st argument
		MOV		R1, #28		; 2nd argument
		
		BL		gcd
		
		;GCD is returned in R0
		LDR		R2, =result
		STR		R0, [R2]
	
stop	B		stop
		ENDP

gcd		PROC
		;r0 = 1st argument = a
		;r1 = 2nd argument = b
		; if a < b, swap a & b
		CMP		R0, R1
		MOVLT	R2, R0
		MOVLT	R0, R1
		MOVLT	R1, R2
		
loop	CBZ		R1, exit		; if b==0, exit
		SDIV	R3, R0, R1		; r3=r0/r1
		MLS		R2, R3, R1, R0	; R2 = R3*R1 - R0
		MOV		R0, R1			; a = b
		MOV		R1, R2			; b = remainder
		B		loop
		
exit	BX		LR
		ENDP
		END
			