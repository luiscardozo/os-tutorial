*Conceptos que tal vez quieras Googlear de antemano: interrupciones, CPU, registros*

**Meta: Hacer que nuestro anteriormente silencioso sector de arranque imprima algo de texto**

Vamos a mejorar un poco nuestro sector de arranque de bucle infinito y hacer que imprima
algo en pantalla. Para esto, vamos a realizar una interrupción.

En este ejemplo vamos a escribir cada caracter de la palabra "Hello" en el
registro `al` (la parte baja de `ax`), el byte `0x0e` en `ah` (la parte
alta del registro `ax`) y provocar una interrupción `0x10`, que es una
interrupción general para servicios de video.

El byte `0x0e` en `ah` le indica a la interrupción de video que que la función
que queremos que ejecute es 'escribir el contenido de `al` en modo tty'.

Vamos a colocar en modo tty sólo una vez, aunque en el mundo real no podemos
estar seguros que el contenido de `ah` sea constante. Otros procesos podrían
estar ejecutándose en la CPU mientras estamos "durmiendo", y podrían no
haber limpiado correctamente y dejado datos basura en `ah`.

Para este ejemplo no necesitamos tener en cuenta eso, ya que nuestro proceso
es lo único que se está ejecutando en la CPU.

Nuestro nuevo sector de arranque quedaría así:

```nasm
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
```
Para compilar, ya sabes;
`nasm -fbin arranque_hello.asm -o arranque_hello.bin`

Puedes examinar los datos binarios con `arranque_hello.bin`

Para probar:

`qemu arranque_hello.bin`

Tu sector de arranque dirá "Hello" y quedará trabado en un bucle infinito.
