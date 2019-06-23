BITS 32

extern printf
extern scanf

section .rodata
    enter_name: db "Enter your name:", 10, 0
    good_morn: db "Good morning ", 0
    fmt: db "%s", 0
    new_line: db "", 10, 0


section .bss
    inpt resb 100 

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        push enter_name
        call printf
        add esp, 4

	push inpt
	push fmt
	call scanf
	add esp, 8

	push good_morn
        call printf
        add esp, 4
	
	push inpt
	call printf
	add esp, 4

	push new_line
	call printf
	add esp, 4

        leave
        ret
