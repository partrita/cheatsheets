#import "../templates/conf.typ": *

#show: template.with(
  title: "PowerShell 치트시트",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "PowerShell Cheat Sheet",
)

= 1. 도움말 및 탐색 (Help & Navigation)

- `Get-Help <cmd>`: 명령어에 대한 도움말 확인 (예: `Get-Help Get-Service`).
- `Update-Help`: 최신 도움말 파일을 인터넷에서 다운로드합니다.
- `Get-Command`: 현재 세션에서 사용 가능한 모든 명령어를 나열합니다.
- `Get-Alias`: 현재 정의된 별칭(Alias) 목록을 표시합니다 (예: `dir`, `ls`, `cd`).
- `Get-Member`: 객체의 속성(Properties)과 메서드(Methods)를 확인합니다.
- `Get-History`: 현재 세션에서 실행한 명령어 기록을 확인합니다.

= 2. 파일 및 디렉토리 관리 (Files & Directories)

- `ls` / `dir` / `Get-ChildItem`: 파일 및 폴더 목록을 표시합니다.
- `cd <path>` / `Set-Location`: 현재 작업 디렉토리를 변경합니다.
- `mkdir <name>` / `New-Item -ItemType Directory`: 새 폴더를 생성합니다.
- `cp <src> <dst>` / `Copy-Item`: 파일이나 폴더를 복사합니다.
- `mv <src> <dst>` / `Move-Item`: 파일이나 폴더를 이동하거나 이름을 변경합니다.
- `rm <path>` / `Remove-Item`: 파일이나 폴더를 삭제합니다 (`-Recurse` 옵션으로 하위 포함).
- `cat <file>` / `Get-Content`: 파일의 내용을 텍스트로 읽어옵니다.
- `echo <msg>` / `Write-Output`: 메시지를 콘솔에 출력합니다.

= 3. 프로세스 및 서비스 관리 (Process & Service)

- `ps` / `Get-Process`: 현재 실행 중인 프로세스 목록을 확인합니다.
- `kill <id>` / `Stop-Process`: 특정 프로세스를 강제 종료합니다.
- `Get-Service`: 시스템 서비스 목록과 상태를 확인합니다.
- `Start-Service <name>`: 서비스를 시작합니다.
- `Stop-Service <name>`: 서비스를 중지합니다.
- `Restart-Service <name>`: 서비스를 재시작합니다.

= 4. 파이프라인 및 객체 조작 (Pipeline & Objects)

- `|` (Pipeline): 한 명령어의 출력을 다음 명령어의 입력으로 전달합니다.
- `Where-Object` (별칭: `?`): 조건에 맞는 객체만 필터링합니다.
  - `Get-Service | ? Status -eq "Running"`
- `Select-Object`: 특정 속성만 선택하거나 출력 개수를 제한합니다.
  - `Get-Process | Select-Object Name, CPU -First 10`
- `ForEach-Object` (별칭: `%`): 각 객체에 대해 루프를 실행합니다.
- `Sort-Object`: 속성을 기준으로 정렬합니다 (`-Descending`으로 내림차순).

= 5. 네트워크 및 웹 (Networking & Web)

- `Test-Connection <host>`: 원격 호스트에 핑(Ping)을 보냅니다.
- `Resolve-DnsName <host>`: DNS 조회를 수행합니다.
- `ipconfig` / `Get-NetIPAddress`: 네트워크 인터페이스 정보를 확인합니다.
- `Invoke-WebRequest` (별칭: `curl`, `wget`): 웹 페이지 요청을 보냅니다.
- `Invoke-RestMethod`: REST API 요청을 보내고 JSON/XML 결과를 객체로 받습니다.

= 6. 스크립팅 및 실행 정책 (Scripting & Policy)

- `$Variable`: 변수를 선언하고 값을 저장합니다 (예: `$name = "PowerShell"`).
- `$profile`: 현재 사용자의 PowerShell 프로필 경로를 확인합니다.
- `Get-ExecutionPolicy`: 현재 스크립트 실행 권한을 확인합니다.
- `Set-ExecutionPolicy <policy>`: 실행 권한을 변경합니다 (예: `RemoteSigned`).
- `& <file.ps1>`: PowerShell 스크립트를 실행합니다.

= 7. 유용한 팁 (Useful Tips)

- `Tab` 자동 완성: 명령어, 경로, 매개변수 등을 자동으로 완성합니다.
- `Out-GridView`: 결과를 별도의 GUI 창에 표 형식으로 표시합니다.
- `Export-Csv <path>`: 결과를 CSV 파일로 저장합니다.
- `ConvertFrom-Json` / `ConvertTo-Json`: JSON 데이터와 객체 간 변환을 수행합니다.
- `$LASTEXITCODE`: 마지막으로 실행된 외부 명령의 종료 코드를 확인합니다.
