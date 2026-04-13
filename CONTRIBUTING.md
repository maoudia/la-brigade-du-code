# Contributing

## Bug in a lab?

Open an issue with:
- Which lab (00-07)
- Your OS and shell
- Expected vs actual output
- `mise doctor` output

## Submit a fix

```bash
git checkout -b fix/lab-02-env-scoping
# make changes
git commit -m "fix(lab-02): correct env isolation"
# open PR
```

## Conventions

- Lab READMEs in English
- Tasks must have `run_windows` variant
- Use `usage` field — not Tera templates (deprecated 2026.11.0)
- Solutions in `lab-XX/solution/mise.toml`

## Run checks

```bash
mise run check
```
