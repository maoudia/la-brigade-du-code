# 🥘 Lab 03 — Les Recettes

> *"A recipe is a list of tasks in the right order. No shortcuts."*

## What you'll learn
- `[tasks]` TOML inline definition
- `depends` — task dependencies
- `dir` — run in specific subdirectory
- `usage` field for typed arguments (NOT deprecated Tera templates)
- `run_windows` — cross-platform tasks
- `confirm` — prompt before dangerous task
- `mise tasks ls`, `mise run` interactive picker

📖 https://mise.jdx.dev/tasks/toml-tasks.html | https://mise.jdx.dev/tasks/task-arguments.html

## Your workstation

Wire up: `prep` → `cook` → `plate` → `serve`

```toml
[tasks.prep]
description = "???"
run         = "???"
run_windows = "???"

[tasks.cook]
description = "???"
depends     = ["???"]  # must run after prep
run         = "???"

[tasks.plate]
description = "???"
depends     = ["???"]
run         = "???"

[tasks.serve]
description = "???"
depends     = ["???"]
confirm     = "Are you sure the dish is ready?"
run         = "???"

[tasks.announce]
description = "Announce a dish to the dining room"
usage       = 'arg "<dish>" help="Name of dish to announce"'
run         = 'echo "Tonight we serve: $usage_dish !"'
run_windows = 'echo Tonight we serve: %usage_dish% !'
```

> ⚠️ Use `usage` field for arguments — NOT <span v-pre>`{{arg()}}`</span> (deprecated, removed in mise 2026.11.0)
> 📖 https://mise.jdx.dev/tasks/task-arguments.html

## Win condition ✅

```bash
mise run serve
# [prep]  Ingredients checked ✓
# [cook]  Cooking in progress... ✓
# [plate] Plating complete ✓
# Are you sure the dish is ready? [y/n] y
# [serve] Bon appétit ! 🍽️

mise run announce "Bouillabaisse"
# Tonight we serve: Bouillabaisse !
```

## Cross-platform power 🌍
`mise run serve` works identically on macOS, Linux, Windows.
No & operator. No Start-Process. mise handles parallelism natively.

## Bonus 🌶️
- Add `alias = "s"` to serve — run with `mise run s`
- Add `hide = true` to a task — does it appear in `mise tasks ls`?
- `mise run` with no args — explore interactive picker
