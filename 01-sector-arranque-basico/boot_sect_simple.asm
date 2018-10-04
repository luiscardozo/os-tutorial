; Un sector de arranque simple que hace un bucle infinito
loop:
    jmp loop

times 510-($-$$) db 0
dw 0xaa55
