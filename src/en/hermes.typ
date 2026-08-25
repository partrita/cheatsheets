#import "../templates/conf.typ": *

#show: template.with(
  title: "Hermes Agent Cheatsheet (v0.20)",
  header: [Last updated: 2026-08-25],
  footer: "Hermes Agent Cheat Sheet (hermes-agent.nousresearch.com)",
)

= Installation & CLI

== Install
- `curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash`: Linux/macOS/WSL2/Termux
- `iex (irm https://hermes-agent.nousresearch.com/install.ps1)`: Windows PowerShell
- `hermes setup --portal`: First-time setup (Nous Portal)

== CLI Commands
- `hermes`: Start interactive CLI session
- `hermes --tui`: Full-screen TUI (overlays, mouse support)
- `hermes chat -q "query"`: Single non-interactive query
- `hermes chat --query-file p.txt`: Query from file/stdin (verbatim)
- `hermes -w`: Worktree mode (isolated Git worktree)
- `hermes --continue` / `--resume <id>`: Resume sessions
- `hermes -in <dir>`: Change into dir before start/resume
- `hermes model`: Interactive model picker
- `hermes config set model.default <model>`: Set model directly
- `hermes sessions list`: List saved sessions
- `hermes dashboard`: Local browser UI
- `hermes backup` / `hermes debug share`: Backup / debug report
- `hermes update`: Update Hermes Agent

= Gateway & Messaging

- `hermes gateway setup`: Configure platforms interactively
- `hermes gateway run`: Foreground service
- `hermes gateway install/start/stop/restart`: Background service
- Telegram, Discord, Slack, WhatsApp, iMessage 등 28+ platforms
- Cron jobs: scheduled tasks with model/workdir overrides

= Keyboard Shortcuts
- `Ctrl + P`: Fuzzy command palette (also `/palette`)
- `Ctrl + S`: Stash half-written prompt
- `Shift + Enter`: Newline (multiline input)
- `!command`: Instant shell mode
- `Esc`: Interrupt & redirect mid-turn
- Busy input mode: type while agent is working

= Slash Commands

== Session
- `/new`: New session
- `/resume`: Resume a session
- `/compress`: Compress conversation context
- `/context`: Inspect context usage
- `/diff`: Review changes
- `/focus`: Focus mode
- `/export`: Export conversation

== Model & Account
- `/model`: Switch model instantly (no restart)
- `/usage`: Token/cost breakdown + account limits
- `/topup`: Nous balance/billing (replaces /credits)
- `/subscription` (`/upgrade`): Manage Nous plan
- `/insights`: Usage analytics (30 days)

== Tools & Skills
- `/init`: Initialize project instructions
- `/skills`: Browse skills
- `/learn`: Turn workflow into reusable skill
- `/approvals`: Manage tool approvals
- `/background <task>`: Run background task (`bg_<id>`)
- `/moa`: Multi-agent orchestration
- `/journey`: Journey mode
- `/wake` / `/whoami` / `/version` / `/palette` / `/update`

= Configuration

== Files
- `~/.hermes/`: All state, config, skills, sessions
- `config.yaml`: Main configuration

== Key config.yaml Sections
- `model`: `default`, `provider`, `base_url`, `api_key`, `context_length`
- `agent.max_turns`: Tool-call iteration limit (default 500)
- `terminal.backend`: local / docker / ssh / modal
- `compression`: threshold / target_ratio
- `delegation`: model, max_iterations
- `security.tirith_enabled`: Safety guardrails
- Providers: OpenRouter, Anthropic, OpenAI, DeepSeek, Gemini, xAI, Kimi 등 20+

= Delegation & Subagents
- `delegate_task(goal, context, toolsets)`: Sync subagent (L1)
- Batch parallel up to 3 concurrent subagents
- Independent processes: `hermes chat -q "..."` fire-and-forget
- tmux multi-agent: `tmux new-session -d 'hermes -w'` per agent
- Delegation skills hand off to Claude Code, Codex, OpenCode, Antigravity CLI

= Workflow Tips
- `-w` worktree flag prevents merge conflicts between parallel agents
- Skills via `/learn`; loaded at launch or invoked as slash commands
- Personalities: switchable agent personas
- Reasoning streams live by default; TTFT ~80% faster since v0.19
