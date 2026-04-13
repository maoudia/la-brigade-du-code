# Diagrams

Architecture and flow diagrams for La Brigade du Code, generated from PlantUML sources in [`diagrams/`](https://github.com/maoudia/la-brigade-du-code/tree/main/diagrams).

> To regenerate locally: `mise run diagrams:render`

---

## mise Architecture Overview

Full architecture showing how `mise.toml`, the mise engine, runtimes, shims and IDEs connect.

<img src="/diagrams/mise-architecture.svg" alt="mise Architecture" style="background:white">

---

## Zero-Prerequisite Bootstrap Flow

How `bin/setup` bootstraps a developer from a fresh clone to a working kitchen.

<img src="/diagrams/bootstrap-flow.svg" alt="Bootstrap Flow" style="background:white">

---

## Environment Scoping

How `[env]` variables are inherited from root → backend/frontend, and how `MISE_ENV` profiles overlay them.

<img src="/diagrams/env-scoping.svg" alt="Environment Scoping" style="background:white">

---

## Task Dependency Graph

How `depends`, parallel tasks, and the pre-commit chain are wired together.

<img src="/diagrams/task-dependencies.svg" alt="Task Dependencies" style="background:white">

---

## Shims vs Activate

When to use `mise activate` (interactive shell) vs shims (IDEs, CI, git hooks).

<img src="/diagrams/shims-vs-activate.svg" alt="Shims vs Activate" style="background:white">
