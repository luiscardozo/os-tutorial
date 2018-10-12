mov ah, 0x0e ; modo tty

mov bp, 0x8000 ; una dirección bastante lejos de 0x7c00, para que no se sobreescriba
mov sp, bp ; si la pila está vacía, entonces sp apunta a bp

push 'A'
push 'B'
push 'C'

; para mostrar cómo la pila crece hacia abajo
mov al, [0x7ffe] ; 0x8000 - 2
int 0x10

; sin embargo, no intentes acceder a [0x8000], porque no funcionará.
; Sólo puedes acceder al tope de la pila. En este momento
; únicamente es accesible 0x7ffe (mira arriba)
mov al, [0x8000]
int 0x10

; recuperar los caracteres usando el procedimiento estándar: 'pop'
; Sólo podemos hacer pop de palabras completas, por lo que necesitaremos registros
; auxiliares para manipular la parte baja de los bytes
pop bx
mov al, bl
int 0x10 ; imprime C

pop bx
mov al, bl
int 0x10 ; imprime B

pop bx
mov al, bl
int 0x10 ; imprime A

; los datos que fueron 'popeados' desde la pila, ahora son basura
mov al, [0x8000]
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55
