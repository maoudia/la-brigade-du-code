# 👨‍🍳 Lab 06 — Le Chef

> *"The Chef signs every dish, trusts no one blindly, and makes the kitchen run itself."*

## What you'll learn
- `mise trust` / `paranoid = true` — security model
- `mise generate git-pre-commit` — generate pre-commit hook via mise tasks
- `mise generate github-action` — generate CI yaml
- `mise generate task-docs` — auto-document tasks
- `mise self-update` — update mise itself
- `mise prune` — clean unused tool versions
- `locked = true` — strict CI mode
- VitePress 1.6.4 — deploy docs to GitHub Pages

📖 https://mise.jdx.dev/paranoid.html | https://mise.jdx.dev/cli/generate.html

## Steps

### 1. Trust model
```bash
cd /tmp && git clone YOUR_REPO brigade-test
cd brigade-test
# mise prompts: "Trust it? [y/n]"
mise trust
```

### 2. Paranoid mode
```bash
mise settings set paranoid true
# ~/.config/mise/config.toml gets: paranoid = true
```

### 3. Strict lockfile
```bash
mise settings set lockfile true
mise lock
# Then enable strict:
# [settings]
# locked = true
```

### 4. Generate pre-commit hook
```bash
mise generate git-pre-commit --task check
git add . && git commit -m "test"
# [lint]   Checking recipes... ✓
# [format] Formatting... ✓
```
📖 https://mise.jdx.dev/cli/generate/git-pre-commit.html

### 5. Generate GitHub Action
```bash
mise generate github-action
cat .github/workflows/mise.yml
```
📖 https://mise.jdx.dev/cli/generate/github-action.html

### 6. Generate task docs
```bash
mise generate task-docs
cat TASKS.md
```

### 7. Deploy VitePress docs
```bash
mise run docs:dev    # preview locally
mise run release     # deploy to GitHub Pages
```

## Win condition ✅
```bash
mise doctor  # all green
git commit -m "feat: le chef"  # pre-commit fires
# VitePress site live at https://maoudia.github.io/la-brigade-du-code/
```

## Bonus 🌶️
- `mise generate devcontainer` — what does it create?
- `install_before = "7d"` in `[settings]` — supply chain security (ignore releases newer than 7 days)
- `mise generate bootstrap` — how does it help new devs?
