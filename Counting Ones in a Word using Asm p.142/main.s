; Hamming distance = the number of different bits in two words
; Let C = A \oplus B, the Hamming distance of A and B equals the number of Ones in C.
		AREA	Count_Ones, CODE, READONLY
		EXPORT	__main
		ALIGN
		ENTRY
__main	PROC
		; r0 = Input = x
		; r1 = Number of Ones = counter
		
		LDR		r0, =0xFAAAAAAA		; 0xAAAAAAAA has 16 Ones
		
		; r1 = r0 >> 31
		MOV		r1, r0, LSR #31		; get the MSB bit
		
		; r0 = r0 << 2 and change Carry
loop	MOVS	r0, r0, LSL #2		; move left by 2 bits

		; r1 = r1 + r0 >> 31 + Carry
		ADC		r1, r1, r0, LSR #31	; get the MSB bit of r0, the 2nd MSB is in Carry
		BNE		loop				; check if Z flag = 1 (r0 = 0)
		
stop	B		stop
		ENDP
		END