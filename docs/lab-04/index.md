# 🔥 Lab 04 — Le Coup de Feu

> *"Le coup de feu is rush hour. Everything must be perfectly in place."*

## What you'll learn
- `[hooks] enter` — banner on cd
- `[hooks] leave` — farewell message
- `[hooks] postinstall` — after tool install
- `MISE_INSTALLED_TOOLS` — JSON array from mise
- `[[watch_files]]` — re-run on file change
- Tool-level `postinstall` — e.g. install pnpm after node

📖 https://mise.jdx.dev/hooks.html

> ⚠️ Hooks require `mise activate` in your shell. Shims only = no hooks.

## Your workstation

```toml
[tools]
node = { version = "24", postinstall = "???" }  # install pnpm after node

[hooks]
enter       = "???"  # show welcome banner
leave       = "???"  # show goodbye message
postinstall = "???"  # show MISE_INSTALLED_TOOLS

[[watch_files]]
patterns = ["???"]   # watch mise.toml
run      = "???"     # echo a message on change
```

> 💡 Always use `{ task = "taskname" }` for cross-platform hooks
> ```toml
> [hooks]
> enter = { task = "banner" }  # cross-platform ✅
> ```
> 📖 https://mise.jdx.dev/hooks.html#task-hooks

## Win condition ✅

On `cd` into the directory:
```
Bienvenue en cuisine, <CHEF_NAME> ! 👨‍🍳
Java: 25.x.x | Node: v24.x.x | ENV: development
```

On `cd` out:
```
Bonne soirée <CHEF_NAME>, la cuisine est fermée 🔒
```

After `mise install`:
```
Just installed: [{"name":"node","version":"24.x.x"}]
pnpm --version  # 9.x.x
```

## Bonus 🌶️
- Add a `cd` hook — fires on every directory change
- Add `[[watch_files]]` on `**/*.java` → runs `mise run build`
- What if the enter hook has a bug? Does mise break?
