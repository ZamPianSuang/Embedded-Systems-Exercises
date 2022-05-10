; Implementing Binary Search
; Note the input must be already sorted
		AREA	myData, DATA, READWRITE
		ALIGN
array	DCD		-3,-18,11,12,14,15,16
size	DCD		7
	
		AREA	myCode, CODE, READONLY
		EXPORT	__main
		ENTRY
		ALIGN
__main	PROC
	
		LDR		R0, =array
		LDR		R4, =-18			; R4 = target
		
		MOV		R1, #0			; R1 = left = 0
		
		LDR		R2, =size
		LDR		R2, [R2]
		SUB		R2, R2, #1		; R2 = right = size - 1
		
loop	CMP		R1, R2
		BGT		stop			; if left > right
		ADD		R3, R1, R2		; left + right
		LSR		R3, R3, #1		; R3 = middle = (left+right)/2
		
		LDR		R5, [R0, R3, LSL #2]	; middle value
		CMP		R4, R5			
found	MOVEQ	R7, R3			; found target
		ADDGT	R1, R3, #1		; left = middle + 1
		SUBLT	R2, R3, #1		; right = middle - 1
		B		loop
	
stop	B		stop
		ENDP
		END
			