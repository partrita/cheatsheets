#import "../templates/conf.typ": *

#show: template.with(
  title: "Practical Shell Scripts",
  header: [Last updated: #datetime.today().display()],
  footer: "Useful Shell Scripts & Wrappers",
)

This document is a collection of practical shell scripts and wrappers designed to reduce repetitive tasks and boost terminal productivity. Most scripts work on both macOS and Linux.

= 1. Clipboard Management

- `copy`: Copy standard output to the system clipboard.
  - `ls | copy`
- `pasta`: Output text from the clipboard.
  - `pasta > file.txt`, `vim "$(pasta)"`
- `pastas`: Real-time monitoring of clipboard changes, outputting contents as they change.
  - `pastas | wget -i -` (download copied links immediately)
- `cpwd`: Copy the current directory's full path to the clipboard.

= 2. File & Directory Management

- `mkcd <dir>`: Create a directory and immediately move into it.
- `tempe`: Create and enter a temporary directory (for sandboxed tasks).
- `trash <file>`: Move files to the trash instead of deleting them permanently.
- `mksh <name>`: Create a new shell script, make it executable, and open it in an editor.

= 3. Internet & Network

- `serveit`: Start a static file server in the current directory.
- `getsong <url>`: Download audio at highest quality using `yt-dlp`.
- `getpod <url>`: Download video as a podcast-ready audio file.
- `getsubs <url>`: Extract subtitles (English priority, auto-caption fallback).
  - `getsubs <url> | ollama run llama3.2 "Summarize this"`
- `wifi [off|on|toggle]`: Control system WiFi.
- `url <string>`: Parse a URL into protocol, host, path, query, etc.

= 4. Text Processing

- `scratch`: Quickly open a temporary text buffer in an editor (e.g., Vim).
- `straightquote`: Convert smart quotes (“ ”) into standard straight quotes (" ").
- `markdownquote`: Prepend `>` to each line of input for Markdown blockquotes.
- `jsonformat`: Pretty-print JSON data.
- `uppered` / `lowered`: Convert string to uppercase/lowercase.
- `nato <text>`: Convert text to NATO phonetic alphabet (Alpha, Bravo...).
- `u+ <hex>`: Lookup Unicode character name and symbol.
- `snippets <key>`: Fetch boilerplate text from a personal snippet dictionary.

= 5. REPL Launchers

Quickly launch interactive shells for various languages.
- `iclj`: Clojure / `ijs`: Deno/Node / `iphp`: PHP / `ipy`: Python / `isql`: SQLite

= 6. Process & System

- `running <keyword>`: Search for running processes by keyword.
- `murder <id>`: Gracefully (and then forcefully) terminate a process.
- `waitfor <pid>`: Wait until a specific PID exits.
- `bb <cmd>`: Run a command in true background mode (daemonized).
- `tryna <cmd>`: Run a command repeatedly until it succeeds.
- `prettypath`: Print `$PATH` environment variable line-by-line for readability.

= 7. Media & Miscellaneous

- `ocr <file>`: Extract text from an image file.
- `boop`: Play a sound based on the success/failure of the last command.
- `timer <time>`: Set a timer and send a notification when finished.
- `tunes` / `pix`: Use `mpv` to play audio files or view photos.
- `shrinkvid`: Compress video file size using `ffmpeg`.
- `emoji <key>`: Search for emojis by keyword.
- `uuid`: Generate a version 4 UUID.
- `notify <msg>`: Send a system OS notification.

= 8. Modern Shell Utilities

Powerful tools that replace or extend standard Unix utilities.
- `tldr <cmd>`: Concise, example-based help instead of long `man` pages.
- `fd <pattern>`: A simple, fast, and user-friendly alternative to `find`.
- `rg <pattern>`: Extremely fast text search (ripgrep), replacing `grep`.
- `fzf`: A general-purpose fuzzy finder for command history (`Ctrl+R`) and files.
- `z` / `j` (autojump): Jump to frequently used directories using keywords.
  - `z project` -> Jump to `/home/user/workspace/very/long/path/project`
- `tree`: Visualize directory structure as a tree.
- `nnn` / `ranger`: Advanced terminal-based file managers.
