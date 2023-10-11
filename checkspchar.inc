checkspchar proc
    mov si, 0

keepcheckchar:
    mov al, [setpass + si]
    
    cmp al, "0"
    jb mk_khonghople
    cmp al, "9"
    jbe mk_hople
    
    cmp al, "A"
    jb mk_khonghople
    cmp al, "Z"
    jbe mk_hople
    
    cmp al, "a"
    jb mk_khonghople
    cmp al, "z"
    jbe mk_hople

mk_hople:    
    inc si
    cmp si, 4
    je checkspchar_end

    jmp keepcheckchar

mk_khonghople:
    mov ah, 9
    lea dx, invalidpass
    int 21h              
    
    mov ah, 9
    lea dx, newline
    int 21h    
    
    jmp thong_bao_nhap_pass_lan_1

checkspchar_end:
    ret
checkspchar endp