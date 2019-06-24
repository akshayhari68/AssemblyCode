BITS 32

extern printf

section .rodata
    even: db "Even number from 1 to 100 are...", 10, 0
    frmt: db "%d", 10, 0

section .text
    global _start

start:
    push ebp
    mov ebp, esp

    mov ebx, 2

    push even
    call printf
    add esp, 4

l1:
    push ebx
    push frmt
    call printf
    add esp, 8

    add ebx, 2
    cmp ebx, 100
    jle l1

    leave 
    ret