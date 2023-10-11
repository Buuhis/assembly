checkpass proc
    mov si, 0

keepcheck:
    mov al, [setpass + si]
    mov bl, [re_enterpass + si]
    inc si
    
    cmp si, 4
    ja return
    
    cmp al, bl
    je keepcheck
    
    inc count_cmp
    cmp count_cmp, 3
    je stop
    
    mov ah, 9
    lea dx, incorrectpass
    int 21h
               
    mov ah, 9
    lea dx, newline
    int 21h           
                   
    mov ah, 9
    lea dx, pass_again
    int 21h 
    
    mov si, 0
                    
    jmp nhaplaipass
    
stop:
    mov ah, 9
    lea dx, blockacc
    int 21h
    jmp dung_chuong_trinh

checkpass endp  