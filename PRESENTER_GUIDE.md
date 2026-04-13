# 🎤 Presenter Guide — La Brigade du Code

> Everything you need to run this codelab successfully, remote or in-person.

---

## Pre-session checklist (24h before)

- [ ] Fork and clone the repo, run `./bin/setup` yourself
- [ ] Share repo URL with participants in advance
- [ ] Ask them to run `./bin/setup` before the session
- [ ] Set up your screen sharing (split: terminal + browser)
- [ ] Prepare a fallback Gitpod/Codespace URL for Windows edge cases
- [ ] Test your microphone and camera
- [ ] Have the VitePress docs site open in a browser tab
- [ ] Pin the repo URL and Zoom/Meet link in your Slack/Teams channel

---

## Remote session setup

### Your screen layout
```
+---------------------------+---------------------------+
|  Terminal (left)          |  Browser / Slides (right) |
|  - mise.toml open         |  - VitePress docs          |
|  - mise run banner        |  - Slides for context      |
+---------------------------+---------------------------+
```

### Communication rules
- Ask people to use **reactions** (thumbs up) to confirm each step
- Use a **shared doc** (Notion/Confluence) for copy-paste commands
- Keep **Slack/Teams** open for people who fall behind
- Assign a **co-pilot** (colleague) to monitor chat while you present

### Fallback plan
If someone can't run locally:
```
https://gitpod.io/#https://github.com/maoudia/la-brigade-du-code
```
Opens a pre-configured dev environment in the browser.

---

## Session timeline — Full version (90 min)

| Time | Duration | What | Checkpoint |
|---|---|---|---|
| 0:00 | 5 min | Welcome + context — why mise? | - |
| 0:05 | 10 min | **Lab 00** — setup + pre-flight check | Everyone sees the banner |
| 0:15 | 10 min | **Lab 01** — tool versioning + lockfile | `mise run brigade` output matches |
| 0:25 | 12 min | **Lab 02** — env scoping + MISE_ENV | `mise env` shows correct isolation |
| 0:37 | 12 min | **Lab 03** — tasks + cross-platform | `mise run serve` full pipeline |
| 0:49 | 8 min | **Lab 04** — hooks + watchers | Banner fires on `cd` |
| 0:57 | 12 min | **Lab 05** — full stack service | Both services running |
| 1:09 | 10 min | **Lab 06** — security + CI + docs | `mise doctor` all green |
| 1:19 | 6 min | **Lab 07** — MCP + AI tools | Claude reads mise.toml |
| 1:25 | 5 min | Meta-moment + Q&A | The kitchen cooked itself 🤌 |

---

## Session timeline — Quickie version (20 min)

| Time | Duration | What |
|---|---|---|
| 0:00 | 2 min | Hook — "mise replaces 5 tools" |
| 0:02 | 3 min | Live demo: `./bin/setup` → banner |
| 0:05 | 4 min | Lab 01 — tools + lock |
| 0:09 | 4 min | Lab 03 — tasks cross-platform |
| 0:13 | 4 min | Lab 04 — hooks enter/leave |
| 0:17 | 3 min | Meta-moment + repo URL |

---

## Per-lab presenter notes

### Lab 00 — Onboarding
**Key message:** "No mise? No problem. Clone and run `./bin/setup`. That's it."

Show the diff between `curl | sh` and bootstrap live:
> "This is the same pattern as mvnw. You commit the wrapper. Everyone gets the same version. No surprises in CI."

**Checkpoint:** Wait for thumbs up from everyone before moving on.

---

### Lab 01 — La Mise en Place
**Key message:** "One file. All your runtimes. Pinned. Reproducible."

Highlight live:
```bash
cat mise.toml          # show [tools] section
mise install           # watch it install
mise ls                # verify
mise lock              # generate lockfile
cat mise.lock          # show the checksum
mise outdated          # "why not latest?" — explain LTS
```

**Gotcha:** People may ask "why not java = 'latest'?" — explain LTS policy, link to Java roadmap.

---


### Local production simulation (Lab 02 bonus)

```bash
mise run hosts:add    # adds 127.0.0.1 brigade.io to /etc/hosts
mise run docker:prod  # starts prod stack on port 443
curl http://brigade.io:8080/recettes
mise run hosts:remove # clean up
```

The trick: `extra_hosts: brigade.io:host-gateway` in `docker-compose.prod.yml`
maps `brigade.io` inside containers to the host. `hosts:add` does the same on the host itself.

### Lab 02 — Les Ingredients
**Key message:** "Env vars scoped to directories. No .env leaking between projects."

Live demo of isolation:
```bash
mise env | grep VITE         # empty at root
cd frontend && mise env | grep VITE   # shows VITE vars
cd ../backend && mise env | grep VITE # empty in backend
```

Then the MISE_ENV switch:
```bash
MISE_ENV=staging mise env | grep DATABASE_URL
MISE_ENV=production mise env | grep LOG_LEVEL
```

**Key insight:** "One repo. Three environments. Zero .env files committed. Secrets stay in .env.local or CI secrets."

---

### Lab 03 — Les Recettes
**Key message:** "mise tasks replace Makefile + npm scripts. Cross-platform. One command."

Show the `run_windows` field:
> "Write it once. mise picks the right version for the OS. No .bat files. No Makefile."

Show interactive picker:
```bash
mise run          # no arguments — opens interactive menu
```

**Gotcha:** Tera template deprecation — if anyone tries `{{arg()}}` syntax, point them to `usage` field.
📖 https://mise.jdx.dev/tasks/task-arguments.html

---

### Lab 04 — Le Coup de Feu
**Key message:** "Your terminal knows when you walk into a project."

Live demo:
```bash
cd ..                         # leave hook fires
cd lab-04-le-coup-de-feu     # enter hook fires — banner appears
```

Show `{ task = "banner" }` pattern:
> "Using a task reference instead of inline script means it's cross-platform automatically."

**Gotcha:** Hooks require `mise activate` — won't work with shims only. Mention this clearly.
📖 https://mise.jdx.dev/hooks.html

---

### Lab 05 — Le Service
**Key message:** "One command boots both backend and frontend. In parallel. On any OS."

```bash
mise run service
```

Watch both start in parallel — highlight the interleaved output.

Show env isolation:
```bash
mise config ls     # show the full config chain
```

Then switch environments:
```bash
MISE_ENV=staging mise run service
```

**Gotcha:** Frontend `npm install` must run first. `mise run install-frontend` handles this.

---

### Lab 06 — Le Chef
**Key message:** "mise secures, generates, and deploys everything."

Show trust model first — the security story:
```bash
cd /tmp
git clone YOUR_REPO brigade-test
cd brigade-test
# mise prompts: "Trust it? [y/n]"
```

Then generate everything live:
```bash
mise generate git-pre-commit --task check
mise generate github-action
mise generate task-docs
cat TASKS.md
```

**Meta-moment tease:** "Notice what we just did — mise generated the CI that will run mise."

---

### Lab 07 — Le Sous-Chef Digital
**Key message:** "Your AI agent reads your mise.toml. It knows your stack."

```bash
mise mcp
```

Connect OpenCode or Copilot. Ask:
> "What tools am I using in this project?"
> "What tasks are available?"
> "Suggest a new mise task to run tests"

**This is the closing wow moment** — let people experiment freely.

---

## The meta-moment script (Lab 06 end)

Read this out loud (or your version of it):

> "Look at what just happened. We used mise to:
> pin our Java and Node versions,
> scope our env vars per directory,
> write cross-platform tasks,
> hook into our shell automatically,
> run a full stack in parallel,
> generate a pre-commit hook,
> generate a GitHub Actions CI pipeline,
> and deploy a VitePress documentation site.
>
> And that site — the one that's now live on GitHub Pages —
> is the codelab that just taught you all of this.
>
> La cuisine a cuisiné elle-même.
> The kitchen cooked itself. 🤌"

---

## Common issues and fixes

| Issue | Fix |
|---|---|
| `mise: command not found` | Use `./bin/mise` — bootstrap handles it |
| Hook not firing | `mise trust` not run, or `mise activate` missing in shell |
| Banner shows `not found` for docker | Docker Desktop not running — start it |
| Windows: `./bin/setup` fails | Use `.\bin\setup.ps1` in PowerShell |
| docker command not found | Docker or Podman not installed | macOS: `brew install docker` or `brew install podman && brew install podman-compose` / Windows: Podman Desktop |
| Port 8080/3000 in use | Previous process not stopped | `mise run kill:ports` |
| `mise install` slow | First run downloads tools — cache kicks in after |
| `maven not found in registry` | Use `"aqua:apache/maven"` not `maven` in `[tools]` |
| IntelliJ wrong JDK | Point to `~/.local/share/mise/shims/java` |
| `mise lock` not working | Enable with `mise settings set lockfile true` first |

---

## Post-session actions

- [ ] Share the repo URL in the channel
- [ ] Share the VitePress docs link
- [ ] Ask for feedback via thumbs up/down
- [ ] Collect questions in a shared doc
- [ ] Open a GitHub Discussion for follow-up questions

---

## Key links to keep open during the session

| Link | What |
|---|---|
| https://mise.jdx.dev | Official docs |
| https://mise.jdx.dev/hooks.html | Hooks reference |
| https://mise.jdx.dev/tasks/toml-tasks.html | Tasks reference |
| https://mise.jdx.dev/dev-tools/shims.html | Shims vs activate |
| https://mise.jdx.dev/ide-integration.html | IDE setup |
| https://mise.jdx.dev/continuous-integration.html | CI guide |
| https://github.com/hverlin/mise-vscode | VSCode plugin |
| https://github.com/134130/intellij-mise | IntelliJ plugin |
