#!/usr/bin/env bash
# 一键提交并推送：./push.sh "本次作业说明"
set -e
cd "$(dirname "$0")"

if [ -z "$1" ]; then
  echo "用法: ./push.sh \"提交说明\""
  echo "例如: ./push.sh \"完成第3次作业\""
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "没有检测到任何改动，无需提交。"
  exit 0
fi

echo "将要提交的改动："
git status --short
echo ""

git add -A
git commit -m "$1"
git push

echo ""
echo "完成！刷新 GitHub 页面就能看到这次提交了。"
