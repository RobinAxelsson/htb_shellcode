#!/bin/bash
tests=0
passed=0

rm -f ./output/print-flag-min

out=$(./scripts/assf.sh ./src/print-flag-min.s)
echo out: "$out"
((tests++))
if [[ "$out" == "hello" ]]; then
    ((passed++))
else
    echo bin result '"$out"'
    echo read file failed
fi

((tests++))
# prints as shell code
bytes=$(python3 ./scripts/shellcoder.py ./output/print-flag-min -l)
echo "bytes:" "$bytes"
if [[ $bytes < 50 ]]; then
    ((passed++))
fi

((tests++))
# prints as shell code
null_bytes=$(python3 ./scripts/shellcoder.py ./output/print-flag-min -n)
echo "null bytes:" "$null_bytes"
if [[ $bytes == 0 ]]; then
    ((passed++))
fi

echo "$passed"/"$tests"