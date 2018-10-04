*Conceptos que podrías querer Googlear de antemano: linux, mac, terminal, compilador, emulador, nasm, qemu*

**Meta: Instalar los programas (softwares) requeridos para seguir este tutorial**

Estoy trabajando en una Mac, aunque Linux es mejor porque tendrá todas las herramientas estándares disponibles
para ti.

En una Mac, [instala Homebrew](http://brew.sh) y después ejecuta `brew install qemu nasm`

Si tienes instalado Xcode, no utilice su `nasm`. No funciona en la mayoría de los casos. Siempre use `/usr/local/bin/nasm`

En algunos sistemas, qemu está dividido en múltiples binarios. Deberías poder ejecutar `qemu-system-x86_64 binfile`

* Nota de @luiscardozo: Yo trabajo en Ubuntu Linux 18.04. Abre una terminal y ejecuta: `sudo apt install qemu nasm`
