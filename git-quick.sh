#!/bin/bash

# 快速提交脚本
# 用法：./git-quick.sh

echo "===== 快速提交 Git ====="

# 1. 获取提交信息
read -p "请输入本次提交的内容： " message

# 如果用户未输入内容，则提示并退出
if [ -z "$message" ]; then
    echo "提交信息不能为空，已取消。"
    exit 1
fi

# 2. 查看当前状态（可选）
echo "当前状态："
git status -s

# 3. 添加所有更改
echo "添加所有更改..."
git add .

# 4. 提交
echo "提交..."
git commit -m "$message"

# 5. 推送
echo "推送到远程..."
git push

echo "✅ 完成！"