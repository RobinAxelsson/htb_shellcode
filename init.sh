#!/bin/bash
alias assf="./scripts/assf.sh"
alias dassf="./scripts/dassf.sh"
alias shellcoder="python3 ./scripts/shellcoder.py"
alias loader="python3 ./scripts/loader.py"
alias assembler="python3 ./scripts/assembler.py"
alias test="./test/print-flag-tests.sh"
alias shellx="mkdir -p ./output && gcc ./src/shellx.c -o ./output/shellx && ./output/shellx"
alias shellx-db="mkdir -p ./output && gcc -g ./src/shellx.c -o ./output/shellx && gdb -q ./output/shellx"
alias clean="rm -rf ./output"
alias testhex="./scripts/testhex.sh"
alias watch="./scripts/watch.sh"