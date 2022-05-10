		AREA	myData, DATA
		ALIGN
matrix	DCD		1,2,3,4,5,6,7,8,9
	
		AREA	Matrix_Transpose, CODE
		EXPORT	__main
		ENTRY
__main	PROC
	
		LDR		R0, =matrix
	
stop	B		stop
		ENDP
			
		ALIGN
		END
			