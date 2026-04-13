---
title: La Brigade du Code 🍳
# Source of truth: slides/slides.md
# Config:  slides/reveal.json  (theme, plugins, revealOptions)
# Build:   mise run slides:build  (reveal-md → slides/_dist/)
# Dev:     mise run slides:dev    (hot-reload on :1948)
---

<!-- .slide: data-background-color="#0F1117" class="title-slide" -->

<div class="title-badge">mise · 2026.4.8</div>

# 🍳 La Brigade du Code

<p class="subtitle">A mise-en-place codelab for full stack developers</p>

<div class="tagline">mise replaces nvm · sdkman · direnv · Makefile · npm scripts</div>

<div class="version-grid">
  <div class="v-badge">Java <span>25 LTS</span></div>
  <div class="v-badge">Node <span>24 LTS</span></div>
  <div class="v-badge">Spring Boot <span>4.0.5</span></div>
  <div class="v-badge">Nuxt <span>4.2.2</span></div>
  <div class="v-badge">mise <span>2026.4.8</span></div>
</div>

<p class="gh-link">github.com/maoudia/la-brigade-du-code</p>

Note:
Welcome! Today we go from "works on my machine" to "works on every machine".
This is not a demo — it's a codelab. You will type commands.

---

<!-- .slide: data-background-color="#0F1117" data-auto-animate -->

## 😤 The Problem

<div class="problem-grid">
  <div class="problem-card">📦 <strong>nvm</strong><br><small>Node version manager</small></div>
  <div class="problem-card">☕ <strong>sdkman</strong><br><small>Java version manager</small></div>
  <div class="problem-card">🔧 <strong>direnv</strong><br><small>Env var scoping</small></div>
  <div class="problem-card">📋 <strong>Makefile</strong><br><small>Task runner</small></div>
  <div class="problem-card">📜 <strong>npm scripts</strong><br><small>More task runner</small></div>
  <div class="problem-card">💀 <strong>.nvmrc + .java-version</strong><br><small>Config files per tool</small></div>
</div>

<p class="callout-danger">6 tools to install, configure, and maintain.<br>Per developer. Per project. Per OS.</p>

Note:
Show of hands — how many of you have broken a project this week by switching Node versions?

---

<!-- .slide: data-background-color="#0F1117" data-auto-animate -->

## ✅ The Solution

<div class="solution-center">

```toml
# mise.toml — one file, every OS, every developer
[tools]
java  = "25"
node  = "24"
"aqua:apache/maven" = "3.9.14"

[env]
APP_ENV = "development"
_.file  = ".env.local"

[tasks.service]
depends = ["backend", "frontend"]
```

<div class="solution-badge">One file. Every OS. Every developer. Same result.</div>

</div>

Note:
This replaces all 6 tools. Let that sink in.

---

<!-- .slide: data-background-color="#0F1117" -->

## 8 Labs — La Brigade du Code

<div class="labs-grid">
  <div class="lab-card" data-fragment-index="0">
    <span class="ln">00</span>🔧
    <strong>Onboarding</strong>
    <small>Bootstrap · Shims · IDE</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="1">
    <span class="ln">01</span>🍳
    <strong>La Mise en Place</strong>
    <small>Versions · Lockfile</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="2">
    <span class="ln">02</span>🧅
    <strong>Les Ingrédients</strong>
    <small>Env · MISE_ENV profiles</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="3">
    <span class="ln">03</span>🥘
    <strong>Les Recettes</strong>
    <small>Tasks · Cross-platform</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="4">
    <span class="ln">04</span>🔥
    <strong>Le Coup de Feu</strong>
    <small>Hooks · Watchers</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="5">
    <span class="ln">05</span>🍽️
    <strong>Le Service</strong>
    <small>Full stack · Docker</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="6">
    <span class="ln">06</span>👨‍🍳
    <strong>Le Chef</strong>
    <small>Security · CI/CD · Docs</small>
  </div>
  <div class="lab-card fragment" data-fragment-index="7">
    <span class="ln">07</span>🤖
    <strong>Le Sous-Chef Digital</strong>
    <small>MCP · OpenCode · Copilot</small>
  </div>
</div>

Note:
Each lab builds on the previous. 20 minutes guided, 60 minutes autonomous.

---

<!-- .slide: data-background-color="#0F1117" data-auto-animate -->

## 🔧 Lab 00 — Zero Prerequisites

<div class="two-col">
<div>

### bash / zsh / fish
```bash
git clone https://github.com/maoudia/la-brigade-du-code
cd la-brigade-du-code
./bin/setup
```

### Windows PowerShell
```powershell
git clone https://github.com/maoudia/la-brigade-du-code
cd la-brigade-du-code
.\bin\setup.ps1
```

</div>
<div class="setup-steps">

**bin/setup does:**

✅ Checks git `2.53.0`

✅ Checks docker `29.4.0`

✅ Checks docker compose `5.1.2`

✅ Installs mise locally in `.mise/`

✅ Installs Java 25, Node 24, Maven

✅ Shows the kitchen banner 🍳

</div>
</div>

<p class="callout-info">Same pattern as <code>mvnw</code> / <code>gradlew</code> — your Java devs already know this.</p>

Note:
No mise? No problem. The bin/mise bootstrap script downloads it locally.
Does NOT touch ~/.bashrc, ~/.zshrc, or global PATH.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🍳 Lab 01 — La Mise en Place

<div class="terminal-demo">

```bash
# Your workstation — fill in the ???
[tools]
java  = "???"   # hint: latest LTS
node  = "???"   # hint: active LTS
maven = "???"   # hint: stable GA

# Then:
mise install          # installs everything
mise ls               # list active versions
mise settings set lockfile true
mise lock             # pin checksums
cat mise.lock         # inspect it
mise doctor           # diagnose env
mise run brigade      # win condition
```

</div>

### Win condition ✅

```
Java  : openjdk 25.0.x
Node  : v24.x.x
Maven : Apache Maven 3.9.14
```

Note:
Ask: "Why Java 25 and not 26?" — 26 is non-LTS, released March 2026.
Ask: "Why Node 24 and not 25?" — 25 is odd = non-LTS.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🧅 Lab 02 — Les Ingrédients

### Env scoping — no leaks between services

<div class="env-demo">

```bash
# From root
mise env | grep VITE         # (empty — root doesn't know frontend)

# From backend/
cd backend
mise env | grep SERVER_PORT  # 8080 ✅
mise env | grep VITE         # (empty) ✅

# From frontend/
cd ../frontend
mise env | grep VITE_API_URL # http://localhost:8080 ✅
mise env | grep SERVER_PORT  # (empty) ✅
```

</div>

### Environment switching

```bash
MISE_ENV=development mise env | grep DATABASE_URL
MISE_ENV=staging     mise env | grep DATABASE_URL
MISE_ENV=production  mise env | grep LOG_LEVEL
```

> Windows PowerShell: `$env:MISE_ENV="staging"; mise env | Select-String DATABASE_URL`

<p class="callout-success">One repo. Three environments. Zero .env files committed.</p>

Note:
This is where direnv users have their "aha" moment.
Show mise env --json for CI usage.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🥘 Lab 03 — Les Recettes

### Tasks replace Makefile + npm scripts

<div class="two-col">
<div>

```toml
[tasks.prep]
run         = "echo '[prep] ready'"
run_windows = "echo [prep] ready"

[tasks.cook]
depends     = ["prep"]
run         = "echo '[cook] cooking'"

[tasks.serve]
depends     = ["plate"]
confirm     = "Ready to serve?"
run         = "echo 'Bon appétit!'"

[tasks.announce]
usage = 'arg "<dish>"'
run   = 'echo "Tonight: $usage_dish"'
```

</div>
<div class="task-features">

**Cross-platform ✅**

| OS | Shell | Command |
|---|---|---|
| macOS | zsh | `mise run serve` |
| Linux | bash | `mise run serve` |
| Windows | pwsh | `mise run serve` |

No `&` operator. No `.bat` files.
No `Start-Process`.
mise handles parallelism natively.

</div>
</div>

Note:
Key: run_windows lets you write the OS-specific command once.
Warn about Tera deprecation — use usage field, not {{arg()}}

---

<!-- .slide: data-background-color="#0F1117" -->

## 🔥 Lab 04 — Le Coup de Feu

### Your terminal knows when you enter the kitchen

```toml
[hooks]
enter       = { task = "banner" }     # cd into project → banner fires
leave       = "echo 'Cuisine fermée 🔒'"
postinstall = "echo 'Installed: $MISE_INSTALLED_TOOLS'"

[tools]
node = { version = "24", postinstall = "npm install -g pnpm" }

[[watch_files]]
patterns = ["mise.toml"]
run      = "echo 'Config changed — reloading 🔄'"
```

<div class="callout-warning">

⚠️ Hooks require `mise activate` in your shell.

💡 Always use `{ task = "taskname" }` for cross-platform hooks.

</div>

Note:
Live demo: cd out, then cd back in. Show the banner firing automatically.
Postinstall: pnpm installed automatically after node.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🍽️ Lab 05 — Le Service

### One command. Backend + frontend. In parallel.

```bash
mise run service
```

<div class="parallel-demo">
  <div class="sbox be">
    <span>☕ backend</span>
    Spring Boot started on :8080
  </div>
  <div class="sbox fe">
    <span>🟢 frontend</span>
    Nuxt ready on :3000
  </div>
</div>

```bash
# Switch environments with Docker
MISE_ENV=staging     mise run docker   # staging ports
MISE_ENV=production  mise run docker   # prod config
```

> Windows PowerShell: `$env:MISE_ENV="staging"; mise run docker`

```bash
# Inspect config resolution chain
mise config ls
```

<p class="callout-success">http://localhost:3000 → 6 French recipes from the backend 🍳</p>

Note:
Show the parallel output interleaved. Backend and frontend starting simultaneously.
No & operator. Works identically on Windows PowerShell.

---

<!-- .slide: data-background-color="#0F1117" -->

## 👨‍🍳 Lab 06 — Le Chef

### The kitchen runs itself

<div class="chef-grid">

```bash
# Security first
mise trust
mise settings set paranoid true

# Generate everything
mise generate git-pre-commit --task check
mise generate github-action
mise generate task-docs

# Lockfile strict mode
mise settings set lockfile true
# [settings] locked = true

# Update mise itself
mise self-update
mise prune
```

<div class="chef-features">

**Generated automatically:**

📋 `.github/workflows/mise.yml`

🪝 `.git/hooks/pre-commit`

📄 `TASKS.md`

🚀 VitePress docs → GitHub Pages

</div>
</div>

Note:
The pre-commit hook calls mise run check — lint + format.
Generate github-action gives you jdx/mise-action@v4 already configured.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🤖 Lab 07 — Le Sous-Chef Digital

### Your AI agent reads your mise.toml

```bash
mise mcp
# MCP server started
# Exposes: tools, tasks, env vars, mise doctor
```

<div class="ai-prompts">

**Ask OpenCode or Copilot:**

💬 *"What tools am I using in this project?"*

💬 *"What tasks are available?"*

💬 *"What MISE_ENV profiles are configured?"*

💬 *"Suggest a mise task to run integration tests"*

</div>

<p class="callout-info">mise MCP server exposes your entire dev environment to AI agents. One configuration. Every tool.</p>

Note:
This is the bonus lab. Connect OpenCode first, then Copilot.
The AI will correctly identify Java 25, all tasks, MISE_ENV profiles.

---

<!-- .slide: data-background-color="#0F1117" -->

## 🚀 CI/CD — OS Matrix + Auto-Updates

<div class="ci-grid">

<div class="ci-card ci-blue">
  <h4>ci.yml</h4>
  <small>push + PR</small>
  <ul>
    <li>ubuntu-latest</li>
    <li>macos-latest</li>
    <li>windows-latest</li>
  </ul>
  <code>jdx/mise-action@v4</code>
</div>

<div class="ci-card ci-green">
  <h4>deploy.yml</h4>
  <small>push main</small>
  <ul>
    <li>Build VitePress</li>
    <li>Build slides</li>
    <li>GitHub Pages</li>
  </ul>
</div>

<div class="ci-card ci-yellow">
  <h4>update.yml</h4>
  <small>Every Monday 08:00</small>
  <ul>
    <li>mise outdated</li>
    <li>mise upgrade --bump</li>
    <li>Open PR automatically</li>
  </ul>
</div>

</div>

```yaml
- uses: jdx/mise-action@v4
  with:
    version: "2026.4.8"
    cache: true
    cache_key: "mise-v1-{{platform}}-{{version}}-{{file_hash}}"
    github_token: ${{ secrets.GITHUB_TOKEN }}
```

Note:
cache_key uses Handlebars — per-platform, per-version, per-config-hash.
github_token avoids GitHub API rate limits.

---

<!-- .slide: data-background-color="#0F1117" class="meta-slide" -->

## 🤌 The Meta-Moment

<div class="meta-grid">
  <div class="meta-item">✅ Pin exact versions of Java, Node, Maven</div>
  <div class="meta-item">✅ Manage env vars per directory</div>
  <div class="meta-item">✅ Run cross-platform tasks</div>
  <div class="meta-item">✅ Hook into your shell on cd</div>
  <div class="meta-item">✅ Watch files for auto-rebuild</div>
  <div class="meta-item">✅ Trust configs securely</div>
  <div class="meta-item">✅ Generate GitHub Actions CI</div>
  <div class="meta-item">✅ Generate pre-commit hooks</div>
  <div class="meta-item">✅ Auto-document all tasks</div>
  <div class="meta-item">✅ Deploy VitePress to GitHub Pages</div>
</div>

<div class="meta-quote fragment">

*"La cuisine a cuisinée elle-même.*
*The kitchen cooked itself."* 🍳

</div>

Note:
The VitePress site that just deployed? It contains this codelab.
The CI that deployed it? Generated by mise generate github-action.
The pre-commit hook that ran before the commit? Generated by mise generate git-pre-commit.

---

<!-- .slide: data-background-color="#0F1117" class="final-slide" -->

# Merci — Bon Appétit ! 🍽️

<div class="final-links">
  <div class="final-card">
    📦 <strong>Repo</strong><br>
    <a href="https://github.com/maoudia/la-brigade-du-code">github.com/maoudia/<br>la-brigade-du-code</a>
  </div>
  <div class="final-card">
    📖 <strong>Docs</strong><br>
    <a href="https://maoudia.github.io/la-brigade-du-code">maoudia.github.io/<br>la-brigade-du-code</a>
  </div>
  <div class="final-card">
    🔧 <strong>mise</strong><br>
    <a href="https://mise.jdx.dev">mise.jdx.dev</a>
  </div>
  <div class="final-card">
    💬 <strong>Questions?</strong><br>
    GitHub Discussions<br>or ask in chat
  </div>
</div>

<div class="final-quote">
  <em>"La cuisine a cuisinée elle-même."</em> 🤌
</div>

Note:
Drop the repo link in chat now.
Open GitHub Discussions for follow-up questions.
