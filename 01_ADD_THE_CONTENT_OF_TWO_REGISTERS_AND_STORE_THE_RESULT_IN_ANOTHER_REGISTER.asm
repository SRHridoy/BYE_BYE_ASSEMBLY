;ADD THE CONTENT OF TWO REGISTERS AND STORE THE RESULT IN ANOTHER REGISTER
.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    MOV AH,1
    INT 21H
    ADD AL,BL
    MOV BL,AL
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    
    MOV AH,2
    MOV DL,BL
    SUB DL,48
    INT 21H
    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN