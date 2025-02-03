;WRITE A PROGRAM TO DISPLAY A '?' , READ TWO CAPITAL
;LETTERS, AND DISPLAY THEM ON THE NEXT LINE IN
;ALPHABETICAL ORDER.
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,2
    MOV DL,'?'
    INT 21H 
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    
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
    MOV BH,AL
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    CMP BH,BL
    JGE FSTBORO
    JMP SNDBORO
    
    FSTBORO:
    MOV AH,2
    MOV DL,BL
    INT 21H 
    MOV DL,BH
    INT 21H   
    JMP EXIT
    
    SNDBORO:
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
END