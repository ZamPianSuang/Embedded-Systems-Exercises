; A string is palindrome if the string is read the same forward and backward.

		AREA 	myData, DATA, READWRITE
		ALIGN	1
str		DCB		"rats live on no evil star", 0

		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R6, =str
		MOV		R5, R6
		
		; find the string length
		MOV		R2, #0				; R1 beginning of the string
strlen	LDRB	R4, [R5], #1
		CMP		R4, #0
		ADDNE	R2, R2, #1			; R2 end of the string
		BNE		strlen
		
		SUB		R2, R2, #1			; truncate the null terminator
		ADD		R2, R6, R2
		
		; check palindrome
cmpStr	LDRB	R3, [R6], #1		; start of string
		LDRB	R4, [R2], #-1		; end of string
		CMP		R3, R4
		MOVNE	R0, #0				; not palindrome
		BNE		stop
		CMP		R6, R2				; R6 == R2 before the last(or middle) is executed
		BLT		cmpStr				; because post-index is used
		
		MOV		R0, #1				; palindrome
	
stop	B		stop
		ALIGN
		ENDP
		END
			