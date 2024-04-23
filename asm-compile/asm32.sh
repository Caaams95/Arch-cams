#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file.asm>"
    exit 1
fi

source_file="$1"
object_file="${source_file%.asm}.o"
executable="${source_file%.asm}"

nasm -f elf32 -o "$object_file" "$source_file"
ld -m elf_i386 -o "$executable" "$object_file"
