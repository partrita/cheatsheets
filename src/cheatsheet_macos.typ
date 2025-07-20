#import "./templates/conf.typ": *

#show: template.with(
  title: "macOS 치트시트 ",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 파일 및 디렉토리 관리

- `ls`: 디렉토리 내용을 나열합니다.
  - `-l`: 긴 형식(권한, 소유자, 크기, 날짜 등)으로 표시합니다.
  - `-a`: `.`으로 시작하는 숨김 파일을 포함한 모든 파일을 표시합니다.
  - `-h`: 크기를 사람이 읽기 쉬운 형식(KB, MB, GB)으로 표시합니다.
  - `-t`: 수정 시간을 기준으로 정렬합니다.
  - `-R`: 하위 디렉토리 내용을 재귀적으로 나열합니다.
- `cd`: 디렉토리를 변경합니다. (`~` 홈, `-` 이전 디렉토리)
- `pwd`: 현재 작업 디렉토리의 전체 경로를 인쇄합니다.
- `mkdir -p <path>`: 중간 경로의 디렉토리가 없으면 함께 생성합니다.
- `rm`: 파일 또는 디렉토리를 삭제합니다.
  - `-r`: 디렉토리와 그 안의 내용을 재귀적으로 삭제합니다.
  - `-f`: 확인 메시지 없이 강제로 삭제합니다.
- `cp`: 파일이나 디렉토리를 복사합니다.
  - `-r` 또는 `-R`: 디렉토리를 재귀적으로 복사합니다.
- `mv`: 파일이나 디렉토리를 이동하거나 이름을 변경합니다.
- `touch <filename>`: 빈 파일을 생성하거나 파일의 타임스탬프를 업데이트합니다.
- `find <path> -name "<pattern>"`: 특정 경로에서 이름 패턴으로 파일을 검색합니다.
- `grep -r "<pattern>" <path>`: 특정 경로에서 파일 내용에 포함된 패턴을 재귀적으로 검색합니다.
- `chmod`: 파일 권한을 변경합니다. (예: `chmod 755 script.sh`)
- `chown`: 파일 소유자를 변경합니다. (예: `chown user:group file.txt`)
- `ln -s <target> <link_name>`: 심볼릭 링크를 생성합니다.
- `du -sh <path>`: 지정된 경로의 총 디스크 사용량을 요약하여 보여줍니다.
- `df -h`: 마운트된 볼륨의 디스크 공간 사용량을 보여줍니다.

= 2. 시스템 정보 및 프로세스 관리

- `top`: 실행 중인 프로세스와 시스템 리소스 사용량을 실시간으로 표시합니다.
- `ps aux`: 모든 사용자의 모든 실행 중인 프로세스를 자세히 표시합니다.
- `kill <PID>`: 특정 프로세스 ID(PID)를 가진 프로세스를 종료합니다.
  - `kill -9 <PID>`: 프로세스를 강제로 종료합니다.
- `pgrep <process_name>`: 프로세스 이름으로 PID를 검색합니다.
- `pkill <process_name>`: 프로세스 이름으로 프로세스를 종료합니다.
- `sysctl -n hw.ncpu`: CPU 코어 수를 확인합니다.
- `system_profiler <dataType>`: 특정 데이터 타입에 대한 시스템 프로필 정보를 자세히 보여줍니다. (예: `SPHardwareDataType`)
- `scutil --get HostName`: 호스트 이름을 확인합니다.
- `lsof -i :<port>`: 특정 포트를 사용하고 있는 프로세스를 확인합니다.
- `caffeinate`: Mac이 잠자기 모드로 들어가는 것을 방지합니다.
  - `caffeinate -d`: 디스플레이가 잠자는 것을 방지합니다.
  - `caffeinate -t 3600`: 지정된 시간(초) 동안 활성 상태를 유지합니다.



= 3. 네트워크 관리

- `ifconfig`: 네트워크 인터페이스의 구성을 표시하고 설정합니다.
- `ipconfig getifaddr en0`: 특정 인터페이스(en0)의 IP 주소를 가져옵니다.
- `ping <host>`: 호스트와의 네트워크 연결을 테스트합니다.
- `netstat -an`: 모든 네트워크 연결과 수신 대기 중인 포트를 숫자 형식으로 표시합니다.
- `dscacheutil -flushcache`: DNS 캐시를 초기화합니다.
- `mDNS -R`: Multicast DNS Responder 캐시를 초기화합니다.
- `arp -a`: ARP 테이블(IP 주소와 MAC 주소 매핑)을 표시합니다.
- `ssh <user>@<host>`: 원격 호스트에 SSH로 안전하게 연결합니다.
- `scp <source> <destination>`: 원격 호스트와 파일을 안전하게 복사합니다.

= 4. macOS 특정 명령어

- `open`: 파일, 디렉토리, URL을 기본 앱으로 엽니다.
  - `open .`: 현재 디렉토리를 Finder에서 엽니다.
  - `open -a <Application> <file>`: 특정 애플리케이션으로 파일을 엽니다.
- `mdfind "<query>"`: Spotlight 검색을 터미널에서 수행합니다.
- `mdls <filename>`: 파일의 메타데이터(Spotlight 정보)를 표시합니다.
- `defaults`: macOS 사용자 기본 설정을 읽고, 쓰고, 삭제합니다.
  - `defaults read com.apple.finder AppleShowAllFiles`: 숨김 파일 표시 여부 확인
  - `defaults write com.apple.finder AppleShowAllFiles -bool true`: 숨김 파일 표시 활성화
- `softwareupdate`: 시스템 소프트웨어 및 앱을 명령줄에서 업데이트합니다.
  - `-l`: 사용 가능한 업데이트를 나열합니다.
  - `-i -a`: 모든 사용 가능한 업데이트를 설치합니다.
- `diskutil`: 디스크 및 볼륨을 관리합니다.
  - `diskutil list`: 모든 디스크와 파티션을 나열합니다.
  - `diskutil verifyVolume /`: 주 볼륨의 무결성을 검사합니다.
  - `diskutil repairPermissions /`: 주 볼륨의 권한을 복구합니다. (구 버전 macOS)
- `tmutil`: Time Machine을 제어합니다.
  - `tmutil status`: Time Machine 백업 상태를 표시합니다.
  - `tmutil startbackup`: 백업을 시작합니다.
- `pbcopy`: 표준 입력을 클립보드로 복사합니다. (예: `cat file.txt | pbcopy`)
- `pbpaste`: 클립보드의 내용을 표준 출력으로 붙여넣습니다.
- `say`: 텍스트를 음성으로 변환하여 말합니다.

= 5. Homebrew (패키지 관리자)

- `brew install <formula>`: 커맨드라인 유틸리티(formula)를 설치합니다.
- `brew install --cask <cask>`: GUI 애플리케이션(cask)을 설치합니다.
- `brew uninstall <formula|cask>`: 패키지를 제거합니다.
- `brew update`: Homebrew 자체와 패키지 목록을 업데이트합니다.
- `brew upgrade`: 설치된 모든 패키지를 업그레이드합니다.
- `brew list`: 설치된 패키지 목록을 표시합니다.
- `brew search <text>`: 패키지를 검색합니다.
- `brew info <formula>`: 패키지의 정보를 보여줍니다.
- `brew doctor`: Homebrew 설치 상태의 문제를 진단합니다.
- `brew cleanup`: 오래된 버전의 패키지들을 삭제하여 공간을 확보합니다.
