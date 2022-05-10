		AREA	myData, DATA
		ALIGN
str1	DCB		"cat",0
str2	DCB		"dog",0
result	DCW		0

		AREA	compare, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =str1
		LDR		R1, =str2
		BL		strcmp
		LDR		R1, =result
		STR		R0, [R1]
stop	B		stop
		ALIGN
		ENDP
			
strcmp	PROC
loop	LDRB	R2, [R0], #1
		LDRB	R3, [R1], #1
		CBZ		R2, exit
		CMP		R2, R3			;if *s == *t
		BEQ		loop
		
exit	SUB		R0, R2, R3		;r0 = *s - *t
		BX		LR
		ENDP
		
		END
			