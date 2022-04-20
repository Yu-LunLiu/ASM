;GCD Program               (gcd.asm)

;CCIT class of 112 Computer Science Yu-lun,Liu

INCLUDE Irvine32.inc

.data
Prompt1  BYTE  "Enter first integer : ",0
Prompt2  BYTE  "Enter second integer : ",0
Prompt3  BYTE  "GCD : ",0
integer1 DWORD ?
integer2 DWORD ?

.code
main PROC
    mov eax, 0
    mov edx, OFFSET Prompt1
    call WriteString
    call ReadInt
    mov integer1, eax

    mov edx, OFFSET Prompt2
    call WriteString
    call ReadInt
    mov integer2, eax
    
    call GCD

    exit
main ENDP

GCD PROC
    pushad             
    
Ed_algor:
    mov eax, integer1
    mov ebx, integer2
    cdq                
    idiv ebx
    mov eax,integer2          
    mov integer1,edx         
    cmp edx, 0        
    je FIND_GCD

    mov eax, integer2
    mov ebx, integer1
    cdq                
    idiv ebx
    mov eax,integer1       
    mov integer2,edx           
    cmp edx, 0          
    je FIND_GCD
    
    JMP Ed_algor

FIND_GCD:
    mov edx, OFFSET Prompt3
    call WriteString
    call WriteDec
    popad          
    ret

GCD ENDP

END main
