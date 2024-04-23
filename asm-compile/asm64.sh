#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file.s>"
    exit 1
fi

source_file="$1"
object_file="${source_file%.s}.o"
executable="${source_file%.s}"

nasm -f elf64 -o "$object_file" "$source_file"
ld -m elf_x86_64 -o "$executable" "$object_file"
