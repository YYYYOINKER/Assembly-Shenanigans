section .bss
buffer resb 1024         ; Allocate a buffer of 1024 bytes
bytes_read resd 1        ; To store the number of bytes read
fd resd 1                ; To store the file descriptor

section .data
filename db 'hog.txt', 0 ; Filename to open, null-terminated

section .text
global _start

_start:
    ; Open the file
    mov eax, 5            ; sys_open
    mov ebx, filename     ; Pointer to filename
    mov ecx, 0            ; Flags (O_RDONLY)
    int 0x80              ; Call kernel

    mov [fd], eax         ; Store the file descriptor

    ; Check if file open was successful
    cmp eax, -1
    je exit               ; If eax is -1, an error occurred

    ; Read loop
read_loop:
    mov eax, 3            ; sys_read
    mov ebx, [fd]         ; File descriptor
    mov ecx, buffer       ; Buffer to store data
    mov edx, 1024         ; Number of bytes to read
    int 0x80              ; Call kernel

    mov [bytes_read], eax ; Store the number of bytes read
    cmp eax, 0            ; Check if EOF
    je close_file         ; Jump if end of file

    ; Write to stdout
    mov eax, 4            ; sys_write
    mov ebx, 1            ; File descriptor (stdout)
    mov ecx, buffer       ; Buffer to write from
    mov edx, [bytes_read] ; Number of bytes to write
    int 0x80              ; Call kernel
    jmp read_loop         ; Loop back to read more

close_file:
    ; Close the file
    mov eax, 6            ; sys_close
    mov ebx, [fd]         ; File descriptor
    int 0x80              ; Call kernel

exit:
    ; Exit
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; Return 0 status
    int 0x80              ; Call kernel

