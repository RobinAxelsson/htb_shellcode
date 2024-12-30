#!/usr/bin/python3

import sys
from pwn import *
context(os="linux", arch="amd64", log_level="error")

file = ELF(sys.argv[1])
shellcode = file.section(".text")
hex = shellcode.hex()
null_byte_count = shellcode.count(0)

if len(sys.argv) > 2:
    if sys.argv[2] == "-l":
        print(len(shellcode))
        exit(0)

if len(sys.argv) > 2:
    if sys.argv[2] == "-n":
        print(null_byte_count)
        exit(0)

if len(sys.argv) > 2:
    if sys.argv[2] == "-h":
        print(hex)
        exit(0)

print(hex)
print("%d null bytes" % null_byte_count)
print("total: %d bytes" % len(shellcode))
