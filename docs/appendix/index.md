# Appendix — mise Features Not Covered in the Codelab

> This appendix documents every mise feature that was not covered in Labs 00-07.
> Consider it your "what to explore next" reference.
> All links point to the official mise documentation at https://mise.jdx.dev

---

## Tool Management

| Feature | What it does | Command | Docs |
|---|---|---|---|
| `mise sync node` | Sync Node versions installed by nvm/volta into mise | `mise sync node` | [link](https://mise.jdx.dev/cli/sync/node.html) |
| `mise sync python` | Sync Python envs from pyenv into mise | `mise sync python` | [link](https://mise.jdx.dev/cli/sync/python.html) |
| `mise sync ruby` | Sync Ruby versions from rbenv into mise | `mise sync ruby` | [link](https://mise.jdx.dev/cli/sync/ruby.html) |
| `mise config generate` | Generate `mise.toml` from existing `.tool-versions` (asdf migration) | `mise config generate` | [link](https://mise.jdx.dev/cli/generate/config.html) |
| `mise link` | Link an externally installed binary as a mise-managed tool | `mise link java /path/to/jdk` | [link](https://mise.jdx.dev/cli/link.html) |
| `mise install-into` | Install a tool binary into a custom directory (e.g. Dockerfile) | `mise install-into node /usr/local` | [link](https://mise.jdx.dev/cli/install-into.html) |
| `mise where` | Print the installation path of a tool | `mise where java` | [link](https://mise.jdx.dev/cli/where.html) |
| `mise which` | Print the path of the active tool binary | `mise which java` | [link](https://mise.jdx.dev/cli/which.html) |
| `mise latest` | Print the latest available version of a tool | `mise latest node` | [link](https://mise.jdx.dev/cli/latest.html) |
| `mise ls-remote` | List all available versions of a tool | `mise ls-remote java` | [link](https://mise.jdx.dev/cli/ls-remote.html) |
| `mise search` | Search the mise registry for a tool | `mise search terraform` | [link](https://mise.jdx.dev/cli/search.html) |
| `mise registry` | List all tools available in the mise registry (1000+) | `mise registry` | [link](https://mise.jdx.dev/cli/registry.html) |
| `mise unuse` | Remove a tool from `mise.toml` cleanly | `mise unuse node` | [link](https://mise.jdx.dev/cli/unuse.html) |
| `mise shell` | Set a tool version for the current shell session only | `mise shell node 20` | [link](https://mise.jdx.dev/cli/shell.html) |
| `mise alias set` | Define short aliases for tools globally | `mise alias set jdk java` | [link](https://mise.jdx.dev/cli/alias/set.html) |
| Tool stubs | Generate `bin/<tool>` wrapper scripts for tools | `mise generate tool-stubs` | [link](https://mise.jdx.dev/cli/generate/tool-stubs.html) |

---

## Backends (Install Sources)

mise can install tools from many ecosystems beyond its core registry:

| Backend | What it installs | Example |
|---|---|---|
| `npm:` | Any npm package as a global CLI | `mise use npm:@anthropic-ai/claude-code` |
| `pipx:` | Any Python CLI via pipx | `mise use pipx:black` |
| `cargo:` | Any Rust crate binary | `mise use cargo:ripgrep` |
| `github:` | Any GitHub release binary | `mise use github:BurntSushi/ripgrep` |
| `aqua:` | Tools from the aqua registry | `mise use aqua:cli/cli` |
| `go:` | Any Go module binary | `mise use go:github.com/goreleaser/goreleaser` |
| `http:` | Any binary from a direct URL | `mise use http:https://example.com/tool.tar.gz` |
| `ubi:` | Universal Binary Installer | `mise use ubi:thoughtworks/talisman` |
| `dotnet:` | .NET tools | `mise use dotnet:dotnet-ef` |
| `gem:` | Ruby gems as CLIs | `mise use gem:bundler` |

📖 https://mise.jdx.dev/dev-tools/backends/

---

## Task System

| Feature | What it does | Example | Docs |
|---|---|---|---|
| File tasks | Tasks as executable scripts in `mise/tasks/` | `mise/tasks/build.sh` | [link](https://mise.jdx.dev/tasks/file-tasks.html) |
| Remote tasks | Execute a script hosted on HTTP/Git | `file = "https://example.com/build.sh"` | [link](https://mise.jdx.dev/tasks/toml-tasks.html#remote-tasks) |
| Task `sources` + `outputs` | Skip task if source files unchanged (incremental builds) | `sources = ["src/**/*.rs"]` | [link](https://mise.jdx.dev/tasks/toml-tasks.html#sources-outputs) |
| `mise run --jobs N` | Run N tasks in parallel | `mise run --jobs 4 test lint build` | [link](https://mise.jdx.dev/tasks/running-tasks.html) |
| `mise tasks validate` | Validate all task definitions for errors | `mise tasks validate` | [link](https://mise.jdx.dev/cli/tasks/validate.html) |
| `mise tasks deps` | Show task dependency graph | `mise tasks deps` | [link](https://mise.jdx.dev/cli/tasks/deps.html) |
| `mise tasks info` | Show detailed info about a specific task | `mise tasks info service` | [link](https://mise.jdx.dev/cli/tasks/info.html) |
| `mise tasks add` | Add a task via CLI without editing mise.toml | `mise tasks add test -- cargo test` | [link](https://mise.jdx.dev/cli/tasks/add.html) |
| `mise tasks edit` | Open a task in your editor | `mise tasks edit service` | [link](https://mise.jdx.dev/cli/tasks/edit.html) |
| Task `wait_for` | Like `depends` but non-blocking | `wait_for = ["db-ready"]` | [link](https://mise.jdx.dev/tasks/task-configuration.html) |
| Task `depends_post` | Run tasks AFTER this one completes | `depends_post = ["cleanup"]` | [link](https://mise.jdx.dev/tasks/task-configuration.html) |
| Task templates | Use Tera templating in task scripts | <span v-pre>`run = "echo {{env.APP_ENV}}"`</span> | [link](https://mise.jdx.dev/tasks/templates.html) |
| Task monorepo | Discover and run tasks across subprojects | `mise run --cd backend build` | [link](https://mise.jdx.dev/tasks/monorepo.html) |
| Task sandboxing | Restrict filesystem/network access for a task | `[tasks.build] deny_net = true` | [link](https://mise.jdx.dev/sandboxing.html) |
| `mise generate task-stubs` | Generate `bin/<task>` shims for each task | `mise generate task-stubs` | [link](https://mise.jdx.dev/cli/generate/task-stubs.html) |
| `mise generate task-docs` | Auto-generate TASKS.md from task descriptions | `mise generate task-docs` | [link](https://mise.jdx.dev/cli/generate/task-docs.html) |
| `mise watch` | Watch files and re-run tasks on change | `mise watch build` | [link](https://mise.jdx.dev/cli/watch.html) |

---

## Environment & Configuration

| Feature | What it does | Example | Docs |
|---|---|---|---|
| `mise en` | Spawn a subshell with a project's env without cd-ing | `mise en ~/projects/api` | [link](https://mise.jdx.dev/cli/en.html) |
| `mise env --json` | Output all env vars as JSON (for CI/scripting) | `mise env --json` | [link](https://mise.jdx.dev/cli/env.html) |
| `mise set` | Set an env var in mise.toml directly from CLI | `mise set APP_ENV=staging` | [link](https://mise.jdx.dev/cli/set.html) |
| `mise unset` | Remove an env var from mise.toml | `mise unset APP_ENV` | [link](https://mise.jdx.dev/cli/unset.html) |
| Shell aliases | Define shell aliases that activate with the project | `[shell_alias] ll = "ls -la"` | [link](https://mise.jdx.dev/shell-aliases.html) |
| SOPS secrets | Decrypt secrets with SOPS on `cd` | `_.sops = "secrets.enc.yaml"` | [link](https://mise.jdx.dev/environments/secrets/sops.html) |
| age secrets | Decrypt secrets with age on `cd` | `_.age = "secrets.age"` | [link](https://mise.jdx.dev/environments/secrets/age.html) |
| `[vars]` in tasks | Non-env variables shared between tasks | `[vars] e2e_args = "--headless"` | [link](https://mise.jdx.dev/tasks/task-configuration.html#vars-options) |
| `mise config get` | Read a specific config value | `mise config get tools.java` | [link](https://mise.jdx.dev/cli/config/get.html) |
| `mise config set` | Write a config value from CLI | `mise config set settings.paranoid true` | [link](https://mise.jdx.dev/cli/config/set.html) |
| `mise fmt` | Auto-format and normalize `mise.toml` | `mise fmt` | [link](https://mise.jdx.dev/cli/fmt.html) |
| URL replacements | Redirect download URLs (air-gapped / mirror environments) | `[url_replacements]` | [link](https://mise.jdx.dev/url-replacements.html) |
| Configuration profiles | Per-environment config files | `mise.test.toml`, `mise.ci.toml` | [link](https://mise.jdx.dev/configuration/environments.html) |

---

## Hooks (Not Covered in Lab 04)

| Hook | When it fires | Docs |
|---|---|---|
| `[hooks] cd` | Every time the directory changes (not just enter) | [link](https://mise.jdx.dev/hooks.html#cd-hook) |
| `[hooks] preinstall` | Before tools are installed | [link](https://mise.jdx.dev/hooks.html#preinstall-postinstall-hook) |
| `[hooks.enter] shell` | Run arbitrary shell code in current shell on enter | [link](https://mise.jdx.dev/hooks.html#shell-hooks) |
| `[[watch_files]] task` | Use a task reference instead of inline script | `task = "my-task"` | [link](https://mise.jdx.dev/hooks.html#watch-files-hook) |
| Multiple hooks array | Define multiple hooks of the same type | `enter = ["cmd1", { task = "t" }]` | [link](https://mise.jdx.dev/hooks.html#multiple-hooks-syntax) |

---

## Security & Trust

| Feature | What it does | Docs |
|---|---|---|
| `mise trust --untrust` | Revoke trust for a config file | [link](https://mise.jdx.dev/cli/trust.html) |
| `MISE_TRUSTED_CONFIG_PATHS` | Pre-trust paths via env var (CI/CD) | `MISE_TRUSTED_CONFIG_PATHS=/` | [link](https://mise.jdx.dev/getting-started.html#trust) |
| `mise settings trusted_config_paths` | Pre-trust paths via settings | `mise settings trusted_config_paths=["/"]` | [link](https://mise.jdx.dev/configuration/settings.html) |
| GitHub token | Inspect which GitHub token mise will use | `mise github token` | [link](https://mise.jdx.dev/dev-tools/github-tokens.html) |

---

## Generate Commands (Not Covered in Labs)

| Command | What it generates | Docs |
|---|---|---|
| `mise generate devcontainer` | `.devcontainer/devcontainer.json` for VS Code/Codespaces | [link](https://mise.jdx.dev/cli/generate/devcontainer.html) |
| `mise generate bootstrap` | `bin/mise` self-installing wrapper (covered in Lab 00) | [link](https://mise.jdx.dev/cli/generate/bootstrap.html) |
| `mise generate tool-stub` | HTTP binary stub with checksum | [link](https://mise.jdx.dev/cli/generate/tool-stub.html) |

---

## Advanced & Internals

| Feature | What it does | Docs |
|---|---|---|
| `mise mcp` | Start mise as an MCP server for AI agents | [link](https://mise.jdx.dev/mcp.html) |
| `mise exec` (one-off) | Run a command with a specific tool version without installing | `mise exec node@18 -- node script.js` | [link](https://mise.jdx.dev/cli/exec.html) |
| `mise implode` | Remove all mise data (nuclear option) | `mise implode` | [link](https://mise.jdx.dev/cli/implode.html) |
| `mise reshim` | Regenerate all shims after manual changes | `mise reshim` | [link](https://mise.jdx.dev/cli/reshim.html) |
| `mise bin-paths` | Print all paths mise adds to PATH | `mise bin-paths` | [link](https://mise.jdx.dev/cli/bin-paths.html) |
| `mise deactivate` | Remove mise from current shell session | `mise deactivate` | [link](https://mise.jdx.dev/cli/deactivate.html) |
| `mise cache prune` | Remove only expired cache entries | `mise cache prune` | [link](https://mise.jdx.dev/cli/cache/prune.html) |
| `mise cache path` | Print the cache directory path | `mise cache path` | [link](https://mise.jdx.dev/cli/cache/path.html) |
| `mise upgrade --interactive` | Interactively choose which tools to upgrade | `mise upgrade --interactive` | [link](https://mise.jdx.dev/cli/upgrade.html) |
| `mise upgrade --dry-run` | Preview what would be upgraded | `mise upgrade --dry-run` | [link](https://mise.jdx.dev/cli/upgrade.html) |
| Backend architecture | How mise plugin system works internally | — | [link](https://mise.jdx.dev/dev-tools/backend_architecture.html) |
| `mise test-tool` | Test that a tool works after install | `mise test-tool java` | [link](https://mise.jdx.dev/cli/test-tool.html) |
| Neovim integration | Prepend shims to PATH in Neovim LSP | `vim.env.PATH = ...shims...` | [link](https://mise.jdx.dev/ide-integration.html#neovim) |
| Emacs integration | mise.el package for per-buffer env vars | `(global-mise-mode)` | [link](https://mise.jdx.dev/ide-integration.html#emacs) |
| Xcode integration | Use mise tools in Xcode build phases | `eval "$(mise activate bash --shims)"` | [link](https://mise.jdx.dev/ide-integration.html#xcode) |
| Zinit integration | Load mise via Zinit plugin manager (zsh) | — | [link](https://mise.jdx.dev/tips-and-tricks.html) |
| `mise self-update --version` | Pin mise to a specific version | `mise self-update --version 2026.4.8` | [link](https://mise.jdx.dev/cli/self-update.html) |

---

## CI/CD Integrations Not Covered

| Platform | How to use mise | Docs |
|---|---|---|
| **GitLab CI** | `./bin/mise install` + cache `.mise/` | [link](https://mise.jdx.dev/continuous-integration.html) |
| **CircleCI** | Download + cache mise binary | [link](https://mise.jdx.dev/continuous-integration.html) |
| **Jenkins** | Use shims path in agent PATH | [link](https://mise.jdx.dev/continuous-integration.html) |
| **Xcode Cloud** | `ci_post_clone.sh` with mise activate | [link](https://mise.jdx.dev/continuous-integration.html) |
| **Docker** | `mise install-into` for Dockerfile tooling | [link](https://mise.jdx.dev/mise-cookbook/docker.html) |

---

## Cookbooks (Real-World Recipes)

| Cookbook | What it covers | Docs |
|---|---|---|
| Node.js | `engines` sync, pnpm, corepack | [link](https://mise.jdx.dev/mise-cookbook/nodejs.html) |
| Python | venv, uv, pip, Poetry | [link](https://mise.jdx.dev/mise-cookbook/python.html) |
| Ruby | Bundler, Rails setup | [link](https://mise.jdx.dev/mise-cookbook/ruby.html) |
| C++ | Compilers, CMake | [link](https://mise.jdx.dev/mise-cookbook/cpp.html) |
| Terraform | Multiple workspace versions | [link](https://mise.jdx.dev/mise-cookbook/terraform.html) |
| Docker | Dockerfile patterns with mise | [link](https://mise.jdx.dev/mise-cookbook/docker.html) |
| Presets | Shared config presets across projects | [link](https://mise.jdx.dev/mise-cookbook/presets.html) |
| Shell tricks | Aliases, prompt integration, Zinit | [link](https://mise.jdx.dev/mise-cookbook/shell-tricks.html) |
| Neovim | LSP + Treesitter integration | [link](https://mise.jdx.dev/mise-cookbook/neovim.html) |

---

## Settings Reference (Key Ones)

| Setting | Default | What it controls |
|---|---|---|
| `lockfile` | `false` | Enable mise.lock generation |
| `locked` | `false` | Strict mode — fail if tool not in lockfile |
| `paranoid` | `false` | Always prompt before trusting config |
| `jobs` | `4` | Parallel tool install count |
| `install_before` | none | Min age of release before install (supply chain) |
| `always_keep_install` | `false` | Keep old tool versions after upgrade |
| `not_found_auto_install` | `true` | Auto-install tool when command not found |
| `task_output` | `prefix` | How task output is displayed |
| `raw` | `false` | Pass stdin/stdout directly to tasks |
| `log_level` | `info` | Log verbosity: trace/debug/info/warn/error |
| `quiet` | `false` | Suppress non-error output |
| `experimental` | `false` | Enable experimental features |

📖 Full settings reference: https://mise.jdx.dev/configuration/settings.html

---

## How I Use mise (jdx himself)

The mise author published his personal setup — worth reading:
📖 https://mise.jdx.dev/how-i-use-mise.html

---

> *"La brigade est grande. Ces labs n'en couvrent qu'une partie.*
> *The kitchen is big. These labs cover only part of it.*
> *Explore the rest at mise.jdx.dev."* 🍳

---

## Slides

The codelab slides are built with [reveal.js 5.1.0](https://revealjs.com) loaded via CDN — plain HTML, no build step required.

- Source: `slides/index.html` — self-contained HTML file, version-controlled
- Theme: `slides/theme/brigade.css` — custom dark kitchen theme
- Live: https://maoudia.github.io/la-brigade-du-code/slides/

| Task | What it does |
|---|---|
| `mise run slides:dev` | Hot-reload dev server on :1948 |
| `mise run slides:build` | Compile to `slides/_dist/` |

---

## Known Gotchas

| Symptom | Cause | Fix |
|---|---|---|
| `maven not found in mise tool registry` | maven is not a core tool | Use `"aqua:apache/maven" = "3.9.14"` in `[tools]` |
| `Enter hook failed: hooks is experimental` | hooks require experimental mode | Add `experimental = true` under `[settings]` |
| `mise lock` not working | lockfile disabled by default | `mise settings set lockfile true` first |
| Hook not firing | `mise activate` missing in shell | Add `eval "$(mise activate zsh)"` to `~/.zshrc` |
| IntelliJ wrong JDK | IDE not using shims | Point SDK to `~/.local/share/mise/shims/java` |
| Windows: `./bin/setup` fails | Wrong shell | Use `.\bin\setup.ps1` in PowerShell |
