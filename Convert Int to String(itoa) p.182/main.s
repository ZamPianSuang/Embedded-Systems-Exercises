		AREA	myData, DATA
		ALIGN
str		SPACE	20
	
		AREA	myCode, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		MOV		R0, #12345
		LDR		R1, =str
		BL		itoa
stop	B		stop
		ENDP
			
itoa	PROC
		PUSH	{r4 - r6, LR}
		MOV		R2, R0			; r2 = n
		MOV		R3, R1			; r3 = s
		
		; Build the string backward
		MOV		R6, #10			
loop1	CBZ		R2, done		; done if n = 0
		UDIV	R5, R2, R6		; r5 = n/10
		MLS		R4, R5, R6, R2	; r4 = r5*10 - r2 = lsb remainder
		ADD		R4, R4, #0x30	; n%10 + '0'
		STRB	R4, [R3], #1	; *p = n%10 + '0'
		UDIV	R2, R2, R6		; n /= 10
		B		loop1
		
done	MOV		R4, #0
		STRB	R4, [R3]		; *p = '\0'
		SUB		R3, R3, #1		; skip NULL
		
		; reverse the string
loop2	CMP		R3, R1			; compare p & s
		BLE		exit			; exit if p <= s
		LDRB	R4, [R3]
		LDRB	R5, [R1]
		STRB	R4, [R1]
		STRB	R5, [R3]
		ADD		R1, R1, #1		; s++
		SUB		R3, R3, #1		; p--
		B		loop2
		
exit	POP		{r4 - r6, PC}
		ENDP
		ALIGN
		END
			