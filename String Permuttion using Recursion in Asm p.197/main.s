		AREA	myData, DATA, READWRITE
		ALIGN
str		DCB		"ABC",0
result	SPACE	200				; reserve 200 bytes
sep		DCB		" ",0			; seperator

		AREA	string_permutation, CODE, READONLY
		EXPORT	__main
		ENTRY
__main	PROC
		
		LDR		r0, =str
		MOV		r1, #0			; start
		MOV		r2, #2			; end
		BL		permute
		

stop	B		stop
		ENDP
			
permute	PROC
		PUSH	{r4-r7, LR}
		
		MOV		r4, R0			; str
		MOV		r5, R1			; start
		MOV		r6, R2			; end
	
		CMP		R5, R6		
		BLT		else			; if(start < end)
		
then 	LDR		r0, =result
		LDR		r1, =sep
		BL		strcat			; strcat(result, sep)
		
		LDR		r0, =result
		MOV		r1, R4
		BL		strcat			; strcat(result, str)
		
		B		exit
		
else	MOV		r7, r5			; variable i = start
	
loop	ADD		r0, R4, R5		; r0 = str + start
		ADD		r1, R4, R7		; r1 = str + i
		BL		swap
		
		MOV		r0, R4			; str
		ADD		r1, R5, #1		; start + 1
		MOV		r2, r6			; end
		BL		permute			; recursive call
		
		ADD		r0, r4, r5		; str + start
		ADD		r1, r4, r7		; str + i
		BL		swap
		
		ADD		r7, r7, #1		; i++
check	CMP		r7, r6			; compare i & end
		BLE		loop
		
exit	POP	{r4-r7, PC}
		ENDP
			
; Concatenate two strings
strcat	PROC
loop2	LDRB	r2, [r0]
		CBZ		r2, copy
		ADD		r0, r0, #1
		B		loop2
		
copy	LDRB	r3, [r1], #1
		STRB	r3, [r0], #1
		CMP		r3, #0
		BNE		copy
		BX		LR
		ENDP
			
; Swap routine	
swap	PROC
		LDRB	r2, [r0]
		LDRB	r3, [r1]
		STRB	r3, [r0]
		STRB	r2, [r1]
		BX		LR
		ENDP
			
		ALIGN
		END
			