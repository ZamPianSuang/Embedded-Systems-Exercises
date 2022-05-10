; Implementing Bubble Sort in ascending order

		AREA	myData, DATA, READWRITE
		ALIGN
array	DCD		12,11,10,9,8,7,6,5,4,3,2,1,-6,-9
size	DCD		14
	
		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =array
		
		LDR		R1, =size
		LDR		R1, [R1]
		SUB		R1, R1, #1		; i = size-1 // {0 - (n-1)}
		
loop_i	CMP		R1, #0			; for(i = size-1; i > 0; i--) // {(n-1) - 1}
		BLE		stop			; if (i <= 0) stop
		
		MOV		R2, #1			; j = 1
loop_j	CMP		R2, R1			; for(j = 1; j <= i; j++) // {1 - i}
		SUBGT	R1, R1, #1		; i--
		BGT		loop_i			; if (j > i) loop_i
		
		SUB		R3, R2, #1		; R3 = j-1
		
		LDR		R5, [R0, R3, LSL #2]	; R4 = array[j-1]
		LDR		R4, [R0, R2, LSL #2]	; R5 = array[j]

		CMP		R5, R4					; if array[j-1] > array[j]
		STRGT	R4, [R0, R3, LSL #2]	; R4 = array[j]
		STRGT	R5, [R0, R2, LSL #2]	; R5 = array[j-1]
		
		ADD		R2, R2, #1		; j++
		B		loop_j
		
stop	B		stop
		ALIGN
		ENDP
		END
			