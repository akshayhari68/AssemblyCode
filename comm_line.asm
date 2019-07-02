BITS 32

extern printf
extern atoi

section .data
    msg: db "Both are equal!", 10, 0
    err: db "Please input two numbers!", 10, 0
    frmt: db "%d" ,10, 0
    frmt1: db "%d" , 0
    num1: dd 0
    num2 dd 0 
 
section .text
    global main

main:
    push ebp
    mov ebp,esp

    mov ecx, dword[ebp+8]           ;argument count
    cmp ecx, 3                      ;compare if arg count less than 3 and print error msg if required
    jl l3
    
    mov esi, dword[ebp+12]          ;Reading first number
    add esi, 4
    push dword[esi]
    call atoi

    mov [num1], eax

    add esi, 4                      ;Reading second number
    push dword[esi]
    call atoi

    cmp dword[num1],eax             ;comparison for greater number
    jg l1
    cmp dword[num1],eax             ;comparison for equality

    je l2
    
    push eax
    push frmt
    call printf
    add esp,8
    jmp exit

l1: 
    push dword[num1]
    push frmt
    call printf
    add esp,8
    jmp exit

l2:
    push msg
    call printf
    jmp exit

l3:
    push err
    call printf
    jmp exit

exit:
    leave
    ret


