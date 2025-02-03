.MODEL SMALL
.STACK 100H 
.DATA 
MSG1    DB      10,13,'TYPE A CHACTER : $'
MSG2    DB      10,13,'THE ASCII CODE OF $'
MSG3    DB      ' INN BINARY IS $'
MSG4    DB      10,13,'THE NUMBER OF 1 BITS IS $'

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX 
    
    START:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    INPUT:
    MOV AH, 1
    INT 21H
    MOV BL,AL
    
    PROMTPRINT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,9 
    LEA DX, MSG3
    INT 21H
    
    MOV CX,8
    MOV BH,0
    
    BINARY:
    SHL BL,1 
    JNC ZERO 
    JMP ONE
    
    ZERO:
    MOV DL,'0'
    JMP DISPLAY
    
    
    ONE:
    INC BH
    MOV DL,'1'
    JMP DISPLAY  
    
    DISPLAY:
    MOV AH,2
    INT 21H
    
    LOOP BINARY
    
    PRINTONES:
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    MOV AH,2
    MOV DL,BH 
    ADD DL,48
    INT 21H
    
    
    
     
    EXIT:
    MOV AH,4CH
    INT 21H
END