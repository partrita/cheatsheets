#import "../templates/conf.typ": *

#show: template.with(
  title: "Neovim Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://neovim.io/doc/",
)

= Core Concepts

Neovim is a hyperextensible Vim-based text editor emphasizing extensibility and modern features. It is fully backward-compatible with Vim while adding built-in LSP, Lua scripting, and Tree-sitter.

- *Built-in LSP*: IDE-level autocompletion and diagnostics without external plugins.
- *Tree-sitter*: High-performance syntax highlighting and structural code selection.
- *Lua API*: Full scriptability via Lua (init.lua) in addition to Vimscript.
- *Modern defaults*: Better terminal support, true color, and sane out-of-box settings.

= Navigation

== Cursor Movement
- `h j k l`: Left / Down / Up / Right
- `w b e`: Next word start / Prev word start / Word end
- `W B E`: Same but WORD (whitespace-delimited)
- `0 ^ $`: Line start / First non-blank / Line end
- `gg G`: File start / File end
- `5G` or `:5`: Jump to line 5
- `%`: Jump to matching bracket/paren
- `f<char> F<char>`: Find char forward/backward on line (`;` repeat, `,` reverse)
- `t<char> T<char>`: Till char (one before) forward/backward
- `H M L`: Top / Middle / Bottom of screen
- `Ctrl-d Ctrl-u`: Scroll half-page down / up
- `Ctrl-f Ctrl-b`: Scroll full-page forward / backward
- `zz zt zb`: Center / Top / Bottom cursor on screen

== Marks and Jumps
- `ma`: Set mark a at cursor
- `` `a ``: Jump to exact position of mark a
- `'a`: Jump to line of mark a
- `Ctrl-o Ctrl-i`: Jump backward / forward in jump list
- `g;` and `g,`: Previous / next position in change list

= Editing

== Entering Insert Mode
- `i I`: Insert before cursor / at line start
- `a A`: Append after cursor / at line end
- `o O`: Open new line below / above
- `s S`: Substitute char / whole line
- `R`: Replace mode (overwrites characters)

== Operators (combine with motions)
- `d`: Delete --- `dd` (line), `dw`, `d$`, `d3j`
- `c`: Change (delete + insert) --- `cw`, ci-paren (ci with motion), `C`
- `y`: Yank (copy) --- `yy`, `yw`, `y$`
- `> <`: Indent right / left --- `>>`, `5>>`, `>G`
- `=`: Auto-indent --- `==` (line), `gg=G` (whole file)
- `gU gu`: Uppercase / lowercase (e.g., `gUw`, `guw`)
- `~`: Toggle case of character under cursor

== Text Objects
- `iw aw`: Inner word / a word (with surrounding space)
- `is as`: Inner sentence / a sentence
- `ip ap`: Inner paragraph / a paragraph
- `ib ab`: Inside / around parentheses
- `iB aB`: Inside / around curly braces
- `i[ a[`: Inside / around square brackets
- `i" a"` / `i' a'`: Inside / around double/single quotes
- `it at`: Inside / around XML/HTML tag

== Undo / Redo
- `u`: Undo last change
- `Ctrl-r`: Redo
- `U`: Restore last changed line
- `:earlier 5m`: Revert to state 5 minutes ago
- `:later 5m`: Move forward 5 minutes in undo history

= Visual Mode
- `v`: Character-wise visual
- `V`: Line-wise visual
- `Ctrl-v`: Block (column) visual
- `gv`: Reselect last visual selection
- `o`: Move cursor to other end of selection
- `I` in block mode: Insert at start of each selected line

= Search and Replace
- `/pattern`: Search forward
- `?pattern`: Search backward
- `n N`: Next / previous match
- Asterisk or pound key: Search word under cursor forward / backward
- `:%s/old/new/g`: Replace all in file
- `:%s/old/new/gc`: Replace all with confirmation
- `:5,10s/old/new/g`: Replace in lines 5-10
- `:g/pattern/d`: Delete all lines matching pattern
- `:g/pattern/norm dd`: Apply normal command to matching lines
- `cgn`: Change next search match (repeatable with `.`)

= Registers and Macros
- `"ay`: Yank into register a
- `"ap`: Paste from register a
- `"+y / "+p`: System clipboard yank / paste
- `"0p`: Paste last yank (not affected by delete)
- `q<letter>`: Start recording macro into register
- `q`: Stop recording
- `@<letter>`: Play macro
- `5@a`: Play macro a five times
- `@@`: Replay last macro
- `:reg`: View all register contents

= Splits, Tabs and Buffers

== Splits
- `:sp` / `:vsp`: Horizontal / vertical split
- `Ctrl-w h/j/k/l`: Move between splits
- `Ctrl-w H/J/K/L`: Move split to far edge
- `Ctrl-w =`: Equalize split sizes

== Tabs
- `:tabe <file>`: Open file in new tab
- `gt gT`: Next / previous tab
- `2gt`: Go to tab 2
- `:tabc`: Close current tab

== Buffers
- `:ls` or `:buffers`: List all buffers
- `:b <N>` or `:b <name>`: Switch to buffer
- `:bn :bp`: Next / previous buffer
- `:bd`: Delete (close) buffer
- `:wa`: Write all buffers
- `Ctrl-^`: Toggle between two recent buffers

= Built-in LSP

Configure via nvim-lspconfig or built-in vim.lsp.

- `K`: Hover documentation
- `gd`: Go to definition
- `gD`: Go to declaration
- `gr`: List references
- `gi`: Go to implementation
- `gt`: Go to type definition
- Leader + ca: Code actions
- Leader + rn: Rename symbol
- `[d ]d`: Previous / next diagnostic
- `:LspInfo`: Show LSP server status

= Telescope (Fuzzy Finder)

Install: nvim-telescope/telescope.nvim

Recommended key mappings in init.lua:
- Leader + ff: find_files
- Leader + fg: live_grep (search text in files)
- Leader + fb: buffers
- Leader + fh: help_tags
- Leader + fs: lsp_document_symbols
- Leader + fr: oldfiles (recent files)

= Terminal
- `:terminal`: Open terminal buffer
- `i`: Enter terminal insert mode
- `Ctrl-\ Ctrl-n`: Exit terminal mode to normal mode
- `:split | terminal`: Open terminal in horizontal split

= Configuration (init.lua)

File path: `~/.config/nvim/init.lua`

Key options via vim.opt namespace:
- `number = true`: show line numbers
- `relativenumber = true`: relative line numbers
- `expandtab = true`: spaces instead of tabs
- `shiftwidth = 2`: 2-space indent
- `termguicolors = true`: true color support
- `ignorecase` + `smartcase`: smart search case sensitivity
- `scrolloff = 8`: keep 8 lines context when scrolling
- `undofile = true`: persistent undo history

Key mappings via vim.keymap.set:
- Space as leader: `vim.g.mapleader = " "`
- Leader w to save, Leader q to quit
- Esc to clear search highlight
- Ctrl-h/j/k/l to navigate between splits
- `jk` in insert mode as quick Esc

= Plugin Management (lazy.nvim)

Install lazy.nvim, then declare plugins:
- nvim-treesitter/nvim-treesitter: Syntax highlighting
- neovim/nvim-lspconfig: LSP configuration helpers
- nvim-telescope/telescope.nvim: Fuzzy finder
- hrsh7th/nvim-cmp: Autocompletion engine
- catppuccin/nvim: Colorscheme
- lewis6991/gitsigns.nvim: Git status in the gutter
- nvim-lualine/lualine.nvim: Statusline
- numToStr/Comment.nvim: Comment toggling

Bootstrap: clone lazy.nvim into stdpath data dir, prepend to rtp,
then call require("lazy").setup with your plugin list.

= Pro Tips

== Efficiency
- `.`: Repeat last change --- the single most powerful Vim command.
- `Ctrl-a Ctrl-x`: Increment / decrement number under cursor.
- `gf`: Go to file under cursor.
- `ga`: Show ASCII / Unicode value of char under cursor.
- `:checkhealth`: Run health diagnostics for plugins and settings.

== Common Search Patterns
- Find function definitions: search for the function keyword with word boundaries
- Delete trailing whitespace: use the substitute command on line ends
- Remove consecutive blank lines: use global substitute
- Surround word with quotes: use a macro or surround.vim plugin

== Git Integration (vim-fugitive)
- :Git -- open git status window (interactive)
- :Gdiff -- diff the current file against HEAD
- :Gwrite -- stage the current file
- :Git commit -- open commit message buffer
- :Git push / :Git pull -- push and pull branches
