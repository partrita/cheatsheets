#import "../templates/conf.typ": *

#show: template.with(
  title: "Claude Code Cheat Sheet",
  header: [Last updated: #datetime.today().display()],
  footer: "Claude Code CLI Assistant Cheat Sheet",
)

= Installation & Setup

Claude Code is an AI-powered CLI assistant for software engineering tasks.

- *Install*: `npm install -g @anthropics/claude-code`
- *Login*: `claude auth login`
- *Check Auth Status*: `claude auth status`
- *Show User Info*: `claude auth whoami`
- *Logout*: `claude auth logout`

= Quick Start

- *Start Interactive Session*: `claude`
- *Run Single Command*: `claude "help me write a Python function"`
- *Resume Previous Session*: `claude --resume`
- *Start with Memory Enabled*: `claude --memory`
- *Enable Extended Thinking*: `claude --think`
- *Analyze Image/Diagram*: `claude "analyze screenshot" --image path/to/image.png`

= Core Commands

== File Operations & Refactoring
- Read and analyze a file: `claude "read file.py"`
- Edit an existing file: `claude "edit file.py"`
- Create a new file: `claude "create file.py"`
- Fix failing tests: `claude "fix tests"`
- Refactor existing code: `claude "refactor code"`

== Git Integration
- Create git commit with message: `claude "create commit"`
- Create pull request: `claude "create PR"`
- Review git changes: `claude "review changes"`
- Resolve merge conflicts: `claude "fix merge conflicts"`

= Keyboard Shortcuts

== Session & Navigation
- `Ctrl + C`: Cancel input / generation
- `Ctrl + D`: Exit interactive mode
- `Ctrl + L`: Clear prompt and redraw screen
- `Ctrl + O`: Toggle transcript viewer
- `Ctrl + U` / `Ctrl + Y`: Clear / restore input buffer
- `Ctrl + R`: Reverse search history
- `Ctrl + V`: Paste image from clipboard
- `Ctrl + B`: Background running tasks
- `Shift + Tab`: Cycle permission modes (Default → Accept Edits → Plan)
- `Alt + P`: Switch AI model
- `Alt + T`: Toggle extended thinking
- `\ + Enter` / `Ctrl + J`: Insert newline

= Slash Commands

== Session Management
- `/help`: Show available commands
- `/clear`: Clear conversation history
- `/reset`: Reset conversation state
- `/exit`: Exit interactive mode
- `/version`: Show Claude Code version
- `/undo` / `/rewind`: Roll back to checkpoint
- `/compact [focus]`: Compact context
- `/cost`: Display token usage & cost

== Settings & Configuration
- `/settings` / `/config`: Open settings panel
- `/model [model]`: Change AI model & effort
- `/memory on` / `/memory off`: Toggle memory
- `/permissions`: View/update tool permissions
- `/init`: Initialize `CLAUDE.md`

== Productivity
- `/save`: Save conversation
- `/load`: Load previous conversation
- `/export`: Export conversation to file
- `/diff`: Open interactive diff viewer

= Common Workflows

== Code Review
- Review specific file for bugs: `claude "review this code for bugs" file.py`
- Review all git changes: `claude "review my git changes"`
- Suggest code improvements: `claude "suggest improvements" src/`

== Testing & Documentation
- Generate unit tests: `claude "write tests for this function"`
- Fix failing tests: `claude "fix these test failures"`
- Analyze test coverage: `claude "analyze test coverage"`
- Generate README: `claude "create README for this project"`
- Add documentation comments: `claude "add documentation to this function"`
- Generate API documentation: `claude "generate API docs"`

== Debugging & Optimization
- Debug error message: `claude "help debug this error: [error message]"`
- Performance analysis: `claude "why is this code slow?"`
- Explain implementation: `claude "explain how this works" complex_function.py`

= IDE Integrations & Configuration

== VS Code Integration
- Install extension: `code --install-extension anthropic.claude-code`
- Open in VS Code: `claude --vscode`
- Shortcuts: `Ctrl+Shift+P` -> `"Claude: Ask"`, `"Claude: Review"`

== CLI Configuration
- Set default editor: `claude config set editor code`
- Set working directory: `claude config set workdir /path/to/project`
- View all settings: `claude config list`
- Reset configuration: `claude config reset`
- Set timeout: `claude config set timeout 30`

= Global Options & Troubleshooting

== Global CLI Options
- `--resume`: Resume previous session
- `--memory` / `--no-memory`: Enable/disable memory
- `--think`: Enable extended thinking
- `--no-color`: Disable colored output
- `--verbose`: Enable verbose logging
- `--clear-cache`: Clear cache
- `--proxy <url>`: Use proxy (e.g. `claude --proxy http://proxy:8080`)

== Troubleshooting
- *Clear Authentication*: `claude auth logout && claude auth login`
- *Reset Configuration*: `claude config reset`
- *Clear Cache*: `claude --clear-cache`
- *Debug Logging*: `claude --verbose --debug`
- *Clear Memory*: `claude "clear memory"`
