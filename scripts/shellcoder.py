#!/usr/bin/python3

import sys
from pwn import *
context(os="linux", arch="amd64", log_level="error")

file = ELF(sys.argv[1])
shellcode = file.section(".text")
hex = shellcode.hex()

print(hex)

null_byte_count = shellcode.count(0)
print("%d null bytes" % null_byte_count)

if null_byte_count > 0:
    exit(1)