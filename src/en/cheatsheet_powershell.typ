#import "../templates/conf.typ": *

#show: template.with(
  title: "PowerShell Cheatsheet",
  header: [Last updated: #datetime.today().display()],
  footer: "PowerShell Cheat Sheet",
)

= 1. Help & Navigation

- `Get-Help <cmd>`: Display help information for a command (e.g., `Get-Help Get-Service`).
- `Update-Help`: Download the latest help files from the internet.
- `Get-Command`: List all commands available in the current session.
- `Get-Alias`: Show a list of currently defined aliases (e.g., `dir`, `ls`, `cd`).
- `Get-Member`: Inspect the properties and methods of an object.
- `Get-History`: View the command history for the current session.

= 2. Files & Directories

- `ls` / `dir` / `Get-ChildItem`: List files and folders in a directory.
- `cd <path>` / `Set-Location`: Change the current working directory.
- `mkdir <name>` / `New-Item -ItemType Directory`: Create a new folder.
- `cp <src> <dst>` / `Copy-Item`: Copy files or folders.
- `mv <src> <dst>` / `Move-Item`: Move or rename files or folders.
- `rm <path>` / `Remove-Item`: Delete files or folders (use `-Recurse` for subfolders).
- `cat <file>` / `Get-Content`: Read the text content of a file.
- `echo <msg>` / `Write-Output`: Print a message to the console.

= 3. Process & Service Management

- `ps` / `Get-Process`: List currently running processes.
- `kill <id>` / `Stop-Process`: Forcefully stop a specific process.
- `Get-Service`: List system services and their current status.
- `Start-Service <name>`: Start a service.
- `Stop-Service <name>`: Stop a service.
- `Restart-Service <name>`: Restart a service.

= 4. Pipeline & Object Manipulation

- `|` (Pipeline): Pass output from one command as input to the next.
- `Where-Object` (alias: `?`): Filter objects based on a condition.
  - `Get-Service | ? Status -eq "Running"`
- `Select-Object`: Select specific properties or limit the number of results.
  - `Get-Process | Select-Object Name, CPU -First 10`
- `ForEach-Object` (alias: `%`): Loop through each object in a collection.
- `Sort-Object`: Sort objects by properties (use `-Descending` for reverse order).

= 5. Networking & Web

- `Test-Connection <host>`: Send a Ping request to a remote host.
- `Resolve-DnsName <host>`: Perform a DNS lookup.
- `ipconfig` / `Get-NetIPAddress`: Display network interface information.
- `Invoke-WebRequest` (alias: `curl`, `wget`): Send an HTTP request to a web page.
- `Invoke-RestMethod`: Send a REST API request and parse JSON/XML results as objects.

= 6. Scripting & Policy

- `$Variable`: Declare a variable and store a value (e.g., `$name = "PowerShell"`).
- `$profile`: Show the path to the current user's PowerShell profile.
- `Get-ExecutionPolicy`: Check the current script execution permissions.
- `Set-ExecutionPolicy <policy>`: Change execution permissions (e.g., `RemoteSigned`).
- `& <file.ps1>`: Execute a PowerShell script file.

= 7. Useful Tips

- `Tab` Completion: Automatically complete commands, paths, and parameters.
- `Out-GridView`: Display results in a separate GUI window with a sortable table.
- `Export-Csv <path>`: Save results to a CSV file.
- `ConvertFrom-Json` / `ConvertTo-Json`: Convert between JSON strings and objects.
- `$LASTEXITCODE`: Check the exit code of the last executed external command.
