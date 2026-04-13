# 🧅 Lab 02 — Les Ingrédients

> *"Every ingredient has its place. You don't put salt where the sugar goes."*

## What you'll learn
- `[env]` scoped per directory
- `_.file` to merge `.env.local`
- `MISE_ENV` for dev/staging/production profiles
- `mise env` to inspect injected vars
- Parent/child isolation — backend vs frontend

📖 https://mise.jdx.dev/environments/ | https://mise.jdx.dev/configuration/environments.html

## Bug to fix

The root `mise.toml` has `VITE_API_URL` which should only exist in `frontend/`.
Find it, move it, verify isolation.

## MISE_ENV profiles

:::code-group
```bash [bash / zsh]
# Switch environments with one variable
MISE_ENV=development mise env | grep DATABASE_URL
MISE_ENV=staging mise env | grep DATABASE_URL
MISE_ENV=production mise env | grep LOG_LEVEL
```
```powershell [PowerShell]
# Switch environments with one variable
$env:MISE_ENV="development"; mise env | Select-String DATABASE_URL
$env:MISE_ENV="staging";     mise env | Select-String DATABASE_URL
$env:MISE_ENV="production";  mise env | Select-String LOG_LEVEL
```
:::

## Win condition ✅

:::code-group
```bash [bash / zsh]
# From root — VITE vars must NOT appear
mise env | grep VITE   # (empty)

# From backend/
cd backend && mise env | grep SERVER_PORT   # 8080
cd backend && mise env | grep VITE          # (empty)

# From frontend/
cd ../frontend && mise env | grep VITE_API_URL   # http://localhost:8080
cd ../frontend && mise env | grep SERVER_PORT     # (empty)
```
```powershell [PowerShell]
# From root — VITE vars must NOT appear
mise env | Select-String VITE   # (empty)

# From backend/
cd backend; mise env | Select-String SERVER_PORT   # 8080
cd backend; mise env | Select-String VITE          # (empty)

# From frontend/
cd ..\frontend; mise env | Select-String VITE_API_URL   # http://localhost:8080
cd ..\frontend; mise env | Select-String SERVER_PORT     # (empty)
```
:::

## Bonus 🌶️
- `mise env --json` — how to use this in CI?
- What wins: root var or child var with same name?
- `MISE_ENV=staging mise run service` — what changes?

### Bonus — simulate https://brigade.io locally

:::code-group
```bash [bash / zsh]
# Add brigade.io → 127.0.0.1 to your hosts file
mise run hosts:add

# Start prod stack
mise run docker:prod

# brigade.io now resolves to localhost
curl http://brigade.io:8080/recettes

# Clean up
mise run hosts:remove
```
```powershell [PowerShell]
# Add brigade.io → 127.0.0.1 to your hosts file
mise run hosts:add

# Start prod stack
mise run docker:prod

# brigade.io now resolves to localhost
Invoke-RestMethod http://brigade.io:8080/recettes

# Clean up
mise run hosts:remove
```
:::

> 💡 `extra_hosts: brigade.io:host-gateway` in `docker-compose.prod.yml`
> maps `brigade.io` inside the container to the host machine.
> `hosts:add` maps it on the host itself.
> Same trick used by teams to test prod configs without real DNS.

