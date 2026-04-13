# 🍽️ Lab 05 — Le Service

> *"Le service is the moment backend and frontend dance in perfect sync."*

## What you'll learn
- Parallel `depends` — run tasks simultaneously
- `.mise.local.toml` — personal gitignored overrides
- `mise config ls` — full config resolution chain
- `MISE_ENV` — environment profiles with Docker
- Cross-platform parallel startup

📖 https://mise.jdx.dev/tasks/monorepo.html | https://mise.jdx.dev/configuration/environments.html

## Your workstation

```toml
# root mise.toml — wire up the parallel service task
[tasks.service]
description = "???"
depends     = ["???", "???"]  # both backend AND frontend

# backend/mise.toml
[tasks.backend]
dir = "backend"
run = "???"           # how to start Spring Boot with Maven?

# frontend/mise.toml
[tasks.frontend]
dir = "frontend"
run = "???"           # how to start Nuxt dev server?
```

## Environment switching with Docker

:::code-group
```bash [bash / zsh]
MISE_ENV=development mise run docker  # uses docker-compose.yml
MISE_ENV=staging mise run docker      # uses docker-compose.staging.yml
```
```powershell [PowerShell]
$env:MISE_ENV="development"; mise run docker  # uses docker-compose.yml
$env:MISE_ENV="staging";     mise run docker  # uses docker-compose.staging.yml
```
:::

## Steps

1. `mise config ls` — observe the config chain
2. Fill in backend and frontend tasks
3. Wire up parallel `depends` in service task
4. `cp .env.local.example .env.local` and set CHEF_NAME
5. `mise run install-frontend`
6. `mise run service`

## Win condition ✅

```bash
mise run service
# [backend]  Spring Boot started on :8080
# [frontend] Nuxt ready on :3000
```

Open `http://localhost:3000` — see the 6 French recipes 🍳

:::code-group
```bash [bash / zsh]
curl http://localhost:8080/recettes
# [{"nom":"Bouillabaisse","region":"Provence",...}]
```
```powershell [PowerShell]
Invoke-RestMethod http://localhost:8080/recettes
# nom           region
# ---           ------
# Bouillabaisse Provence ...
```
:::

## Bonus 🌶️
- `mise run docker` vs `mise run service` — startup time difference?

:::code-group
```bash [bash / zsh]
MISE_ENV=staging mise env | grep DATABASE_URL
```
```powershell [PowerShell]
$env:MISE_ENV="staging"; mise env | Select-String DATABASE_URL
```
:::

- `mise config ls --json` — how to use in CI?
