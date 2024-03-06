.model small
.stack
.data
    cont1 db 0 ; Variable para while
    cont2 db 0 ; Variable para for
    saludo db 10, 13, "Hola mundo!! $"
.code
    mov ax, @data
    mov ds, ax

    ; Ciclo while
    while:
        cmp cont1, 10
        je salir_while

        ; Cuerpo del while
        mov ah, 09h
        lea dx, saludo
        int 21h

        inc cont1
        jmp while

    salir_while:

    ; Ciclo for
    for:
        cmp cont2, 10
        je salir_for

        ; Cuerpo del for
        mov ah, 09h
        lea dx, saludo
        int 21h

        inc cont2
        jmp for

    salir_for:

    ; Ciclo do-while
    do_while:
        ; Inicializar el registro cx con 10
        mov cx, 10

        ; Inicio del ciclo do-while
        do_while_body:
            mov ah, 09h
            lea dx, saludo
            int 21h

            loop do_while_body ; Decrementa cx y salta si cx no es cero

        ; Condición de salida
        cmp cont1, 20
        jge salir_do_while

        inc cont1
        jmp do_while

    salir_do_while:

    .exit
end
