# 把 Game UA AI Copilot 永久部署到 GitHub Pages

> 本地仓库我已经帮你初始化好、首次提交也做完了（分支 `main`）。
> 你现在**只剩 2 步**，全程约 3 分钟。

---

## ✅ 第 1 步：在 GitHub 网页新建一个空仓库

1. 打开 https://github.com/new
2. **Repository name** 填：`game-ua-copilot`
3. 选 **Public**（GitHub Pages 免费版需要 Public）
4. ⚠️ **不要**勾选 "Add a README"、".gitignore"、"license"（保持完全空仓库）
5. 点 **Create repository**
6. 创建后页面会显示一个地址，复制它，长这样：
   `https://github.com/你的用户名/game-ua-copilot.git`

---

## ✅ 第 2 步：在终端跑一条命令推送上去

打开「终端」(Terminal)，粘贴下面这行（把地址换成你自己的）：

```bash
cd /Users/padrickli/WorkBuddy/2026-06-15-20-31-50/game-ua-copilot
bash deploy-to-github.sh https://github.com/你的用户名/game-ua-copilot.git
```

> 如果弹出要求登录：
> - 用户名填你的 GitHub 用户名
> - 密码处**不要填登录密码**，要填 **Personal Access Token**（PAT）
> - 没有 PAT 的话：GitHub → Settings → Developer settings → Personal access tokens → Tokens(classic) → Generate，勾选 `repo` 权限即可。
> - （更省事的替代：在 GitHub 仓库页面点 "Add file → Upload files"，把本目录的 `index.html`、`.nojekyll`、两个 .md 直接拖上去，免命令行）

---

## ✅ 第 3 步：开启 Pages（最后一下）

1. 进入你的仓库页面 → 顶部 **Settings**
2. 左侧菜单 → **Pages**
3. **Source** 选 `Deploy from a branch`
4. **Branch** 选 `main`，文件夹选 `/ (root)` → **Save**
5. 等约 1 分钟，刷新页面顶部会出现你的永久链接：

   **`https://你的用户名.github.io/game-ua-copilot/`**

这个链接永不过期，可以直接写进简历、发给 HR、面试现场打开演示。

---

## 以后想改内容怎么办？

修改 `index.html` 后，在本目录跑：

```bash
cd /Users/padrickli/WorkBuddy/2026-06-15-20-31-50/game-ua-copilot
git add -A && git commit -m "update" && git push
```

约 1 分钟后线上自动更新。

---

## 不想用命令行？纯网页方案

完全不碰终端也行：
1. 建好空仓库后，点仓库页 **Add file → Upload files**
2. 把本文件夹里的 `index.html`、`.nojekyll`、`README_作品集说明.md`、`部署到GitHub_Pages步骤.md` 全选拖进去
3. 点 **Commit changes**
4. 然后照「第 3 步」开启 Pages 即可

> 注意：`.nojekyll` 是隐藏文件，Finder 里按 `Cmd+Shift+.` 显示隐藏文件才能选到它。它能防止 GitHub 忽略某些文件，建议一起传。
