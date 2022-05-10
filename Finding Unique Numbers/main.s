; Find all unique numbers by removing duplicate numbers

		AREA	myData, DATA
		ALIGN
array	DCD		7,1,7,2,1
		DCD		3,1,2,4,5
		DCD		2,3,2,6,7
		DCD		2,3,2,6,7
			
size	DCD		20
			
		AREA	remove_duplicates, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =array
		LDR		R1, =size
		LDR		R1, [R1]
		BL		remove_dup
	
stop	B		stop
		ENDP
		
; r0 = array pointer, r1 = size		
; r5 = i, r6 = j, r7 = k
remove_dup	PROC
		PUSH	{r4-r8, LR}
		MOV		R5, #0			; i = 0
		
loop_i	CMP		R5, R1			; i < size ?
		BGE		exit			; if (i >= size)
		ADD		R6, R5, #1		; <j = i+1>
		
loop_j	CMP		R6, R1			; j < size ?
		BGE		ex_j			; if (j >= size)					
		LDR		R8, [R0, R5, LSL #2]		; array[i]
		LDR		R4, [R0, R6, LSL #2]		; array[j]
		CMP		R4, R8			; array[i] == array[j] ?
		BNE		ifnot			; if (array[i] != array[j])
		; if array[i] == array[j], shift left by one position
		MOV		R7, R6			; k = j
		SUB		R2, R1, #1		; <r2 = size-1>
		
shift	CMP		R7, R2			; k < size-1 ?
		BGE		ex_k			; if (k >= size-1)
		ADD		R3, R7, #1		; r3 = k+1
		LDR		R4, [R0, R3, LSL #2]		; array[k+1]
		STR		R4, [R0, R7, LSL #2]		; array[k] = array[k+1]
		ADD		R7, R7, #1		; k = k+1
		B		shift

ex_k	SUB		R1, R1, #1		; size = size-1
		ADD		R6, R6, #1		; j = j+1
		B		loop_i

ifnot	ADD		R6, R6, #1		; j = j+1
		B		loop_j

ex_j	ADD		R5, R5, #1		; i = i+1
		B		loop_i	

exit	MOV		R0, R1			; return size
		POP		{r4-r8, PC}
		
		ENDP
		ALIGN
		END
			