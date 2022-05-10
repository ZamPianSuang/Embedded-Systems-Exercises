		AREA	myData, DATA, READWRITE
		ALIGN
str		DCB		"!sknaht ,em desrever tsuj uoy ,hO",0	; Oh, you just reversed me, thanks!

		AREA	reverse_string, CODE, READONLY
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =str
		MOV		R1, #0			; start
		MOV		R2, #32			; end = n-1
		BL		reverse
stop	B		stop
		ENDP
			
swap	PROC					; swap routine
		LDRB	r2, [r0]		; temp = *x
		LDRB	r3, [r1]
		STRB	r3, [r0]		; *x = y
		STRB	r2, [r1]		; *y = temp
		BX		LR
		ENDP
			
reverse	PROC
		PUSH	{r4 - r6, LR}
		MOV		R6, R0			; string pointer
		MOV		R4, R1			; start position
		MOV		R5, R2			; end position
		
		CMP		R4, R5			; check start <= end
exit	POPEQ	{r4 - r6, PC}	; POP if start == end

		ADD		R0, R6, R4		; [str + start]
		ADD		R1, R6, R5		; [str + end]

		BL		swap
		
		ADD		R4, R4, #1		; start++
		SUB		R5, R5, #1		; end--
		
		MOV		R0, R6
		MOV		R1, R4
		MOV		R2, R5
		
		BL		reverse
		POP		{r4 - r6, PC}
		
		ENDP
		ALIGN
		END
			