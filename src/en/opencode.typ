#import "../templates/conf.typ": *

#show: template.with(
  title: "OpenCode Cheatsheet (v1.14)",
  header: [Last updated: 2026-08-25],
  footer: "OpenCode Cheat Sheet (opencode.ai)",
)

= Installation & CLI

== Install
- `curl -fsSL https://opencode.ai/install | bash`: Install
- `npm i -g opencode-ai`: Install via npm
- `brew install sst/tap/opencode`: macOS

== CLI Commands
- `opencode`: Start interactive TUI in current dir
- `opencode run "prompt"`: One-shot run (`-c` continue, `-m provider/model`, `--format json`)
- `opencode serve`: Headless HTTP server (`--port`, `--hostname`, `--mdns`)
- `opencode attach <url>`: Attach to running server
- `opencode acp`: ACP server for IDEs (Zed etc.)
- `opencode auth login`: Add provider credentials
- `opencode agent list`: List agents
- `opencode github run`: GitHub agent workflows
- `opencode upgrade`: Self-update

= Keyboard Shortcuts

Leader key = `Ctrl + X`

== App Control
- `Ctrl + C` / `Ctrl + D` / `<L>q`: Quit
- `Ctrl + P`: Command palette
- `<L>t`: Toggle theme
- `<L>b`: Toggle sidebar
- `<L>s`: Show status
- `<L>e`: External editor (`$EDITOR`)
- `Escape`: Interrupt running tool call

== Sessions
- `<L>n`: New session
- `<L>l`: Session list
- `<L>g`: Session timeline/history
- `<L>x`: Export session
- `<L>c`: Compact context
- `<L>u` / `<L>r`: Undo / Redo message
- `<L>y`: Copy last message
- `<L>Left`/`Right`/`Up`: Child / parent session

== Models & Agents
- `<L>m`: Model picker
- `F2` / `Shift+F2`: Next / previous recent model
- `Ctrl + T`: Cycle model variant
- `<L>a`: Agent picker
- `Tab` / `Shift+Tab`: Cycle agent (build ↔ plan)

== Input & Scrolling
- `Enter`: Submit
- `Shift+Enter` / `Alt+Enter` / `Ctrl+Enter`: Newline
- `@file`: Fuzzy file reference into prompt
- `!command`: Run shell command inline
- `PageUp/PageDown`, `Home/End`: Scroll
- `Ctrl + G` / `Ctrl + Alt + G`: Top / bottom

= Slash Commands

== Session
- `/new`: New session
- `/sessions`: Switch saved session
- `/compact` (`/summarize`): Compress context
- `/undo` / `/redo`: Revert/restore message + file changes (Git)
- `/share` / `/unshare`: Share session link
- `/export`: Save as Markdown
- `/clear`: Clear screen
- `/exit` (`/quit`): Exit

== Config
- `/connect`: Add provider/API key
- `/init`: Generate AGENTS.md
- `/models`: Pick model/provider
- `/editor`: Compose prompt in `$EDITOR`
- `/themes`: Theme picker
- `/help`: Command list

= Configuration

== Files
- `~/.config/opencode/opencode.json`: Global config
- `.opencode/opencode.json` (or `opencode.json`): Project config
- `AGENTS.md`: Project rules/memory (`/init`)
- `.opencode/commands/*.md`: Project custom slash commands
- `~/.config/opencode/commands/*.md`: Global custom commands
- `.opencode/agent/*.md`: Custom subagents
- `tui.json`: Keybinds/theme/scroll settings

== Custom Command Example
```markdown
---
description: Plan only, no implementation
agent: plan
subtask: true
---
Create a step-by-step plan for: $ARGUMENTS
```
- Same-name custom commands override built-ins
- Frontmatter: `description`, `agent`, `model`, `subtask`

== Agents & Permissions
- Built-in agents: *build* (edits allowed), *plan* (read-only)
- Permissions in `opencode.json`: `edit`, `bash` (allow/ask/deny patterns)
- MCP servers configured in `opencode.json` (`mcp` key)

= Workflow Tips
- First visit: `/connect` → `/init` → `/models`
- `@path/file.ts`: git-aware fuzzy attach; aliases supported
- `/undo` requires a Git repository
- `OPENCODE_API_KEY` etc. via `opencode auth login`
- `$EDITOR` for external editing: set `EDITOR=nvim` or `"code --wait"`
