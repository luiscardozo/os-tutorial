*Conceptos que podrías querer Googlear de antemano: memoria, desplazamiento (offset) de memoria, punteros*

**Meta: Aprender cómo está organizada la memoria de la computadora**

Por favor abra la página 14 de [este documento](
http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)<sup>1</sup>
y mire la figura de la distribución de memoria.

La única meta de esta lección es aprender dónde se guarda el sector de arranque.

Sinceramente, podría decirte que la BIOS coloca en la dirección `0x7C00` y terminar
con esto, pero un ejemplo con soluciones erróneas hará las cosas más claras.

Queremos imprimir una X en la pantalla. Intentaremos 4 estrategias diferentes y
veremos cuáles funcionan y por qué.

**Abre el archivo `sector_arranque_memoria.asm`**

Primero definiremos la X como dato, con una etiqueta:

```nasm
el_secreto:
    db "X"
```
Luego intentaremos acceder `el_secreto` de diferentes formas:

1. `mov al, el_secreto`
2. `mov al, [el_secreto]`
3. `mov al, el_secreto + 0x7C00`
4. `mov al, 2d + 0x7C00`, donde `2d` es la posición actual del byte de 'X' en el binario

Mira el código y lee los comentarios.

Compile y ejecute el código. Deberías ver una cadena de caracteres similar a `1[2??3X4X`,
donde los bytes siguiendo a 1 y 2 sean simplemente basura aleatoria.

Si agregas o eliminas instrucciones, acuérdate de calcular el nuevo desplazamiento de X
contando los bytes y reemplazando `0x2d` con el nuevo desplazamiento.

Por favor no continúe a la siguiente sección a no ser que hayas entendido al 100% el
el desplazamiento y direccionamiento de memoria del sector de arranque.


El desplazamiento global
------------------------

Ya que agregar un desplazamiento de `0x7c00` en todas partes sería muy inconveniente,
el ensamblador nos permite definir un "desplazamiento global" para cada localización
de memoria, con el comando `org`:

```nasm
[org 0x7c00]
```

Ahora **abre `sector_arranque_memoria_org.asm`** y verás la forma canónica de
imprimir datos en el sector de arranque, que es ahora el intento 2. Compila el código
y ejecútalo, y verás cómo el comando `org` le afecta a las soluciones anteriores.

Lee los comentarios para una explicación de los cambios con y sin `org`

-----

[1] Todo este tutorial está fuertemente inspirado en ese documento. Por favor, lea el documento README.md que está en la raíz del proyecto para más información sobre el mismo.
