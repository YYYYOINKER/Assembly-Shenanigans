section .bss
    input resb 100        ; reserve 100 bytes for the input

section .data
    prompt db 'Enter a string: ', 0
    lenPrompt equ $ - prompt
    newline db 10, 0

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, prompt       ; pointer to message
    mov edx, lenPrompt    ; message length
    int 0x80              ; call kernel

    ; Read input
    mov eax, 3            ; sys_read
    mov ebx, 0            ; file descriptor (stdin)
    mov ecx, input        ; pointer to input buffer
    mov edx, 100          ; maximum input length
    int 0x80              ; call kernel

    ; Loop over each character
    mov esi, input        ; set esi to start of input buffer

print_loop:
    lodsb                 ; load byte at [esi] into al and increment esi
    test al, al           ; check if al is zero (end of string)
    jz done               ; if zero, we are done

    cmp al, 'A'           ; compare al with 'A'
    jb print_char         ; if al < 'A', it's not a capital letter, print it
    cmp al, 'Z'           ; compare al with 'Z'
    jbe print_loop        ; if al <= 'Z', it's a capital letter, skip it

print_char:
    ; Print character
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, esi          ; pointer to current character (esi is already incremented by lodsb)
    mov edx, 1            ; length to write
    int 0x80              ; call kernel

    jmp print_loop        ; repeat loop

done:
    ; Print newline
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, newline      ; pointer to newline character
    mov edx, 1            ; length to write
    int 0x80              ; call kernel

    ; Exit program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; exit status 0
    int 0x80              ; call kernel