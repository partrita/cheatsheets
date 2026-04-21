#import "../templates/conf.typ": *

#show: template.with(
  title: "Claude Code Cheatsheet (v2.1.116)",
  header: [Last updated: 2026-04-20],
  footer: "Claude Code Cheat Sheet (cc.storyfox.cz)",
)

= 1. Keyboard Shortcuts

== General Control
- `Ctrl + C`: Cancel input/generation
- `Ctrl + D`: Exit session
- `Ctrl + L`: Clear prompt + force full screen redraw
- `Ctrl + O`: Toggle transcript viewer (verbose)
- `Ctrl + U`: Clear entire input buffer
- `Ctrl + Y`: Restore cleared input buffer
- `Ctrl + R`: Reverse search history
- `Ctrl + G`: Open in editor (Ctrl+X Ctrl+E)
- `Ctrl + B`: Background running tasks
- `Ctrl + T`: Toggle task list
- `Ctrl + V`: Paste image
- `Ctrl + X Ctrl + K`: Kill background agents (press twice)
- `Esc Esc`: Rewind or summarize
- `Esc`: Cancel/Undo

== Mode Switching & Input
- `Shift + Tab`: Cycle permission modes (Default → Accept Edits → Plan → ...)
- `Alt + P`: Switch model
- `Alt + T`: Toggle extended thinking
- `Alt + O`: Toggle fast mode
- `\ + Enter`: Newline
- `Ctrl + J`: Control sequence newline

= 2. Slash Commands

== Session & Files
- `/clear`: Clear conversation
- `/compact [focus]`: Compact context
- `/branch [name]`: Branch conversation (/fork alias)
- `/cost`: Token usage (per-model + cache)
- `/context`: Visualize context (grid)
- `/diff`: Interactive diff viewer
- `/copy [N]`: Copy last (or Nth) response
- `/recap`: Summarize session context on return
- `/undo` / `/rewind`: Rewind to checkpoint
- `/export`: Export conversation
- `/resume [session]`: Resume by ID/name
- `/focus`: Toggle focus view (fullscreen only)

== Config & Tools
- `/config`: Manage configuration
- `/model [model]`: Switch model & effort
- `/fast [on|off]`: Toggle fast mode
- `/theme`: Change color theme (Auto/Terminal match)
- `/permissions`: View/update permissions
- `/effort [level]`: Set effort (low/med/high/xhigh/max)
- `/color [color]`: Set prompt-bar color
- `/keybindings`: Customize shortcuts
- `/terminal-setup`: Configure terminal keybindings
- `/init`: Create CLAUDE.md
- `/memory`: Edit CLAUDE.md & auto memory
- `/mcp`: Manage MCP servers UI
- `/hooks`: Manage hooks
- `/skills`: List available skills
- `/agents`: Manage agent configurations
- `/reload-plugins`: Hot-reload plugins
- `/add-dir <path>`: Add working directory

== Special & Review
- `/plan [desc]`: Enter plan mode directly
- `/review [PR]`: Review PR locally
- `/ultrareview [PR#]`: Cloud review (multi-agent)
- `/simplify [focus]`: Code review + fix (3 agents)
- `/security-review`: Scan for vulnerabilities
- `/less-permission-prompts`: Add allowlist for fewer prompts
- `/loop [interval] [prompt]`: Recurring task
- `/voice`: Toggle voice dictation
- `/doctor`: Diagnose installation
- `/rc` / `/remote-control`: Remote control mode
- `/desktop`: Continue in Desktop app
- `/rename [name]`: Rename current session
- `/btw <question>`: Side question (no context cost)
- `/insights`: Analyze sessions report

= 3. MCP & Agent Management

== MCP Server Management
- `--transport http`: Remote HTTP server (requires auth)
- `--transport stdio`: Local process server
- `--transport sse`: Remote SSE server
- `claude mcp list`: List all servers
- `claude mcp serve`: Run Claude Code as an MCP server

== Scopes & Config
- Local: `~/.claude.json`
- Project: `project.mcp.json`
- User: `~/.claude.json`

== Agents & Skills
- *Built-in Agents*: Explore, Plan, General, Bash
- *Frontmatter*: `permissionMode`, `isolation`, `memory`, `background`, `maxTurns`
- *Skill Locations*: `.claude/skills/` (Project), `~/.claude/skills/` (Personal)

= 4. Memory & File Structure

== CLAUDE.md Locations
- `./CLAUDE.md`: Project (team-shared)
- `./CLAUDE.local.md`: Local personal (gitignored)
- `~/.claude/CLAUDE.md`: Personal (global)
- `/etc/claude-code/CLAUDE.md`: Managed policy (org)

== Rules & Import
- `.claude/rules/*.md`: Project rules
- `~/.claude/rules/*.md`: User rules
- `paths: frontmatter`: Path-specific rules
- `@path/to/file`: Import in CLAUDE.md

== Auto Memory
- Automatically loads `MEMORY.md` and topic files from `~/.claude/projects/<id>/memory/`

= 5. Workflow & Tips

- *Thinking & Effort*: `Alt + T` toggle, `xhigh` level (between high/max), "ultrathink" for max effort
- *Auto Mode*: Max subscribers (Opus 4.7) no longer need `--enable-auto-mode`
- *Git Worktrees*: `--worktree` for isolation, `isolation: worktree` agent exclusive tree
- *Context*: Optimize with `/compact` (1M supported, Opus 4.6+), `CLAUDE.md` persists
- *Voice Mode*: Activate with `/voice`, hold Space to record & send (20 languages)
- *SendMessage*: Auto-resume functionality (replaces resume)

= 6. CLI & Environment

== Core Environment Variables
- `ANTHROPIC_API_KEY`, `ANTHROPIC_MODEL`
- `ANTHROPIC_BASE_URL`: Proxy/gateway override
- `ANTHROPIC_BETAS`: Additional beta headers
- `MAX_THINKING_TOKENS`: Limit (0=off)
- `ENABLE_PROMPT_CACHING_1H`: Opt into 1h TTL
- `FORCE_PROMPT_CACHING_5M`: Force 5-min TTL
- `CLAUDE_CODE_ENABLE_AWAY_SUMMARY`: Force recap
- `CLAUDECODE`: Detect CC shell (=1)
- `API_TIMEOUT_MS`: API timeout (default 600s)
- `CLAUDE_CODE_DISABLE_CRON`: Disable tasks

== CLI Commands & Flags
- `claude auth login`: Sign in (--sso, --console)
- `claude update`: Update Claude Code
- `-n / --name`: Session name
- `--allowedTools` / `--disallowedTools`: Tool control
- `--dangerously-skip-permissions`: Skip all prompts ⚠️
- `--system-prompt`: Custom system prompt
- `--settings <file>`: Load settings JSON
- `--output-format`: text/json/stream-json
