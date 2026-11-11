#!/usr/bin/env bash
# rename.sh: 将目录下 .jpeg 后缀重命名为 .jpg
# 用法: ./rename.sh [--dry-run] 目录
# --dry-run 只打印将要执行的操作，不实际修改文件

dry_run=0
# 判断第一个参数是否为 dry-run
if [ "$1" = "--dry-run" ]; then
    dry_run=1
    target_dir="$2"
else
    target_dir="$1"
fi

# 不传目录默认当前目录
if [ -z "$target_dir" ]; then
    target_dir="."
fi

# 遍历所有 .jpeg 文件
find "$target_dir" -type f -name "*.jpeg" | while read -r file; do
    # 替换后缀 jpeg → jpg
    new_name="${file%.jpeg}.jpg"
    if [ "$dry_run" -eq 1 ]; then
        echo "[dry-run] mv $file $new_name"
    else
        mv "$file" "$new_name"
        echo "mv $file $new_name"
    fi
done
