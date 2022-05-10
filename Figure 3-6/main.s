		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
	
strCpy	LDR		R1, =srcStr
		LDR		R0, =dstStr
loop	LDRB	r2, [r1], #1
		STRB	r2, [r0], #1
		CMP		r2, #0
		BNE		loop
		
stop	B		stop

		ENDP
		ALIGN
		AREA	myData, DATA, READWRITE
		ALIGN
srcStr	DCB		"The Source String",0
dstStr	DCB		"The Destination string",0

		END