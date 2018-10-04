*Conceptos que podrías querer Googlear de antemano: ensamblador, BIOS, endiannes, little-endian*

**Meta: Crear un archivo al que la BIOS interprete como un disco arrancable**

Esto es muy excitante, vamos a crear nuestro propio sector de arranque!

Teoría
------

Cuando la computadora arranca, la BIOS no sabe cómo cargar el Sistema Operativo,
por lo que delega esto al sector de arranque. Entonces, el sector de arranque debe
ser colocado en un lugar estándar, conocido de antemano. Esa localización es el
primer sector del disco (cilindro 0, cabezal 0, sector 0) y ocupa 512 bytes.

Para asegurar que "el disco es arrancable", la BIOS verifica que lo bytes
511 y 512 del supuesto sector de arranque sean los bytes `0xAA55`.

Este es el sector de arranque más simple que se puede hacer:

```
e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[ 29 more lines with sixteen zero-bytes each ]
00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
```

Son básicamente todos ceros, terminando el valor de 16 bits
`0xAA55` (tener cuidado con el `endianness`, x86 es `little-endian`).

Los primeros tres bytes hacen un bucle infinito (o "salto infinito").

El sector de arranque más sencillo que se pueda hacer:
------------------------------------------------------

Podrías escribir los 512 bytes de arriba con un
editor binario o simplemente escribir un código
ensamblador muy simple:


```nasm
; bucle infinito (e9 fd ff)
loop:
    jmp loop 

; Rellenar con 510 ceros menos el tamaño del código previo
times 510-($-$$) db 0
; "Número mágico" (los 2 bytes finales que indican que es un "disco arrancable"
dw 0xaa55
```

Para comppilar:
`nasm -f bin sector_arranque_simple.asm -o sector_arranque_simple.bin`

> Atención para OSX: si esto tira un error, lee de nuevo el capítulo 00

Yo sé que estás ansioso para probarlo (¡yo lo estoy!), entonces, hagámoslo:

`qemu sector_arranque_simple.bin`

> En algunos sistemas, posiblemente tengas que ejecutar `qemu-system-x86_64 sector_arranque_simple.bin`. Si da un error de SDL, intenta pasar el/los argumentos --nographic y/o --curses.

Verás que se abre una ventana diciendo "Booting from Hard Disk..." ("Arrancando desde el disco duro...") y
nada más. ¿Cuándo fue la última vez que estuviste tan excitado por ver un bucle infinito? ;-)


Notas de @luiscardozo
---------------------
En Ubuntu, puedes instalar el Editor Binario ghex con el comando: `sudo apt install ghex`
Luego puedes revisar el archivo generado con `ghex sector_arranque_simple.bin`
En mi caso, los primeros 3 bytes fueron distintos (eb ff 00), pero el resultado aparentemente fue el mismo.
