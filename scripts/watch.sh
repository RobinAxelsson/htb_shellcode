#!/bin/bash

# sudo apt install fswatch

path="./src"
test=$1

if [ "$1" != "" ]; then
    path=./src/$1.s
fi
echo $path
echo $test

test="./test/$1-tests.sh"
echo $test 
fswatch -o --event=Updated "$path" | xargs -n1 -I{} bash -c "$test"

# xargs builds and executes command lines from standard input. It takes the output
# of commmand (usually a list of files or arguments) adn passes it as arguments to another
# command.
# why use:

# handles large output that can overflow command line arguments
# efficient pipelining
# combines results from find, grep, fswatch
# parallel execution -P

# echo "file1 file2 file3" | xargs rm
# find . -name "*.tmp" | xargs rm
