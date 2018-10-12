[org 0x7c00]
mov ah, 0x0e

; intento 1
; Fallará nuevamente a pesar del 'org' porque seguimos imprimiendo el puntero y no el 
; contenido/dato al que apunta
mov al, "1"
int 0x10
mov al, el_secreto
int 0x10

; intento 2
; Ahora esta es la respuesta correcta, ya que corregimos
; el problema de desplazamiento de memoria con 'org'
mov al, "2"
int 0x10
mov al, [el_secreto]
int 0x10

; intento 3
; Como te imaginabas, estamos sumando 0x7c00 dos veces, por lo que esto no funcionará
mov al, "3"
int 0x10
mov bx, el_secreto
add bx, 0x7c00
mov al, [bx]
int 0x10

; intento 4
; Esto sigue funcionando porque no hay referencias de punteros a memoria,
; por lo que el comando 'org' no hace efecto. Direccionar memoria directamente
; mediante el conteo de bytes siempre funcionará, pero es inconveniente
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10


jmp $ ; bucle infinito

el_secreto:
    ; El código ASCII 0x58 ('X') se guarda justo antes del relleno de ceros.
    ; En este código, eso queda en el byte 0x2d (puedes comprobarlo usando 'xxd archivo.bin')
    db "X"

; relleno de ceros y número mágico de la bios
times 510-($-$$) db 0
dw 0xaa55
