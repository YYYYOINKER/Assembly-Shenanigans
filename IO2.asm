section .bss
    buffer resb 128   ; Reserve 128 bytes for the input buffer

section .data
    input_prompt db 'Enter some text: ', 0
    hello_message db 'Hello, World!', 0
    not_hello_message db 'You did not enter hello', 0

section .text
    global _start

_start:
    ; Print input prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, input_prompt
    mov edx, 16         ; length of the input prompt
    int 0x80

    ; Read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, buffer
    mov edx, 128        ; max number of bytes to read
    int 0x80

    ; Save the number of bytes read
    mov esi, eax

    ; Check if input is "hello"
    mov ecx, buffer
    mov edi, hello
    mov ebx, 5          ; length of the string "hello"
    repe cmpsb          ; compare strings
    jne not_hello       ; jump if not equal

    ; Print "Hello, World!"
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, hello_message
    mov edx, 13         ; length of "Hello, World!"
    int 0x80
    jmp done            ; skip the not_hello part

not_hello:
    ; Print "You did not enter hello"
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, not_hello_message
    mov edx, 23         ; length of "You did not enter hello"
    int 0x80

done:
    ; Exit
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

section .data
hello db 'hello', 0
