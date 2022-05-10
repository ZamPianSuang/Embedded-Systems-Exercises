		AREA	myData, DATA
		ALIGN
str1	DCB		"Shaking",0
str1_	SPACE	20				;reserve space
str2	DCB		" hands",0

		AREA	my_strcat, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =str1		;r0 = 1st argument
		LDR		R1, =str2		;r1 = 2nd argument
		BL		strcat
stop	B		stop
		ENDP

strcat	PROC
loop	LDRB	R2, [R0]
		CBZ		R2, copy
		ADD		R0, R0, #1		;increment byte
		B		loop
		
copy	LDRB	R2, [R1], #1
		CMP		R2, #0
		BEQ		exit
		STRB	R2, [R0], #1
		B		copy
exit	BX		LR
		ENDP
		ALIGN
		END
			