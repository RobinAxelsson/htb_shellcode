global _start
; shell optimized code with no .data

section .text
_start:
mov rbp, rsp
xor rdi, rdi

open:
push rdi
mov rdi, "flag.txt"
push rdi
xor rdi, rdi
mov rdi, "////////"
push rdi

read:
mov al, 2; syscall for open
mov rdi, rsp ; pointer to filepath
mov rsi, 0 ; readonly flag
syscall

cmp rax, 0
jl error_open

sub rsp, 128 ; allocate buffer on the stack
mov rsi, rsp ; Pointer to the buffer
mov rdi, rax ; move file descriptor to rdi
mov rax, 0   ; Syscall number for read (0)
mov rdx, 128 ; Number of bytes to read
syscall      ; Call the read syscall

cmp rax, 0
jl error_read

mov rdi, rax ; read bytes
; rsi buffer
call sys_print

exit:
    mov     rax, 60
    mov     rdi, 0
    syscall

error_open:
    push rax
    mov rdi, 8
    mov rsi, "err_open"
    push rsi
    mov rsi, rsp
    call sys_print
    jmp error_exit
    pop rsi

error_read:
    push rax
    mov rdi, 8
    mov rsi, "err_read"
    call sys_print
    pop rdi

error_exit:
    pop rdi
    mov rax, 60
    syscall

; rdi = length, rsi = pointer
sys_print:
    mov rdx, rdi
    ;mov rsi - the pointer
    mov rax, 1  ; sys_write
    mov rdi, 1  ; std_out
    syscall
    ret