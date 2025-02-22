;LOWERCASE TO UPPERCASE
.MODEL SMALL
.STACK 100H
.DATA
MSG1        DB      10,13,'ENTER A LOWERCASE LETTER: $'
MSG2        DB      10,13,'THE UPPERCASE OF IT IS : $'
MSG3        DB      10,13,'INVALID INPUT $'

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,'a'
    JL  INVALID
    CMP BL,'z'
    JG  INVALID 
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    SUB DL,32
    INT 21H
    JMP EXIT
    
    INVALID:
    MOV AH,9 
    LEA DX,MSG3
    INT 21H  
    JMP EXIT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN