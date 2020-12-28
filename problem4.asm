global _start

section
 .data

msg1 DB 'AXE:', 0h 

len1 equ $ - msg1   

msg2 DB 'DEW:',0h

len2 equ $ - msg2   

section .text



_start:

mov esi,3 

   
    
 
Display:   
      
mov edx,len1 
    
mov ecx,msg1 ;message to write
    
mov ebx,1   ;file descriptor (stdout)
    
mov eax,4   ;system call number (sys_write)
    
int 0x80    ;call kernel 
 

 
 
Again:
    
mov dl,32
    
mov ah,2
    
int 80h
     
mov edx,len2  
     
mov ecx,msg2 ;message to write
    
mov ebx,1   ;file descriptor (stdout)
    
mov eax,4   ;system call number (sys_write)
    
int 0x80    ;call kernel  

 
dec esi
 
cmp esi,0
 
je exit
 
jmp Display 

 

exit:
	
mov	eax, 01h		; exit()
	
xor	ebx, ebx		; errno
	
int	80h
