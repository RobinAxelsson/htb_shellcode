#!/bin/bash
tests=0
passed=0

rm -f ./output/hex
out=$(./scripts/assf.sh ./src/hex.s)

# ((tests++))
# if [[ "$out" == "hello" ]]; then
#     ((passed++))
# else
#     echo "$out"
#     echo "assembly fail"
# fi

((tests++))
# prints as shell code
python3 ./scripts/shellcoder.py ./output/hex
if [ "$?" == 0 ]; then
    ((passed++))
fi

echo "$passed"/"$tests"