# Lab 02 — Notes

## Key fixes
- Removed VITE_API_URL from root mise.toml — it belonged in frontend/
- Added _.file = ".env.local" to load personal secrets
- backend/mise.toml has SERVER_PORT, frontend/mise.toml has VITE_* vars
- Parent/child scoping ensures no leakage between services
