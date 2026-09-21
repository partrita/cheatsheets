#import "../templates/conf.typ": *

#show: template.with(
  title: "Neovim Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://neovim.io/doc/",
)

= Core Concepts

Neovim is a hyperextensible modal text editor. It provides built-in LSP, Lua configuration, Tree-sitter integration, and modern package management.

- *Modal Editing*: Normal (navigate), Insert (type), Visual (select), Command (execute).
- *Lua First*: Configure via `~/.config/nvim/init.lua`.
- *Built-in LSP & Treesitter*: Native IDE features and syntax parsing.
- *Native Package Manager*: Manage plugins directly using `vim.pack` (Neovim 0.12+).

= Essential Navigation

== Fast Cursor Motions
- `h j k l`: Left / Down / Up / Right
- `w` / `b`: Start of next / previous word
- `e` / `ge`: End of current / previous word
- `0` / `^` / `\$`: Line start / First non-blank / Line end
- `gg` / `G`: Go to first / last line
- `:<N>` or `<N>G`: Jump to line number N
- `%`: Jump to matching bracket `()`, `{}`, `[]`
- `f<char>` / `F<char>`: Jump forward / backward to char (`;` next, `,` prev)
- `t<char>` / `T<char>`: Jump till before char forward / backward
- `Ctrl-d` / `Ctrl-u`: Scroll half-page down / up
- `zz` / `zt` / `zb`: Center / Top / Bottom current line on screen

== Jump List and Marks
- `Ctrl-o` / `Ctrl-i`: Jump to older / newer cursor position
- `g;` / `g,`: Jump to older / newer edit position
- `m<a-z>`: Set local mark
- `'<a-z>` / `` `<a-z>` ``: Jump to mark line / exact position
- `''`: Jump back to position before last jump

= High-Frequency Editing

== Insert Mode Triggers
- `i` / `I`: Insert before cursor / at line start
- `a` / `A`: Append after cursor / at line end
- `o` / `O`: Open new line below / above
- `s` / `S`: Substitute char / whole line
- `C`: Change from cursor to line end (`c\$`)
- `D`: Delete from cursor to line end (`d\$`)

== Operator + Motion (`d`, `c`, `y`)
- `dd` / `yy`: Delete (cut) / Yank (copy) current line
- `cc`: Change whole line
- `p` / `P`: Paste after / before cursor
- `x`: Delete single character
- `r<char>`: Replace single character
- `~`: Toggle case of character
- `>` / `<`: Indent right / left (`>>` / `<<` for current line)
- `==`: Auto-indent current line (`gg=G` whole file)
- `.`: *Repeat last change* (very important)

== Essential Text Objects
Combine with operators: `d` (delete), `c` (change), `y` (yank), `v` (select).
- `ciw` / `diw` / `yiw`: Change / Delete / Yank inner word
- `caw` / `daw`: Change / Delete word including trailing space
- `ci"` / `ca"`: Inside / Around double quotes
- `ci'` / `ca'`: Inside / Around single quotes
- `ci(` / `ca(`: Inside / Around parentheses (also `cib` / `cab`)
- `ci{` / `ca{`: Inside / Around curly braces (also `ciB` / `caB`)
- `ci[` / `ca[`: Inside / Around square brackets
- `cit` / `cat`: Inside / Around HTML/XML tags
- `cip` / `dap`: Inside / Around paragraph

= Visual & Block Mode

- `v`: Character visual selection
- `V`: Line visual selection
- `Ctrl-v`: Block (column) visual selection
- `gv`: Re-select last visual area
- `o`: Switch cursor to other end of selection

== Multi-Line Block Editing
1. Press `Ctrl-v` and select multiple lines vertically.
2. Press `I` (insert at start) or `A` (append at end).
3. Type text.
4. Press `Esc`: The change applies to all selected lines.

= Search & Replace

- `/pattern`: Search forward (`n` next, `N` previous)
- `?pattern`: Search backward
- `*` / `\#`: Search exact word under cursor forward / backward
- `:noh` or `<Esc>`: Clear search highlights
- `:%s/old/new/g`: Replace all in file
- `:%s/old/new/gc`: Replace with confirmation prompt
- `cgn`: Change current search match, then press `.` to repeat on next match
- `:g/pattern/d`: Delete all lines matching pattern
- `:v/pattern/d`: Delete all lines not matching pattern

= Windows, Buffers & Tabs

== Splits (Windows)
- `:vsp` / `:sp`: Vertical / Horizontal split
- `Ctrl-w v` / `Ctrl-w s`: Split vertical / horizontal
- `Ctrl-w h/j/k/l`: Move focus to left/down/up/right split
- `Ctrl-w c` / `Ctrl-w o`: Close current split / Close all other splits
- `Ctrl-w =`: Equalize split widths and heights

== Buffers
- `:ls` or `:buffers`: List active buffers
- `:b <name/number>`: Switch to buffer
- `:bn` / `:bp`: Next / Previous buffer
- `:bd`: Delete (close) current buffer
- `Ctrl-^`: Toggle between current and alternate buffer

== Tabs
- `:tabnew [file]`: Open new tab page
- `gt` / `gT`: Next / Previous tab
- `<N>gt`: Go to tab number N
- `:tabclose`: Close current tab

= Built-in Neovim Features

== Built-in LSP Keymaps
Neovim includes native LSP client support:
- `K`: Show hover documentation
- `gd`: Go to definition
- `gD`: Go to declaration
- `gr`: Show references (or `vim.lsp.buf.references()`)
- `gi`: Go to implementation
- `[d` / `]d`: Jump to previous / next diagnostic
- `vim.lsp.buf.rename()`: Rename symbol
- `vim.lsp.buf.code_action()`: Code actions
- `vim.lsp.buf.format()`: Format current buffer
- `:checkhealth`: Check Neovim setup, providers, and LSP status

== Built-in Terminal
- `:terminal`: Open terminal buffer
- `i` / `a`: Enter terminal typing mode
- `Ctrl-\ Ctrl-n`: Exit terminal mode back to Normal mode

= Configuration (`init.lua`)

Set basic options in `~/.config/nvim/init.lua`:

```lua
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Essential options
local opt = vim.opt
opt.number = true          -- Show line number
opt.relativenumber = true  -- Relative line numbers
opt.expandtab = true       -- Spaces instead of tabs
opt.shiftwidth = 2        -- Indent size
opt.tabstop = 2
opt.smartindent = true     -- Auto indent
opt.ignorecase = true      -- Case-insensitive search
opt.smartcase = true       -- Case-sensitive if capital typed
opt.termguicolors = true   -- True color support
opt.scrolloff = 8          -- Scroll offset lines
opt.signcolumn = "yes"     -- Keep sign column open
opt.undofile = true        -- Persistent undo

-- Keymaps: vim.keymap.set(mode, lhs, rhs, opts)
local keymap = vim.keymap.set
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
```

= Plugin Management (`vim.pack`)

Neovim 0.12+ provides native plugin management via `vim.pack`.

== Adding Plugins with `vim.pack.add`

Declare plugins in your `init.lua`:

```lua
vim.pack.add({
  -- String: Git repository URL
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/echasnovski/mini.nvim",
  "https://github.com/keaising/im-select.nvim",

  -- Table: Specification with branch/tag
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    version = "0.1.x",
  },
})

-- Configure plugins after pack loading
vim.cmd.colorscheme("tokyonight")
require("gitsigns").setup()
require("im_select").setup({})
```

== `vim.pack` Commands & Operations
- `:packadd <name>`: Load optional package on demand
- `vim.pack.update()`: Update installed packages to latest revisions
- `vim.pack.del()`: Delete managed package
- `vim.pack-lockfile`: Auto-generated lockfile with exact git commit SHAs for reproducibility
- `:help vim.pack`: Open built-in documentation

= Recommended Modern Plugins

== Syntax & Parsing
- *nvim-treesitter/nvim-treesitter*: Advanced AST-based syntax highlighting, indentation, and incremental selection.

== LSP & Tooling
- *neovim/nvim-lspconfig*: Standard configurations for language servers.
- *williamboman/mason.nvim*: Portable package manager for LSP servers, DAP servers, linters, and formatters.
- *williamboman/mason-lspconfig.nvim*: Bridge between mason.nvim and lspconfig.

== Autocompletion
- *Saghen/blink.cmp*: Fast, modern, performant completion engine with snippet and LSP integration.
- *hrsh7th/nvim-cmp*: Widely-used modular completion engine with extensive source plugins.

== Fuzzy Finder & Navigation
- *nvim-telescope/telescope.nvim*: Highly customizable fuzzy finder for files, git commits, grep, and LSP symbols.
- *ibhagwan/fzf-lua* or *folke/snacks.nvim*: High-speed fuzzy search alternative.

== Git Integration
- *lewis6991/gitsigns.nvim*: Git signs in the signcolumn, inline diff previews, hunk staging, and blame lines.
- *tpope/vim-fugitive*: Comprehensive Git command wrapper for Neovim.

== Editing & UI Enhancements
- *echasnovski/mini.nvim*: Fast, independent Lua modules for surrounding, comments, AI text-objects, and file browsing.
- *keaising/im-select.nvim*: Automatically switches input method (IME) to English on leaving Insert mode.
- *nvim-lualine/lualine.nvim*: Fast and configurable statusline.
- *folke/which-key.nvim*: Popup display showing available keybindings as you type.

= mini.nvim Module Guide

`mini.nvim` provides modular, standalone utilities. Enable modules individually:

```lua
require('mini.surround').setup()
require('mini.comment').setup()
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.files').setup()
require('mini.bracketed').setup()
```

== mini.surround (Delimiter Management)
- `saiw"`: Add surrounding `"` around inner word
- `sd"`: Delete surrounding `"`
- `sr"'`: Replace surrounding `"` with `'`
- `sh)`: Highlight surrounding `()`

== mini.comment (Fast Commenting)
- `gcc`: Toggle comment on current line
- `gc` (in Visual mode): Toggle comment on selection
- `gc<motion>`: Toggle comment over motion (e.g. `gcip` on paragraph)

== mini.ai (Enhanced Text Objects)
- `via` / `cia`: Select / Change inside function argument
- `vaa` / `daa`: Select / Delete around function argument with comma
- `vif` / `cif`: Inside function body
- `vaf` / `daf`: Around whole function definition

== mini.files (Buffer-Based File Manager)
- `MiniFiles.open()`: Open file explorer
- Navigate with `h j k l`.
- Edit file names directly like buffer text.
- Save buffer (`:w`) to commit file renames, creations, or deletions.

== mini.bracketed (Bracket Navigation)
- `[b` / `]b`: Previous / next buffer
- `[d` / `]d`: Previous / next diagnostic
- `[q` / `]q`: Previous / next quickfix entry

= IME Switching (`im-select.nvim`)

Automatically restores English input method when leaving Insert mode. This avoids typing errors in Normal mode.

```lua
require('im_select').setup({
  -- Default English IM engine
  -- macOS: "com.apple.keylayout.ABC"
  -- Windows: "1033"
  -- Linux (fcitx5): "keyboard-us"
  default_im_select = "keyboard-us",
  -- Restore previous IM when re-entering Insert mode
  set_previous_events = { "InsertEnter" },
})
```
