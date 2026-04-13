# 🍳 Lab 01 — La Mise en Place

> *"A good cook prepares their workstation before touching a single ingredient."*

## What you'll learn
- `mise install`, `mise ls`, `mise lock`, `mise outdated`, `mise doctor`
- Autocomplete setup

📖 https://mise.jdx.dev/getting-started.html

## Your workstation

```toml
# mise.toml — TODO: fill in the versions
[tools]
java  = "???"  # latest LTS
node  = "???"  # active LTS  
"aqua:apache/maven" = "???"  # latest stable GA

[tasks.brigade]
description = "Verify the brigade is ready"
run = '''
echo "Java  : $(java --version 2>&1 | head -1)"
echo "Node  : $(node --version)"
echo "Maven : $(mvn --version 2>&1 | head -1)"
'''
run_windows = "java --version && node --version && mvn --version"
```

## Steps

1. Research latest LTS versions (Java/Node/Maven)
2. Replace `"???"` with real versions
3. `mise install`
4. `mise ls`
5. `mise settings set lockfile true && mise lock && cat mise.lock`
6. `mise doctor`
7. `mise run brigade`

## Win condition ✅

```
Java  : openjdk 25.0.x
Node  : v24.x.x
Maven : Apache Maven 3.9.14
```

## Autocomplete

```bash
echo 'eval "$(mise completion zsh)"' >> ~/.zshrc && source ~/.zshrc
# Then: mise run <TAB>
```
📖 https://mise.jdx.dev/installing-mise.html#autocompletion

## Bonus 🌶️
- `mise outdated` — why not latest non-LTS?
- Change `java = "lts"` — same result?
- `mise lock` checksum — why does CI care?
