.model small
.stack
.data
    buffer db 10, ?, 10 dup(0) ; Buffer para almacenar la entrada del teclado
    mensaje db 13, 10, "Ingresa una cadena: $"
    salida db 13, 10, "La cadena ingresada es: $"
.code
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje para ingresar una cadena
    mov ah, 09h
    lea dx, mensaje
    int 21h

    ; Capturar entrada del teclado
    mov ah, 0Ah
    lea dx, buffer
    int 21h

    ; Mostrar la cadena ingresada
    mov ah, 09h
    lea dx, salida
    int 21h

    mov ah, 09h
    lea dx, buffer+2 ; Saltar el primer byte que contiene la longitud
    int 21h

    .exit
end




