// #include <stdio.h>
// #include <sys/mman.h>
// #include <string.h>
// #include <unistd.h>

// int main(int argv, char** argc)
// {
//     // printf("%d\n", argv);
//     // for (int i = 0; i < argv; i++)
//     // {
//     //     printf("%s\n", argc[i]);
//     // }

//     // int a = 5, b = 3, result;
//     //     asm(".intel_syntax noprefix\n"  // Switch to Intel syntax
//     //     "mov eax, %[a]\n"          // Move 'a' into eax
//     //     "add eax, %[b]\n"          // Add 'b' to eax
//     //     "mov %[result], eax\n"     // Move result back to C variable
//     //     ".att_syntax"              // Switch back to AT&T syntax
//     //     : [result] "=r" (result)   // Output
//     //     : [a] "r" (a), [b] "r" (b) // Inputs
//     //     : "eax"                    // Clobbered registers
//     // );

//     //printf("result: %d\n", result);
//     unsigned char shellcode[] = {
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         // 0x48, 0x83, 0xEC, 0x08, 0x48, 0xBF, 0x66, 0x6C,
//         // 0x61, 0x67, 0x2E, 0x74, 0x78, 0x74, 0x57, 0x48,
//         // 0xBF, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F,
//         // 0x2F, 0x57, 0xB0, 0x02, 0x48, 0x89, 0xE7, 0x48,
//         // 0x31, 0xF6, 0x0F, 0x05, 0x48, 0x83, 0xEC, 0x40,
//         // 0x48, 0x83, 0xEC, 0x40, 0x48, 0x83, 0xEC, 0x40,
//         // 0x48, 0x89, 0xE6, 0x48, 0x89, 0xC7, 0x48, 0x31,
//         // 0xC0, 0xB2, 0x80, 0x0F, 0x05, 0x88, 0xC2, 0xB0,
//         // 0x01, 0x40, 0xB7, 0x01, 0x0F, 0x05, 0xB0, 0x3C,
//         // 0x48, 0x31, 0xFF, 0x0F, 0x05, 
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0x90, //nop
//         0xc3, //ret
//     };
//     // unsigned char shellcode[] = { 0xc3 };
// my_label:
//     // // Allocate memory with mmap
//     void *mem = mmap(NULL, sizeof(shellcode), PROT_READ | PROT_WRITE | PROT_EXEC,
//                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    
//     if (mem == MAP_FAILED) {
//         perror("mmap");
//         return 1;
//     }

//     // Copy the shellcode into the allocated memory
//     memcpy(mem, shellcode, sizeof(shellcode));

//     if (mprotect(mem, sizeof(shellcode), PROT_READ | PROT_EXEC) == -1) {
//         perror("mprotect");
//         return 1;
//     }

//     // Cast the memory to a function pointer and execute it
//     void (*func)() = mem;
//     func();


//     return 0;
// }