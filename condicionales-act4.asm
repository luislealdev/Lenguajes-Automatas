.model small
.stack
.data
    opcion db 2 ; Variable que representa la opción seleccionada en el switch case
    resultado db ? ; Variable para almacenar el resultado

    mensaje_si db 13, 10, "La variable es mayor o igual a 5. Resultado: $"
    mensaje_no db 13, 10, "La variable es menor a 5. Resultado: $"

    mensaje_switch db 13, 10, "El resultado del switch case es: $"

.code
    mov ax, @data
    mov ds, ax

    ; Ejemplo de if-else
    mov al, 10
    cmp al, 5
    jge mayor_o_igual

    ; Cuerpo del if
    mov resultado, 1
    jmp fin_if_else

mayor_o_igual:
    ; Cuerpo del else
    mov resultado, 0

fin_if_else:

    ; Mostrar resultado del if-else
    mov ah, 09h
    lea dx, mensaje_si
    cmp resultado, 1
    je imprimir_si
    lea dx, mensaje_no

imprimir_si:
    int 21h

    ; Ejemplo de switch case
    mov al, 2
    cmp al, 1
    je caso_1
    cmp al, 2
    je caso_2
    cmp al, 3
    je caso_3

    ; Default case
    jmp fin_switch

caso_1:
    ; Cuerpo del caso 1
    mov resultado, 11
    jmp fin_switch

caso_2:
    ; Cuerpo del caso 2
    mov resultado, 22
    jmp fin_switch

caso_3:
    ; Cuerpo del caso 3
    mov resultado, 33

fin_switch:

    ; Mostrar resultado del switch case
    mov ah, 09h
    lea dx, mensaje_switch
    int 21h

    ; Mostrar el resultado final
    mov ah, 09h
    lea dx, resultado
    int 21h

    .exit
end





