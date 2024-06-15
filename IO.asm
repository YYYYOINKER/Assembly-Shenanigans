section .bss
    buffer resb 128   ; Reserve 128 bytes for the input buffer

section .data
    input_prompt db 'Enter some text: ', 0
    output_prompt db 'You entered: ', 0

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

    ; Print output prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, output_prompt
    mov edx, 13         ; length of the output prompt
    int 0x80

    ; Print the input back to the user
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, buffer
    mov edx, esi        ; number of bytes read
    int 0x80

    ; Exit
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80
