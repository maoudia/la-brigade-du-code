# OpenCode Agent Configuration
# La Brigade du Code

## Stack
- Java 25 (Spring Boot 4.0.5) — backend
- Node 24 (Nuxt 4.4) — frontend
- Maven 3.9.14 — build tool
- mise 2026.4.8 — tool manager

## Architecture
- Hexagonal / Clean Architecture
- mise.toml as single source of truth for versions and tasks
- MISE_ENV for environment profiles (development/staging/production)

## Conventions
- No Lombok — use Java records
- No .env files committed — use [env] in mise.toml
- Tasks must have run_windows variant for cross-platform
- Use `usage` field for task arguments, NOT Tera templates

## Available mise tasks
Run `mise tasks ls` to see all available tasks.
Key tasks: service, backend, frontend, check, docs:dev, release

## Environment switching
MISE_ENV=staging mise run service
MISE_ENV=production mise env
