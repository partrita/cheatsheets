#import "../templates/conf.typ": *

#show: template.with(
  title: "Rio Terminal Configuration Cheatsheet",
  header: [#datetime.today().display()],
  footer: "Rio Terminal Configuration Guide (raphamorim.io/rio)",
)

= Overview & Config Path

Rio is a hardware-accelerated, cross-platform terminal emulator built in Rust using WebGPU/wgpu.

== Configuration Path (`config.toml`)
- *Linux / macOS*: `~/.config/rio/config.toml`
- *Windows*: `%APPDATA%\rio\config.toml`
- Configurations hot-reload automatically upon saving.

= Window & Navigation (`[window]`, `[navigation]`)

== Window Styling & Opacity
```toml
padding-x = 10
line-height = 1.0

[window]
width = 1000
height = 600
mode = "Windowed" # Windowed | Maximized | Fullscreen
background-opacity = 0.92
blur = true
decorations = "Enabled" # Enabled | Disabled
```

== Tabs & Navigation Modes
```toml
[navigation]
# Tab display mode
mode = "CollapsedTab"
# Options: CollapsedTab | TopTab | BottomTab | Breadcrumb | Plain

clickable = true
use-current-path = true
use-split = true
color-automation = []
```

= Fonts & Renderer (`[fonts]`, `[renderer]`)

== Font Configuration
```toml
[fonts]
size = 15

family = "Fira Code"

[fonts.bold]
family = "Fira Code"
weight = 700

[fonts.italic]
family = "Fira Code"
style = "italic"
```

== Renderer Performance
```toml
[renderer]
# Performance: High (max refresh) | Low (power save)
performance = "High"

# Backend: Automatic | Metal | Vulkan | Dx12
backend = "Automatic"

# Pause rendering when unfocused (saves battery)
disable-renderer-when-unfocused = true
```

= Cursor & Shell Environment

== Cursor Style
```toml
# Cursor shape: 'block' | 'beam' | 'underline'
cursor = 'block'
blinking-cursor = false
hide-cursor-when-typing = true
```

== Default Shell & Editor
```toml
editor = "nvim"

[shell]
program = "zsh"
args = ["--login"]
```

== Keyboard & Platform Options
```toml
use-fork = false
working-dir = ""
option-as-alt = "Both" # macOS: map Option to Alt
```

= Themes & Colors (`theme`, `[colors]`)

== Built-in Themes
```toml
theme = "nord"
# dracula, catppuccin-mocha, gruvbox, solarized-dark, etc.
```

== Custom Color Palette
```toml
[colors]
background = '#24273A'
foreground = '#CAD3F5'
cursor = '#F4DBD6'

[colors.tabs]
active = '#8AADF4'
inactive = '#494D64'

[colors.regular]
black = '#494D64'
red = '#ED8796'
green = '#A6DA95'
yellow = '#EED49F'
blue = '#8AADF4'
magenta = '#F5BDE6'
cyan = '#8BD5CA'
white = '#B8C0E0'
```

= Key Bindings (`[bindings]`)

== Default Shortcuts
- *New Tab*: `Cmd/Ctrl + T`
- *Close Tab*: `Cmd/Ctrl + W`
- *Next/Prev Tab*: `Ctrl + Tab` / `Ctrl + Shift + Tab`
- *Go to Tab N*: `Cmd/Ctrl + 1~9`
- *Split Right*: `Cmd/Ctrl + Shift + D`
- *Split Down*: `Cmd/Ctrl + Shift + E`
- *Close Pane*: `Cmd/Ctrl + Shift + W`
- *Font Size*: `Cmd/Ctrl + + / - / 0`
- *Copy / Paste*: `Cmd/Ctrl + Shift + C / V`

== Custom Key Bindings
```toml
[bindings]
keys = [
  { key = "t", with = "super", action = "CreateTab" },
  { key = "w", with = "super", action = "CloseTab" },
  { key = "d", with = "super | shift", action = "SplitRight" },
  { key = "e", with = "super | shift", action = "SplitDown" },
  { key = "f", with = "super", action = "SearchHistory" },
  { key = "0", with = "super", action = "ResetFontSize" },
]
```

= Practical Tips

- *GPU Optimization*: Enable `disable-renderer-when-unfocused = true` to save battery life.
- *Directory Sync*: Enable `navigation.use-current-path = true` so new tabs and splits inherit the current working directory.
- *macOS Meta Key*: Neovim/Emacs users should set `option-as-alt = "Both"`.
