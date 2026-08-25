#import "../templates/conf.typ": *

#show: template.with(
  title: "Antigravity CLI Cheatsheet (v1.1)",
  header: [Last updated: 2026-08-25],
  footer: "Antigravity CLI Cheat Sheet (antigravity.google/docs/cli)",
)

= Overview & Install

Google's terminal AI coding agent — successor to Gemini CLI
(shut down 2026-06-18). Command name: `agy`.

== Install
- `curl -fsSL https://antigravity.google/cli/install.sh | bash`: macOS/Linux (~/.local/bin/agy)
- `irm https://antigravity.google/cli/install.ps1 | iex`: Windows
- `agy install`: Configure PATH & shell after install

== CLI Commands
- `agy`: Start interactive TUI
- `agy -p "prompt"`: Non-interactive print mode (CI/scripts)
- `agy models`: List supported models
- `agy agents`: List custom agents
- `agy plugin import gemini`: Migrate Gemini CLI extensions
- `agy plugin disable <name>`: Disable a plugin
- `agy changelog`: Release notes

== Key Flags
- `--model <slug>` / `--effort <level>`: Model & reasoning effort
- `--mode default|accept-edits|plan`: Execution mode
- `--agent <name>`: Start with custom agent
- `--project <p>` / `--new-project <n>`: Project selection
- `--sandbox`: Enable sandboxing
- `--output-format text|json|stream-json`: Structured output
- `--json-schema <schema>`: Validate output schema
- `--disable-slash-commands`: Treat slash input as text

= Keyboard Shortcuts
- `Enter`: Submit prompt
- `Shift+Enter` / `Ctrl+J` / `Alt+Enter`: Newline
- `Tab`: Confirm slash-command autofill
- `Shift + Tab`: Cycle execution mode (default → accept-edits → plan)
- `Esc`: Close panels / stop stream / clear empty prompt
- `Ctrl + C`: Cancel agent op (1st), exit CLI (double)
- `f`: Accept/reject individual change in diff preview
- `ctrl+k`: Approve tools instantly
- `?`: Help overview
- Vim mode: `editorMode: "vim"` in settings.json (v1.1.11)

= Slash Commands

== Conversation
- `/resume` (`/switch`): Resume/switch sessions
- `/rewind` (`/undo`): Roll back to checkpoint
- `/rename <name>`: Rename conversation
- `/diff`: Interactive diff viewer
- `/tasks`: Monitor/terminate background tasks

== Config & Account
- `/permissions`: Autonomy level (request-review / always-proceed / strict)
- `/model`: Select model (persists)
- `/effort`: Reasoning effort level
- `/settings`: Settings panel (+ Agent Mode default)
- `/keybindings`: Shortcut editor
- `/statusline` / `/title`: Status bar / terminal title
- `/credits`: Remaining AI credits & usage
- `/logout` / `/exit`: Sign out / quit

== Tools
- `/agents`: Agent status panel
- `/mcp`: MCP server management
- `/skills`: Browse local & global workflows
- `/codesearch` (`/cs`): Regex code search across workspace
- `/open <path>`: Open file in external editor

= Permissions Presets
- *request-review* (default): Diff preview before writes
- *proceed-in-sandbox*: Auto-proceed inside sandbox
- *always-proceed*: No prompts (trusted workspaces only)
- *strict*: Prompt for all non-read tools

= Settings & Paths
- `~/.gemini/antigravity-cli/settings.json`: Main config
- Keys: `altScreenMode`, `editor`, `editorMode`, `notifications`, `showTips`, `runningLightSpeed`
- Fine-grained permissions: allowed/denied command lists in settings.json
- `keybindings.json`: Custom shortcuts (delete to reset)
- `AGY_CLI_CMD_OUTPUT_PERCENTAGE`: Limit TUI command output
- Rules via AGENTS.md / GEMINI.md

= Migration from Gemini CLI
- Settings live under `~/.gemini/antigravity-cli/`
- `agy plugin import gemini` migrates extensions
- Legacy `/commands` → convert to *skills*
- Multiple leading slash commands stackable per prompt (v1.1.4)
