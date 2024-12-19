
section .text
global _start

_start:
  mov rbp, rsp
  sub rsp, 8
  xor    rax,  rax
  push   rax
  mov    rbx,  0x2144af667e1671e6
  push   rbx
  mov    rbx,  0x4c1bb57a7c4623a7
  push   rbx
  mov    rbx,  0x14d24421344d26bf
  ; and    qword  [r10+rdx*8+0x10], r8 ; and with 0 is 0
  ; movsxd esi, dword [rsi] ; rsi is not used below
  and    bh, ah ; weird stuff? bh = rbx high 16bit, ah = rax high 16bit
  ; jno    0x41 ; 41 is invalid memory
  push   rbx
  ; and    dword  [rdx+rdx*8+0x14], eax ;rdx = 0, 0x14 invalid memory, eax = 0
  ; and    qword  [r10+rdx*8+0x44], r8 ;r10 = 0, rdx = 0, 0x44 invalid memory
  ; and    dword  [rax+0x31], ecx ;rax = 0, 0x31 is invalid memory
  ; leave ; leave is not nice
  
  ; DEXRYPT LOOP TRY
  ; mov    cl, 0x4 ; 0x4 cl is RCX used for loops
  ; decrypt: ; another decrypt?
  ; mov    rdi,  rsp ; sets the pointer to rdi
  ; xor    qword  [rdi],  rbx
  ; add    rdi,  0x8 ; looks like a loop
  ; loop   decrypt ; 0x43 or 67 ; breaks the program

  ; PRINT SYSCALL
  xor    rax,  rax ; rax = 0
  mov    al,  0x1 ; sys_write

  xor    rdi,  rdi ; rdi = 0
  mov    dil,  0x1 ; std_out

  xor    rsi,  rsi ; rsi = 0
  mov    rsi,  rsp ; pointer to string

  xor    rdx,  rdx
  mov    dl,   30 ;0x1e ; dl/rdx = length
  syscall

  ; EXIT SYSCALL
  xor    rax,  rax
  add    al,  60; 0x3c
  xor    rdi,  rdi
  syscall
