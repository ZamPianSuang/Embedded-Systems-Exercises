		AREA	myData, DATA, READONLY
		ALIGN
s		SPACE	4
a		DCD		1
b		DCD		2
c		DCD		0
	
		AREA	myCode, CODE
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
		LDR		R1, =a
		LDR		R2, [R1]
		LDR		R3, =b
		LDR		R4, [R3]
		ADDS	R5, R2, R4
		LDR		R6, =c
		STR		R5, [R6]
stop	B		stop
		ENDP
		END
			