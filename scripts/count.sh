#!/usr/bin/env bash
# count.sh: 按编程语言统计代码行数
# 用法: ./count.sh [目录]
# 不传目录默认统计当前目录

target_dir="$1"
if [ -z "$target_dir" ]; then
    target_dir="."
fi

cloc "$target_dir"
