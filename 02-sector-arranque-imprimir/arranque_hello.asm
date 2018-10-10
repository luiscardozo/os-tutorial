mov ah, 0x0e ; modo tty
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' sigue en al, lo recuerdas?
mov al, 'o'
int 0x10

jmp $ ; salto a la dirección actual = bucle infinito

; relleno y número mágico
times 510 - ($-$$) db 0
dw 0xaa55
