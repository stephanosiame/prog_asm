section .data
    message db "Hello, World!", 0xA    ; The string to print with a newline
    message_len equ $ - message        ; Calculate the length of the string

section .text
    global _start                     ; Entry point for the program

_start:
    ; Write the message to stdout
    mov rax, 1                        ; syscall: write
    mov rdi, 1                        ; file descriptor: stdout
    lea rsi, [message]                ; Address of the message
    mov rdx, message_len              ; Length of the message
    syscall

    ; Exit the program
    mov rax, 60                       ; syscall: exit
    xor rdi, rdi                      ; Return code 0
    syscall
