.MODEL SMALL
.STACK 100H
.DATA
MSG1        DB      10,13,'ENTER A HEX DIGIT: $'
MSG2        DB      10,13,'IN DECIMAL IS IT $'
MSG3        DB      10,13,'DO YOU WANT TO DO IT AGIAN? $'
MSG4        DB      10,13,'ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $'
MSG5        DB      10,13,'TRY AGAIN LATER...$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    
    START:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    INPUT:
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,9
    LEA DX,MSG2
    
    CHECK:
    CMP BL,'9'
    JA HEX 
    JMP DIGIT
    
    HEX:  
    CMP BL,'F'
    JA INVALID
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,2
    MOV DL,'1'
    INT 21H
    MOV DL,BL
    SUB DL,17
    INT 21H
    JMP AGAIN 
    
    
    DIGIT: 
    CMP BL,'0'
    JB INVALID  
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H 
    JMP AGAIN 
    
    
    MOV BH,1
    INVALID:
    INC BH
    CMP BH,3
    JE  TRYAGAINLATER
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    JMP INPUT  
    
    TRYAGAINLATER:
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP EXIT
           
           
     
    AGAIN: 
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV AH,1
    INT 21H
    MOV BL,AL
    CMP BL,'Y'
    JE START 
    CMP BL,'y'
    JE START 

    
    
   
    EXIT:
    MOV AH,4CH
    INT 21H
    END