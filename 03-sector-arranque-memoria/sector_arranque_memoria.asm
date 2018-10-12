mov ah, 0x0e ; modo tty

; intento 1
; Falla porque intenta imprimir la dirección de memoria (ej. puntero)
; no el contenido en sí
mov al, "1"
int 0x10
mov al, el_secreto
int 0x10

; intento 2
; Intenta imprimir el contenido de la memoria de 'el_secreto', que es la aproximación adecuada.
; Sin embargo, la BIOS coloca nuestro sector de arranque binario en la dirección 0x7c00
; por lo que necesitamos sumar esa dirección. Haremos eso en el intento 3
mov al, "2"
int 0x10
mov al, [el_secreto]
int 0x10

; intento 3
; Agregamos el desplazamiento 0x7c00 a la dirección de memoria de X
; y luego desreferenciar el contenido de ese puntero.
; Necesitamos la ayuda de un registro diferente 'bx' porque es ilegal hacer 'mov al, [ax]'.
; No se puede usar un registro como fuente y destino en el mismo comando.
mov al, "3"
int 0x10
mov bx, el_secreto
add bx, 0x7c00
mov al, [bx]
int 0x10

; intento 4
; Intentaremos hacer un atajo, ya que sabemos que X está guardado en el byte 0x2d de nuestro binario
; Eso es inteligente pero inefectivo. No queremos estar contando bytes cada vez que cambiemos el código
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10


jmp $ ; bucle infinito

el_secreto:
    ; El código ASCII 0x58 ('X') lo guardamos justo antes del relleno de ceros.
    ; En este código, eso sería en el byte 0x2d (puedes comprobar ejecutando 'xxd archivo.bin')
    db "X"

; relleno de ceros y número mágico de la bios
times 510-($-$$) db 0
dw 0xaa55
