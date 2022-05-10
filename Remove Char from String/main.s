		AREA	myData, DATA
str		DCB		"Less is more",0

		AREA	removeChar, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =str
		MOVS	R1, #'e'
		BL		remove
	
stop	B		stop
		ENDP
			
remove	PROC
		MOV		R2, R0
loop	LDRB	R3, [R2], #1	; loop counter
		CBZ		R3, exit		; exit on NULL
		CMP		R1, R3
		BEQ		loop			; if same
		STRB	R3, [R0], #1	; store
		B		loop
		
exit	STRB	R3, [R0]
		BX		LR
		ENDP
		ALIGN
		END
			