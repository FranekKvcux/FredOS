[org 0x7c00]

mov ah, 0x0e
mov bx, [hello]

printHello:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp printHello

end:

hello:
    db "Hello from FredOS!", 0

jmp $

times 510-($-$$) db 0
db 0x55, 0xaa