
section .text
global _start

_start:
  xor    rax,  rax
  push   rax
  mov    rbx,  0x2144af667e1671e6
  push   rbx
  mov    rbx,  0x4c1bb57a7c4623a7
  push   rbx
  mov    rbx,  0x14d24421344d26bf
  and    qword  [r10+rdx*8+0x10], r8
  movsxd esi, dword [rsi]
  and    bh, ah
  jno    0x41
  push   rbx
  and    dword  [rdx+rdx*8+0x14], eax
  and    qword  [r10+rdx*8+0x44], r8
  and    dword  [rax+0x31],  ecx
  leave
  add    cl,  0x4
  mov    rdi,  rsp
  xor    qword  [rdi],  rbx
  add    rdi,  0x8
  loop   0x43
  xor    rax,  rax
  mov    al,  0x1
  xor    rdi,  rdi
  mov    dil,  0x1
  xor    rsi,  rsi
  mov    rsi,  rsp
  xor    rdx,  rdx
  mov    dl,  0x1e
  syscall
  xor    rax,  rax
  add    rax,  0x3c
  xor    rdi,  rdi
  syscall
