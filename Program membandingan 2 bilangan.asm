.MODEL SMALL
.CODE
ORG 100h

Data:	
    JMP Proses
	BilX DB 8
	BilY DB 10  
	Kal0 DB 'Bilangan X lebih kecil dari bilangan Y $'
	Kal1 DB 'Bilangan X lebih besar dari bilangan Y $'
	Kal2 DB 'Bilangan X besarnya sama dengan bilangan Y $' 
	
Proses:
	MOV AL, BilX
	CMP AL, BilY 
	JB XKecil
	JE Sama
	JA Xbesar
    
	
Xkecil: 
    MOV AH, 09h
    LEA DX, Kal0
    MOV BH, 00h
    MOV BL, 11110011b
    MOV CX, 38
    INT 10h   
	JMP Cetak  
	
Sama:	 
	MOV AH, 09h
	LEA DX, Kal2
    MOV BH, 00h
    MOV BL, 10100101b
    MOV CX, 42
    INT 10h  
	JMP Cetak 
	
Xbesar:       
	MOV AH, 09h  
	LEA DX, Kal1
    MOV BH, 00h
    MOV BL, 11001111b
    MOV CX, 38
    INT 10h  
	JMP Cetak 
	
	
Cetak:
    INT 21h 

	
Exit: INT 20h
END DATA