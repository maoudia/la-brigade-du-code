# 🤖 Lab 07 — Le Sous-Chef Digital

> *"Every great Chef has a Sous-Chef. Yours is an AI that knows your entire kitchen."*

## What you'll learn
- `mise mcp` — expose mise as MCP server
- Connect OpenCode to mise
- Connect GitHub Copilot to mise
- AI reads your `mise.toml`, tasks, env vars
- AI suggests updates and generates tasks

📖 https://mise.jdx.dev/mcp.html

## Start the mise MCP server

```bash
mise mcp
```

This starts a local MCP server that exposes:
- All tools and versions from `mise.toml`
- All tasks and their descriptions
- Environment variables (non-secret)
- mise doctor output

## Connect OpenCode

```bash
# .opencode/AGENTS.md already configured in this repo
opencode
```

Ask OpenCode:
```
What tools am I using in this project?
What tasks are available?
What Java version is pinned?
Suggest a new mise task to run integration tests.
```

## Connect GitHub Copilot

Add to `.vscode/settings.json`:
```json
{
  "github.copilot.advanced": {
    "mcpServers": {
      "mise": {
        "command": "mise",
        "args": ["mcp"]
      }
    }
  }
}
```

Then in Copilot chat:
```
@mise What tasks are available?
@mise What environment profile should I use for staging?
```

## Win condition ✅

```bash
mise mcp
# MCP server started on stdio
# Tools: java@25, node@24, maven@3.9.14
# Tasks: banner, service, backend, frontend, check...
```

AI agent correctly identifies:
- Java 25 LTS
- All available tasks
- MISE_ENV profiles
- Suggests relevant improvements

## The final meta-moment 🤌

Your AI sous-chef knows:
- Your exact runtime versions
- Your task definitions
- Your environment configs
- Your project structure

And it learned all of this from a single `mise.toml`.

*La cuisine a cuisinée elle-même.*
