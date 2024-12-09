# Shellcode expolits

## Init Scripts

```shell

    source ./init.sh

```

## Setup

- Kali Linux
- VS Code
- Python3 

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
  1b:    b8 3c 00 00 00                   mov    eax,  0x3c
  20:    bf 00 00 00 00                   mov    edi,  0x0
  25:    0f 05                            syscall

```