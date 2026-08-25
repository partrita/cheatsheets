#import "../templates/conf.typ": *

#show: template.with(
  title: "skills CLI Cheatsheet (vercel-labs)",
  header: [Last updated: 2026-08-25],
  footer: "skills Cheat Sheet (skills.sh / github.com/vercel-labs/skills)",
)

= Overview

The CLI for the open agent skills ecosystem (`npx skills`).
Installs `SKILL.md`-based skills to Claude Code, Codex,
OpenCode, Cursor, Antigravity, and 75+ other agents.

- No install needed — runs directly via `npx`
- Registry & discovery: *skills.sh*
- Open standard: agentskills.io

= Core Commands

== Install
- `npx skills add <owner/repo>`: Install from GitHub
- `npx skills add vercel-labs/agent-skills --list`: Preview skills in a repo
- `npx skills add vercel-labs/agent-skills --skill frontend-design -a claude-code -y`: Single skill to one agent
- `npx skills add https://github.com/...`: Full URL sources
- Monorepo paths: `.../tree/main/skills/<name>` supported
- `--skill '*' --agent '*'`: Install everything

== Manage
- `npx skills list` (`ls`): List installed skills (like `npm ls`)
- `npx skills ls -g`: Global only
- `npx skills ls -a claude-code -a cursor`: Filter by agent
- `npx skills find [query]`: Interactive (fzf-style) or keyword search
- `npx skills remove [skills]`: Remove installed skills
- `npx skills check`: Check for updates
- `npx skills update [skills]`: Update to latest versions
- `npx skills init [name]`: Scaffold a new SKILL.md template
- `npx skills use <source>`: Try a skill without installing

== Key Flags
- `-g, --global`: Global scope (user directory)
- `-a, --agent <name>`: Target agent (repeatable)
- `--skill <name>`: Select specific skill(s)
- `-y, --yes`: Skip confirmation prompts
- `--all`: Shorthand for `--skill '*' --agent '*' -y`
- `--copy`: Copy instead of symlink (unsupported filesystems)
- CI: pin with `npx skills@latest`

= SKILL.md Format

== Structure
```
my-skill/
├── SKILL.md        # required
├── scripts/        # optional automation scripts
└── references/
```

== Frontmatter
```markdown
---
name: my-skill
description: Use when the agent needs to ...
---
Instructions written in markdown...
```
- `name`, `description` required
- The description drives automatic activation

== Skills vs Rules (AGENTS.md)
- Rules: apply to every task → AGENTS.md
- Skills: specialized, occasionally-used workflows → skills

= Supported Agents (examples)

| Agent | `--agent` | Project path |
|---|---|---|
| Claude Code | `claude-code` | `.claude/skills/` |
| Codex | `codex` | `.agents/skills/` |
| OpenCode | `opencode` | `.agents/skills/` |
| Cursor | `cursor` | `.cursor/skills/` |
| Antigravity | `antigravity` | `.agents/skills/` |

Global paths vary per agent
(e.g. `~/.claude/skills/`, `~/.config/agents/skills/`)
- Symlink install is the default (single shared copy)

= Publishing & Tips
- No publish step: push skill folders to a Git repo — they
  surface on skills.sh automatically via installs
- Recommended repo contents: skill folder + README + license
- Security: treat skills like code — review before installing,
  be careful with `scripts/`, check diffs on updates
- Related tool: *skills-npm* (antfu) — symlinks skills bundled
  inside npm packages via a `prepare` script
