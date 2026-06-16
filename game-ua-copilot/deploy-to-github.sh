#!/bin/bash
# ============================================================
#  Game UA AI Copilot · 一键推送到 GitHub (供 GitHub Pages 使用)
#  用法：
#    1) 先在 GitHub 网页上新建一个空仓库（不要勾 README/.gitignore）
#    2) 复制它的地址，例如 https://github.com/你的用户名/game-ua-copilot.git
#    3) 在本目录运行：  bash deploy-to-github.sh https://github.com/你的用户名/game-ua-copilot.git
# ============================================================
set -e

REPO_URL="$1"
if [ -z "$REPO_URL" ]; then
  echo "❌ 请把你的 GitHub 仓库地址作为参数传进来。"
  echo "   示例：bash deploy-to-github.sh https://github.com/yourname/game-ua-copilot.git"
  exit 1
fi

cd "$(dirname "$0")"
echo "📂 工作目录：$(pwd)"

# 初始化仓库（若已存在则跳过）
if [ ! -d .git ]; then
  git init
  echo "✅ 已初始化 git 仓库"
fi

# 主分支统一为 main
git symbolic-ref HEAD refs/heads/main 2>/dev/null || git checkout -b main 2>/dev/null || true

git add -A
git commit -m "Deploy Game UA AI Copilot" || echo "ℹ️ 无新改动可提交"

# 设置/更新远程
if git remote | grep -q origin; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi
echo "✅ 远程已设置为：$REPO_URL"

# 推送
git push -u origin main
echo ""
echo "🎉 推送完成！"
echo "👉 下一步：到 GitHub 仓库页面 → Settings → Pages →"
echo "   Source 选 'Deploy from a branch' → Branch 选 'main' / '(root)' → Save"
echo "   约 1 分钟后访问： https://你的用户名.github.io/game-ua-copilot/"
