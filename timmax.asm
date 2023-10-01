.model small
.stack 100h
.data
    message_input db "hay nhap 5 so: $"
    message_output db 10, 13, "so lon nhat: $"
    
    max_value db 0
.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;in thong bao nhap 
    lea dx, message_input
    mov ah, 9
    int 21h
    
    mov cx, 5
nhap:
    ;nhap 1 ki tu
    mov ah, 1
    int 21h
    
    sub al, '0'
    
    call compare
    
    ;in khoang trang
    mov ah, 2
    mov dl, 32
    int 21h 
        
    
    loop nhap
    
    ;in thong bao so lon nhat
    mov ah, 9
    lea dx, message_output
    int 21h
    
    ;in gia tri lon nhat
    mov ah, 2
    mov dl, max_value
    add dl, '0'
    int 21h     
    
    mov ah, 4ch
    int 21h
main endp      

compare proc
    cmp max_value, al
    jae thoat
    mov max_value, al
thoat:
    ret   
compare endp

end