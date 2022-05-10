; An n-digit number is Armstrong if the sum of the nth powers of
; its digits equals the number itself. Eg. 371, 1634, 54748, 1741725

		AREA	armstrong, CODE, READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
	
		LDR		R0, =371		; number to be checked
		MOV		R4, #0			; sum = 0
		MOV		R1, R0			; temp for number
		MOV		R3, #10			; loop i
		
loop	CBZ		R1, check
		UDIV	R6, R1, R3
		MLS		R2, R6, R3, R1	; R6 = R6*R3 - R1
		MUL		R3, R2, R2		; remainder^2
		MLA		R4, R3, R2, R4	; sum = sum + remainder^3
		MOVS	R3, #10
		MOV		R1, R6
		;UDIV	R1, R1, R3
		B		loop
		
check	CMP		R0, R4
		MOVEQ	R0, #1			; Armstrong
		MOVNE	R0, #0			; not armstrong
	
stop	B		stop
		ENDP
		END
			