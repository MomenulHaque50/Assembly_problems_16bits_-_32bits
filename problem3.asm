.MODEL SMALL  
.STACK 100H  
.DATA  
  
;The string to be printed  
STRING1 DB 'Please enter a five lettered word:', '$'   
msg db 60 dup('$')
  
.CODE  
MAIN PROC FAR  
 MOV AX,@DATA  
 MOV DS,AX  
  
 ; load address of the string  
 LEA DX,STRING1  
  
 ;output the string 
 ;loaded in dx  
 MOV AH,09H 
 INT 21H 
 
 
 mov ax,@data
    mov ds,ax
    mov si,offset msg
      ; input a string
input: mov ah,1
    int 21h
    cmp al,13
    je display
    mov [si],al
    inc si
    jmp input 
    ; output a string

display: mov [si],'$'
    mov di,offset msg
   MOV dl, 10
   MOV ah, 02h
   INT 21h
  MOV dl, 13
 MOV ah, 02h
  INT 21h

    mov	bl, 48 
    

again: 
     
    cmp [di],36
    je but
    mov dl,[di]
    mov ah,2
    int 21h
    inc di
    
    jmp again 
    
 but:
 inc bl
    cmp bl,51
   je last
    mov di,offset msg
 jmp again


   
  
 ;interrupt to exit
last: mov ah,4ch
    int 21h  
  
MAIN ENDP  
END MAIN  