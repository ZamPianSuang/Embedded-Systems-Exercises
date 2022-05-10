; If the sum of all proper divisors of a positive number
; equals the number itself, this number is a perfect number. Eg. 6,28,496,8128

		AREA	perfect, CODE, READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
		
		MOV		R1, #28		; num
		MOV		R2, #0		; sum
		MOV		R3, #1		; loop i
		
loop	CMP		R3, R1		
		BHS		check			; if R3 >= R1
		UDIV	R4, R1, R3		; q = floor(n/i)
		MLS		R4, R3, R4, R1	; r = n - i*q
		CMP		R4, #0			; if (r==0)
		ADDEQ	R2, R2, R3		; sum = sum + i
		ADDS	R3, R3, #1		; i = i + 1
		B 		loop
		
check	CMP		R2, R1			
		MOVEQ	R0, #1			; perfect number
		MOVNE	R0, #0			; not perfect number
		
stop	B		stop
		ENDP
		END
			