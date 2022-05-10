; Implementing Linear Search
; Finding the Maximum value of an array
		AREA	myData, DATA, READWRITE
		ALIGN
array	DCD		-1,5,3,8,10,23,6,5,29,30
size	DCD		10
	
		AREA	findMax, CODE, READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
		
		; Identify the array size
		LDR		R3, =size
		LDR		R3, [R3]
		SUB		R3, R3, #1					; array index starts from 0
		
		; Initialize max Value and Location
		LDR		R4, =array				
		LDR		R0, [R4]					; R0 = default max
		MOV		R1, #0						; R1 = max Location
		
		MOV		R2, #0						; loop index i
	
loop	CMP		R2, R3						; compare i with size
		BGT		stop						; if (i >= size) stop
		LDR		R5, [R4, R2, LSL #2]		; array[i] = R4 + R2 * 4
		CMP		R5, R0						; compre with max
		MOVGT	R0, R5						; update max
		MOVGT	R1, R2						; update location
		ADD		R2, R2, #1					; update index i
		B		loop
	
stop	B		stop
		ENDP
		END
			