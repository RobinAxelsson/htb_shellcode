# Shellcode expolits

## Init Scripts

```shell

    source ./init.sh

```

## Setup

- Kali Linux
- VS Code
- Python3
- msfvenom (installed with Kali distro)

```shell

sudo apt install python3.12-venv

# Create a python venv
python3 -m venv ./venv

# activate virtual env
source venv/bin/activate

# install
sudo pip3 install pwntools

# deactivate environment just
deactivate

# delete
rm -rf venv

```

## pwntools

```shell

pwn asm 'push rax' -c 'amd64'
# > 50

pwn disasm '50' -c 'amd64'
# > 0: 50       push rax

pwn disasm '48be0020400000000000bf01000000ba12000000b8010000000f05b83c000000bf000000000f05' -c 'amd64'

   0:    48 be 00 20 40 00 00 00 00 00    movabs rsi,  0x402000
   a:    bf 01 00 00 00                   mov    edi,  0x1
   f:    ba 12 00 00 00                   mov    edx,  0x12
  14:    b8 01 00 00 00                   mov    eax,  0x1
  19:    0f 05                            syscall
  1b:    b8 3c 00 00 00                   mov    eax,  0x3cw
  20:    bf 00 00 00 00                   mov    edi,  0x0
  25:    0f 05                            syscall

```

## debug with gdb

```shell

# attatch gdb to process running
gdb -p PID

# only work if the process does not exit fast
# assemble the hex code with assembler.py
gdb -q helloworld

```

## Inject shellcode in C

Not super reliable and adds C libs.

```c

#include <stdio.h>

int main()
{
    int (*ret)() = (int (*)()) "\x48\x31\xdb\x66\xbb\...SNIP...\x3c\x40\x30\xff\x0f\x05";
    ret();
}
 ```

 ```shell

gcc helloworld.c -o helloworld
gdb -q helloworld

# problem with memory protections so we may have to add flags to bypass memory protections, as follows:
gcc helloworld.c -o helloworld -fno-stack-protector -z execstack -Wl,--omagic -g --static

```

## Shellcode Requirements

- Does not contain variables
- Does not refer to direct memory addresses
- Does not contain any NULL bytes 00

Our entire shellcode must be under '.text' in the assembly code

resources:
- https://shell-storm.org/shellcode/index.html
- https://www.exploit-db.com/shellcodes

msfvenom -p 'linux/x64/exec' CMD='sh' -a 'x64' --platform 'linux' -f 'hex'
msfvenom -l encoders
 