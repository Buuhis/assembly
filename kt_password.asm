.model small
.stack 100h
.data
    setpass db 4 dup(0)
    re_enterpass db 4 dup(0)

    new_password db "nhap password: $"
    invalidpass db 10, 13, "password khong duoc chua ki tu dac biet. $"
    
    pass_again db 10, 13, "nhap lai password: $"
    correctpass db 10, 13, "correct password. $"
    incorrectpass db 10, 13, "incorrect password. $"
    
    blockacc db 10, 13, "account is blocked.$"    
    newline db 10, 13, '$' 
    
    count_cmp db 0
    
.code

    include "checkpass.inc"
    include "checkspchar.inc"

main proc
    mov ax, @data
    mov ds, ax

thong_bao_nhap_pass_lan_1:    
    mov ah, 9
    lea dx, new_password
    int 21h

;nhap pass lan 1
    mov si, 0
    
nhap_pass:    
    mov ah, 1
    int 21h
    
    mov [setpass + si], al

    inc si    
    cmp si, 4
    jb nhap_pass

call checkspchar

thong_bao_nhap_pass_lan_2:
    mov ah, 9
    lea dx, pass_again
    int 21h

;nhap pass lan 2    
    mov si, 0
    
nhaplaipass:
    mov ah, 1
    int 21h
    
    mov [re_enterpass + si], al    
    
    inc si
    cmp si, 4
    jb nhaplaipass
    
call checkpass
    
return:
    mov ah, 9
    lea dx, correctpass
    int 21h
    
dung_chuong_trinh:
    mov ah, 4ch
    int 21h 
main endp
 
end main