#import "../templates/conf.typ": *

#show: template.with(
  title: "Warp Terminal Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://docs.warp.dev/",
)

= Overview

Warp is a high-performance, Rust-based terminal designed for modern developers. It reimagines the terminal experience with block-based output, a text-editor-style input, native AI integration, and cross-platform support (macOS and Linux).

= Cursor Movement & Text Editing

== Cursor Navigation
- `Cmd/Ctrl + ←` or `Ctrl+A`: Move to start of line
- `Cmd/Ctrl + →` or `Ctrl+E`: Move to end of line
- `Option/Alt + ← / →`: Move one word left / right
- `Ctrl+F / Ctrl+B`: Move one character right / left

== Text Deletion
- `Ctrl+K`: Delete from cursor to end of line
- `Ctrl+U`: Delete from cursor to start of line
- `Ctrl+W`: Delete previous word
- `Option/Alt+D` or `Ctrl+D`: Delete next word
- `Ctrl+Y`: Paste last deleted text (Yank)
- `Ctrl+T`: Transpose (swap) two adjacent characters

== Command History
- `Ctrl+R`: Reverse history search
- `Ctrl+S`: Forward history search
- `↑ / ↓` or `Ctrl+P / Ctrl+N`: Previous / next command

= Warp Core Features

== Block-Based Output
Warp groups each command and its output into a *Block* — a self-contained unit you can navigate, copy, share, or bookmark.

- *Navigate blocks*:
  - macOS: `Cmd+↑ / ↓`
  - Linux: `Ctrl+Shift+↑ / ↓`
- *Expand block selection*:
  - macOS: `Cmd+Shift+↑ / ↓`
  - Linux: `Ctrl+Alt+↑ / ↓`
- *Jump to specific block*: `Cmd+G` / `Ctrl+G`
- *Delete selected block*: `Cmd+D` / `Ctrl+D`
- *Copy block output*: `Cmd+Shift+C` / `Ctrl+Shift+C`
- *Copy command only*: `Cmd+Option+C` / `Ctrl+Alt+C`
- *Share block as link*: `Cmd+L` / `Ctrl+L`
- Right-click a block: Filter, export, or bookmark

== Command Palette
- macOS: `Cmd+P`
- Linux: `Ctrl+Shift+P`

Access all Warp settings, themes, keybindings, and features from one place.

== Workflows (Reusable Commands)
- Open Workflow search: `Ctrl+Shift+R`
- Create `.warp/workflows/` in a project directory to share team command templates that auto-appear in Warp search.
- Workflows are YAML files:
  ```yaml
  ---
  name: Run dev server
  command: npm run dev
  tags: [node, dev]
  description: Start the local development server
  ```

= AI Features

== AI Command Search
- Open: `Ctrl+` ` (backtick)` or type `#` in input
- Describe what you want in plain English; Warp converts it to a shell command.
- Example: `# list all files modified in the last 7 days`

== AI Command Explanation
- Click *Explain* on any block output to get an AI explanation.
- Works especially well on error messages.

== AI Chat Panel
- Open with: `Cmd+I` (macOS) / `Ctrl+I` (Linux)
- Ask questions about your terminal, code, or errors.

== AI Suggestions
- Generate command suggestions: `Cmd+J` / `Ctrl+J`
- Accept autocomplete: `Tab`; Reject: `Shift+Tab`

= Tab & Pane Management

== Tabs
- New tab: `Cmd+T` / `Ctrl+Shift+T`
- Close tab: `Cmd+W` / `Ctrl+Shift+W`
- Reopen closed tab: `Cmd+Shift+T` / `Ctrl+Shift+Y`
- Switch to tab N: `Cmd+1-9` / `Ctrl+1-9`
- Next / previous tab: `Cmd+Option+← / →` / `Ctrl+PageUp/PageDown`

== Pane Splitting
- Split vertically: `Cmd+D` / `Ctrl+Shift+D`
- Split horizontally: `Cmd+Shift+D` / `Ctrl+Shift+H`
- Move between panes: `Cmd+Option+Arrow` / `Ctrl+Alt+Arrow`
- Close current pane: `Cmd+Shift+W` / `Ctrl+Shift+Q`

== Windows
- New window: `Cmd+N` / `Ctrl+Shift+N`
- Incognito window: `Cmd+Shift+N` / `Ctrl+Shift+P`
- Zoom font: `Cmd++/-/0` / `Ctrl++/-/0`

= Search & Filtering

- Find in page: `Cmd+F` / `Ctrl+F`
- Next / previous result: `Cmd+G / Cmd+Shift+G`
- Dismiss search: `Escape`
- Filter blocks: `Cmd+Shift+F` / `Ctrl+Shift+F`
- Show only error blocks: `Cmd+Shift+E` / `Ctrl+Shift+E`

= Clipboard & Output

- Copy / Paste: `Cmd+C / V` / `Ctrl+C / V`
- Paste without formatting: `Cmd+Shift+V` / `Ctrl+Shift+V`
- Clear screen: `Cmd+L` / `Ctrl+L`
- Re-run current block: `Cmd+Shift+R` / `Ctrl+Shift+R`
- Export session: `Cmd+E` / `Ctrl+E`

= System Integration

- Open current path in Finder/Files: `Cmd+Option+O` / `Ctrl+Alt+O`
- Open current path in VS Code: `Cmd+Option+R` / `Ctrl+Alt+R`
- Developer tools / JS console: `Cmd+Option+I` (macOS)

= Theme & Customization

- Change theme: `Ctrl+Cmd+T` / `Ctrl+Shift+T`
- Open settings: `Cmd+,` / `Ctrl+,`
- Custom keybindings: Settings → Keyboard Shortcuts

= Process Control (Universal)

- Force quit (SIGINT): `Ctrl+C`
- Suspend (SIGTSTP): `Ctrl+Z`
- Send EOF: `Ctrl+D`
- Quit with core dump (SIGQUIT): `Ctrl+\`
- Pause / resume output: `Ctrl+S / Q`

= Pro Tips

== Modern Input
Warp's input is like a text editor — use `Cmd/Ctrl+Z` for undo, `Cmd+A` to select all, and mouse clicks to reposition the cursor before submitting.

== Remote Development (SSH)
Warp works over SSH. Local AI features and block navigation remain available when connected to a remote server.

== Notebook-style Sessions
Share an entire Warp session (all blocks) as a single permalink — useful for documenting debugging sessions or onboarding teammates.
