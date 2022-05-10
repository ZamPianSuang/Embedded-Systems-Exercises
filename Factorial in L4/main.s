		AREA	factorial, CODE, READONLY
		EXPORT	__main
		ENTRY
__main	PROC
	
		MOV		r0, #5		; factorial(5)
		BL		fact
	
stop	B		stop
		ENDP
			
fact	PROC
		PUSH	{r4, LR}
		MOV		R4, r0		; r4 = r0
		
		CMP		R4, #1		
		BNE		else		; if(n != 1) n * fact(n-1)	
			
		MOV		r0, #1		; if(n == 1) return 1
loop	POP		{r4, PC}

else	SUB		r0, R4, #1	; n = n-1
		BL		fact
		MUL		r0, r4, r0  ; n * f(n-1)
		B		loop
		ENDP
			
		ALIGN
		END
			