Atención: este material no es creación de [luiscardozo](https://github.com/luiscardozo).
Es simplemente una traducción del trabajo [os-tutorial de cfenollosa](https://github.com/cfenollosa/os-tutorial).
Tal vez algunos conceptos no todos entiendan en español, por lo que pondré entre paréntesis el concepto en inglés.

os-tutorial
===========

Cómo crear un Sistema Operativo desde cero!

Siempre he querido aprender cómo hacer un Sistema Operativo desde cero. En la universidad me
enseñaron cómo implementar características avanzadas (paginación, semáforos, administración
de memoria, etc), pero:

- Nunca pude iniciar desde mi propio sector de arranque.
- La universidad es tan difícil, por lo que no recuerdo la mayoría de lo que estudié.
- Estoy harto de la gente que piensa que leer el código de un núcleo (kernel) existente, aunque sea pequeño,
es una buena idea para aprender sistemas operativos.

Inspirado por [este documento](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
y el [wiki OSDev](http://wiki.osdev.org/), intentaré hacer archivos README (LÉAME) cortos y que vayan
paso a paso, así como ejemplos de código que cualquiera pueda entender.
Honestamente, este tutorial es básicamente el primer documento pero dividido en piezas más pequeñas y sin la teoría.

Actualización: más fuentes: [the little book about OS development](https://littleosbook.github.io),
[JamesM's kernel development tutorials](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)


Características
---------------

- Este curso es un tutorial de código dirigido a personas que se sienten confortables con computación de bajo nivel.
Por ejemplo, programadores que tienen curisidad sobre cómo funciona un Sistema Operativo pero no tienen el tiempo o
la fuerza de voluntad para empezar a leer el núcleo de Linux de arriba a abajo.
- Hay poca teoría. Sí, esta es una característica. Google es tu profesor de teoría. Una vez que termines tu facultad,
la teoría en exceso es peor que "no tener teoría", porque eso hace que las cosas parezcan más difíciles de lo que realmente son.
- Las lecciones son pequeñas y pueden tomar entre 5 y 15 minutos para completarse. Confía en mi y confía en ti. ¡Puedes hacerlo!

Cómo utilizar este tutorial
---------------------------

1. Empieza con la primera carpeta y ve hacia abajo en orden. Los tutoriales se van construyendo sobre el código anterior,
por lo que si saltas a la carpeta 05 y no entiendes por qué hay un `mov ah, 0x0e`, es porque te perdiste la lección 02.
Simplemente sigue el orden. Siempre podrás saltar las cosas que ya sabés.

2. Abre el archivo "README" y lee la primera línea, que detalla los conceptos con los que deberías estar familiarizado
antes de leer el código. Busca en Google los conceptos que no te son familiares.
La segunda línea indica el objetivo de cada lección. Léelos, porque ahí se explican por qué hacemos lo que hacemos.
El "por qué" es tan importante como el "cómo".

3. Lee el resto del archivo README. Es **muy consizo**

4. (Opcional) Intenta escribir los archivos de códigos tú mismo después de leer el README.

5. Mira los códigos de ejemplo. Están extremadamente bien documentados.

6. (Opcional) Experimenta con los códigos e intenta romper cosas. La única forma de estar seguro que entendiste algo
es intentando romper cosas o replicar cosas con diferentes comandos.

TL;DR: Primero lee el README de cada carpeta, luego los archivos de código. Si te animas, intenta codificar tú mismo.


Estrategia
----------

Intentaremos hacer varias cosas con nuestro Sistema Operativo:

- Arrancar desde cero, sin GRUB - LISTO!
- Entrar al modo 32-bits - LISTO!
- Saltar desde Ensamblador a C - LISTO!
- Manejo de Interrupciones - LISTO!
- Salida a pantalla e ingreso por teclado - LISTO!
- Una pequeña y básica `libc` que vaya creciendo para satisfacer nuestras necesidades - LISTO!
- Administración de memoria
- Escribir un sistema de archivos
- Crear un `shell` muy simple
- Modo usuario
- Puede que escribamos un editor de texto simple
- Múltiples procesos y "calendarización" (scheduling) de procesos

Probablemente iremos en ese orden, aunque todavía no sabemos.

Si nos animamos, haremos:

- Un intérprete del lenguaje BASIC, como en los años 70!
- Una interfaz gráfica de usuario (GUI)
- Redes


Contribuciones
--------------

Este es un proyecto personal de aprendizaje y, aunque no ha sido actualizado por un largo tiempo, aún espero terminarlo en algún momento.

Estoy agradecido a todos los que indicaron errores (bugs) y enviaron `pull requests`. Necesitaré algo de tiempo para revizar todo y no puedo garantizar eso en este momento.

Siéntete libre en clonar este repositorio. Si muchos de ustedes están interesados en continuar el proyecto, háganme saber y enlazaré el "clon principal" desde aquí.

* Notas de @luiscardozo: primeramente intentaré realizar una traducción "así como está". Si quieres contribuir, ya sea con una traducción "así como está", como con una mejora en mis traducciones, eres bienvenido.
