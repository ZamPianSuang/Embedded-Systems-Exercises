		AREA	myData, DATA
		ALIGN
array	DCD		2
	
		AREA	code, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		MOV		R0, #1		;1st argument, value
		LDR		R1, =array	;2nd argument, pointer
		MOV		R2, #1		;3rd argument, size
		
		BL		insert
	
stop	B		stop
		;ALIGN
		ENDP
	
; r0 = value, r1 = array, r2 = size
insert	PROC
		PUSH	{R4, LR}
loop	CMP		R2, #0					; check i>0
		BLE		done					; done if i <= 0
		SUB		R4, R2, #1				; r4 = i-1
		LDR		R4, [R1, R4, LSL #2]	; a[i-1]
		CMP		R0, R4
		BGE		done
		STR		R4, [R1, R2, LSL #2]	; a[i]
		SUB		R2, R2, #1
		B		loop
		
done	STR		R0, [R1, R2, LSL #2]	; a[i] = v
		POP		{R4, PC}				; exit			
		
		ENDP
		ALIGN
		END
			