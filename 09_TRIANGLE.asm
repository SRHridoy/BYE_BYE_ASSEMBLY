;PRINT TRIANGLE

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    MOV BX,1
    
    START:
    CMP BX,5
    JE EXIT 
    
    MOV CX,BX
    PRINT:
    MOV AH,2
    MOV DL,03H
    INT 21H
    LOOP PRINT
             
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    INC BX
    JMP START
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN