BITS 32

extern printf
extern scanf

section .data
    msg: db "Enter number for fibonacci series:", 10, 0
    frmt: db "%d", 10, 0
    frmt1: db "%d",0
    first: dd 0
    second: dd 1
    temp: dd 0
     

section .text
    global main


main:
    push ebp
    mov ebp, esp

    push msg
    call printf
    add esp, 4

    push temp                       ;get user input
    push frmt1
    call scanf
    add esp, 8

    push dword[first]               ;print 0
    push frmt
    call printf
    add esp, 8

    push dword[second]              ;print 1
    push frmt
    call printf
    add esp, 8

    mov eax, 0
    mov ebx, 1
    dec dword[temp]                 ;decrement counter after printing 0 & 1

l1: mov [first], ebx                ;loop to print rest of series
    add ebx, eax 
    mov [second], ebx

    push ebx
    push frmt
    call printf
    add esp, 8

    mov eax, [first]
    mov ebx, [second]

    dec dword[temp]
    cmp dword[temp], 0
    jg l1

    leave
    ret

    