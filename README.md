# Program_Membandingka_2_Bilangan



.MODEL SMALL
.CODE
ORG 100h
 
DATA:
    JMP Output	
	Judul DB 10,13,10,13,'=== Program Membandingkan 2 Bilangan Bulat === $'  
	Garis DB 10,13,'============================================== $'
	bil1  DB 10,13,'Masukkan bilangan pertama  : $'
	bil2  DB 10,13,'Masukkan bilangan kedua    : $' 
	Kal1  DB 10,13,'Bilangan ke-1 lebih kecil dari bilangan ke-2 $'
	Kal2  DB 10,13,'Bilangan ke-1 lebih besar dari bilangan ke-2 $'
	Kal3  DB 10,13,'Bilangan ke-1 besarnya sama dgn bilangan ke-2 $'
	Ty    DB 10,13,10,13,'Terimakasih telah menggunakan aplikasi ini ^_^ $'

Output:
    
    MOV DX, OFFSET Judul
    MOV AH, 09h
    INT 21h
    
    MOV DX, OFFSET Garis
    MOV AH, 09h
    INT 21h
    JMP Input

Input:     
    MOV DX, OFFSET bil1
    MOV AH, 09h
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    MOV CL, AL
   
    MOV DX, OFFSET bil2
    MOV AH, 09h
    INT 21h
    
    MOV AH, 1
    INT 21h
    MOV DL, AL
    
    CMP CL, DL
    JE Sama
    JB Kecil
    
    MOV DX, OFFSET Kal2   ;Bilangan ke-1 lebih besar dr bilangan ke-2
    MOV AH, 09h
    INT 21h   
	JMP Exit   
    
Kecil: 
    MOV DX, OFFSET Kal1   ;Bilangan ke-1 lebih kecil dr bilangan ke-2
    MOV AH, 09h
    INT 21h
    JMP Exit  	  
	
Sama:       
    MOV DX, OFFSET Kal3   ;Bilangan ke-1 besarnya sama dgn bilangan ke-2
    MOV AH, 09h
    INT 21h 
	JMP Exit
	            	
Exit:
    LEA DX, Ty
    MOV AH, 09h 
    INT 21h
END DATA
