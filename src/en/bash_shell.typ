#import "../templates/conf.typ": *

#show: template.with(
  title: "Bash Scripting Cheat Sheet",
  header: [Last updated: #datetime.today().display()],
  footer: "Bash Shell Scripting & Parameter Expansion Cheat Sheet",
)

= Basics & Variables

```bash
#!/usr/bin/env bash
name="John"
echo "Hello $name!"
```

== Variable & Quote Rules
- `name="John"` : Variable assignment (no spaces around `=`)
- `"$name"` / `"${name}!"` : Double quotes (expands variables and command substitutions)
- `'Hi $name'` : Single quotes (literal string, no expansion)
- `cp -$options $wildcard /tmp` : Unquoted when expanding wildcards or flags

== Execution & Strict Mode
- `$(pwd)` : Command substitution (preferred over obsolete `` `pwd` ``)
- `git commit && git push` : Execute second only if first succeeds
- `git commit || echo "Failed"` : Execute second only if first fails
- *Strict Mode*:
  ```bash
  set -euo pipefail
  IFS=$'\n\t'
  ```

= Brace Expansion

- `{A,B}.js` -> `A.js B.js`
- `{1..5}` -> `1 2 3 4 5`
- `{5..50..5}` -> `5 10 15 ... 50` (step size)
- `{{1..3},{7..9}}` -> `1 2 3 7 8 9`

= Parameter Expansions

== Slicing & Length
- `${name:0:2}` / `${name::2}` : First 2 characters (`"Jo"`)
- `${name::-1}` : All but last character (`"Joh"`)
- `${name:(-1)}` : Last character (`"n"`)
- `${name:(-2):1}` : 1 character starting from 2nd from right (`"h"`)
- `${#name}` : String length

== Path Manipulation & Substitution
- `src="/path/to/foo.cpp"`
- `${src%.cpp}` -> `/path/to/foo` (remove extension)
- `${src%/*}` -> `/path/to` (parent directory)
- `${src##*/}` -> `foo.cpp` (basename)
- `${src##*.}` -> `cpp` (file extension)
- `${src/foo/bar}` : Replace first match
- `${src//foo/bar}` : Replace all matches
- `${src/#foo/bar}` : Prefix match replacement
- `${src/%foo/bar}` : Suffix match replacement

== Case Modification & Defaults
- `${str,}` / `${str,,}` : Lowercase 1st char / all chars
- `${str^}` / `${str^^}` : Uppercase 1st char / all chars
- `${foo:-val}` : Returns `val` if `foo` is unset or null
- `${foo:=val}` : Sets `foo` to `val` if unset or null
- `${foo:+val}` : Returns `val` if `foo` is set and not null
- `${foo:?msg}` : Exits with error message if `foo` is unset or null
- `${!prefix_*}` : Expands all variable names matching prefix
- `${!pointer}` : Variable indirection

= Conditionals

== Test Operators (`[[ ... ]]` vs `(( ... ))`)
- Strings: `[[ -z "$str" ]]` (empty), `[[ -n "$str" ]]` (not empty), `[[ "$a" == "$b" ]]`, `[[ "$str" =~ ^[0-9]+$ ]]` (regex)
- Numbers: `(( a < b ))`, `(( a >= b ))` or `[[ $a -eq $b ]]`, `[[ $a -lt $b ]]`
- Files:
  - `[[ -e FILE ]]`: Exists
  - `[[ -f FILE ]]`: Regular file
  - `[[ -d FILE ]]`: Directory
  - `[[ -s FILE ]]`: Size > 0 bytes
  - `[[ -r FILE ]]`, `[[ -w FILE ]]`, `[[ -x FILE ]]`: Permissions
  - `[[ -h FILE ]]`: Symlink
  - `[[ F1 -nt F2 ]]`: F1 is newer than F2
  - `[[ F1 -ef F2 ]]`: Same file / hard link

== Case Statement
```bash
case "$1" in
  start | up) vagrant up ;;
  stop) vagrant halt ;;
  *) echo "Usage: $0 {start|stop}" ;;
esac
```

= Loops

== For & While Loops
```bash
# Basic & C-style loop
for i in /etc/rc.*; do echo "$i"; done
for ((i = 0; i < 100; i++)); do echo "$i"; done

# Line-by-line reading
while read -r line; do
  echo "$line"
done < file.txt
```

= Functions & Special Variables

```bash
myfunc() {
  local myresult="value"
  echo "$myresult $1"
  return 0
}
result=$(myfunc "argument")
```

== Special Parameters
- `$#` : Number of arguments
- `"$*"` : All arguments as a single string
- `"$@"` : All arguments as separate quoted strings
- `$?` : Exit status of last executed command (0: success)
- `$$` : PID of the current shell
- `$!` : PID of the most recent background job
- `$0` : Filename of the script
- `$_` : Last argument of previous command
- `${PIPESTATUS[@]}` : Array of exit statuses from pipeline

= Arrays & Dictionaries

== Indexed Arrays
```bash
Fruits=('Apple' 'Banana' 'Orange')
Fruits+=('Watermelon')         # Push
echo "${Fruits[0]}"            # Element #0
echo "${Fruits[-1]}"           # Last element
echo "${Fruits[@]}"            # All elements
echo "${#Fruits[@]}"           # Array length
echo "${!Fruits[@]}"           # Array indices
unset Fruits[1]                # Remove element
```

== Associative Arrays (Dictionaries)
```bash
declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"

echo "${sounds[dog]}"
for key in "${!sounds[@]}"; do
  echo "$key says: ${sounds[$key]}"
done
```

= Redirection & Process Substitution

- `cmd > file` : Redirect stdout (overwrite)
- `cmd >> file` : Redirect stdout (append)
- `cmd 2> err.log` : Redirect stderr
- `cmd 2>&1` / `cmd &> file` : Merge stdout and stderr
- `cmd > /dev/null 2>&1` / `cmd &> /dev/null` : Discard all output
- `cmd < file.txt` : Feed file to stdin
- `cat << 'EOF'` : Multi-line Heredoc
- `tr '[:lower:]' '[:upper:]' <<< "string"` : Herestring
- `diff <(ls dir1) <(ls dir2)` : Process substitution

= Shell Options & Traps

- `set -o noclobber` : Prevent accidental file overwrite
- `set -o errexit` (`-e`) : Exit immediately on error
- `set -o pipefail` : Unveil pipeline errors
- `set -o nounset` (`-u`) : Error on unset variables
- `shopt -s globstar` : Enable recursive `**` globbing
- `shopt -s nullglob` : Non-matching globs expand to empty string
- `trap 'echo Error on line $LINENO' ERR` : Error trapping
- `cd -` : Switch to previous directory
