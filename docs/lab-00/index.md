# 🔧 Lab 00 — Onboarding

> *"Before the kitchen opens, every chef sets up their workstation."*

---

## What you'll learn

- Zero-prerequisite bootstrap with `bin/mise`
- Why bootstrap > `curl | sh` (security + reproducibility)
- Shims — the IDE bridge
- IntelliJ + VSCode integration
- Autocomplete setup

---


## Docker or Podman?

This codelab uses `docker` and `docker compose` commands.
Both Docker Engine and Podman work — the CLI is identical.

| Engine | macOS | Linux | Windows |
|---|---|---|---|
| Docker Engine | `brew install docker` + colima | `apt/dnf install docker-ce` | Native install |
| Podman | `brew install podman` | `apt/dnf install podman` | `winget install RedHat.Podman` |

**Podman — expose docker CLI:**
```bash
# macOS/Linux — add alias
echo 'alias docker=podman' >> ~/.zshrc
echo 'alias docker-compose="podman compose"' >> ~/.zshrc

# Or install podman-docker package (Linux)
sudo apt install podman-docker     # Debian/Ubuntu
sudo dnf install podman-docker     # Fedora/RHEL
```

**Verify — same command regardless of engine:**
```bash
docker --version          # works with both
docker compose version    # works with both
```

## Pre-flight check

Run the setup script — it checks everything:

**bash/zsh/fish (macOS/Linux/WSL)**
```bash
./bin/setup
```

**PowerShell (Windows)**
```powershell
.\bin\setup.ps1
```

> 💡 **Docker or Podman** — both work. mise tasks always call `docker` and `docker compose`.
> Podman provides a `docker` alias — transparent to all scripts.

Expected output:
```
=======================================
   La Brigade du Code 🍳
   Pre-flight Check
=======================================

🛠️  System Tools:
  ✓ git             2.53.0
  ✓ docker          29.4.0   # Docker Engine OR Podman with docker alias
  ✓ docker compose  5.1.2   # docker compose OR podman compose

🔍 Checking mise...
  ✓ mise 2026.4.8 installed in .mise/

📦 Installing tools...
  ✓ java  25.0.x
  ✓ node  v24.x.x
  ✓ maven 3.9.14

✓ Ready to cook !
```

---

## Why bin/setup and not curl | sh ?

| | `curl \| sh` | `./bin/setup` |
|---|---|---|
| Modifies your shell | ✅ yes | ❌ no |
| Global install | ✅ `~/.local/bin` | ❌ `.mise/` local |
| Admin rights needed | sometimes | ❌ never |
| Version conflicts | possible | ❌ impossible |
| Checksum verified | ❌ dynamic | ✅ committed |
| CI-ready | needs config | ✅ native |

> 💡 Same pattern as `mvnw` / `gradlew` — your Java devs already know this.

📖 https://mise.jdx.dev/cli/generate/bootstrap.html

---


## Install docker and docker compose

The codelab needs `docker` and `docker compose` commands.
The **engine** can be Docker or Podman — both provide the same CLI.

| OS | Docker | Podman (alternative) |
|---|---|---|
| macOS | `brew install docker` + Docker CLI | `brew install podman && brew install podman-compose` |
| Linux | `apt install docker-ce docker-compose-plugin` | `apt install podman podman-docker podman-compose` |
| Windows | [Docker Engine for Windows](https://docs.docker.com/engine/install/) | [Podman Desktop](https://podman.io) — provides `docker` alias |

> Podman is daemon-less, rootless, and Docker API-compatible.
> `podman-docker` installs a `docker` shim so all scripts work unchanged.

## Shims — the IDE bridge

```bash
# Enable shims for your shell
# bash/zsh
echo 'eval "$(mise activate zsh --shims)"' >> ~/.zprofile

# fish
echo 'mise activate fish --shims | source' >> ~/.config/fish/config.fish
```

Then restart your shell.

Why shims matter:
- IntelliJ and VSCode don't source your shell
- They launch processes directly — they never see `mise activate`
- Shims live at a **stable fixed path** IDEs can point to
- Every project gets the right version automatically

📖 https://mise.jdx.dev/dev-tools/shims.html

---

## IntelliJ Setup

### Option A — Plugin (recommended)
Install: https://github.com/134130/intellij-mise
- Auto-configures JDK from `mise.toml`
- Runs mise tasks from IDE
- Loads `[env]` in run configurations

### Option B — Manual SDK
`Project Structure > SDK > Add SDK`
Path: `~/.local/share/mise/shims/java`

### Option C — asdf symlink fallback
```bash
ln -s ~/.local/share/mise ~/.asdf
```
Then IntelliJ detects it as asdf SDKs.

📖 https://mise.jdx.dev/ide-integration.html#jetbrains-editors

---

## VSCode Setup

### Option A — Plugin (recommended)
Install: https://marketplace.visualstudio.com/items?itemName=hverlin.mise-vscode
- Auto-configures all extensions
- Manages tasks directly from VSCode
- Loads `[env]` from `mise.toml`
- Autocomplete + snippets for `mise.toml`

### Option B — settings.json
See [`ide/vscode-settings.json`](ide/vscode-settings.json)

📖 https://mise.jdx.dev/ide-integration.html#vscode

---

## Autocomplete

```bash
# bash
echo 'eval "$(mise completion bash)"' >> ~/.bashrc && source ~/.bashrc

# zsh
echo 'eval "$(mise completion zsh)"' >> ~/.zshrc && source ~/.zshrc

# fish
mise completion fish >> ~/.config/fish/completions/mise.fish
```

Then try:
```bash
mise run <TAB>        # shows all tasks with descriptions
mise use java@<TAB>   # shows available Java versions
mise <TAB>            # shows all commands
```

📖 https://mise.jdx.dev/installing-mise.html#autocompletion

---

## Win condition ✅

```bash
mise doctor
```

All green:
```
mise: 2026.4.8
activated: true
shims_on_path: true
```

```bash
mise run banner
```

Shows full kitchen status with git, docker, Java, Node versions.

---

## Bonus challenges 🌶️

- What is the difference between `mise activate` and shims? When would you use each?
- Run `mise bin-paths` — what does it show?
- Try `mise where java` — what path does it return?
- Point IntelliJ SDK to the shim path. Does hot-reload still work?
