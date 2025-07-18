#import "./templates/conf.typ": *

#show: template.with(
  title: "Linux 치트시트 (심화)",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 파일 및 디렉토리 관리

- `ls`: 디렉토리 내용을 나열합니다. (`-l` 상세, `-a` 숨김 파일, `-h` 읽기 쉬운 크기, `-t` 시간순 정렬, `-R` 재귀)
- `cd`: 디렉토리를 변경합니다. (`~` 홈, `-` 이전, `..` 상위)
- `pwd`: 현재 작업 디렉토리를 인쇄합니다.
- `mkdir -p <path>`: 중간 경로의 디렉토리도 함께 생성합니다.
- `rm`: 파일이나 디렉토리를 삭제합니다. (`-r` 재귀, `-f` 강제, `-v` 과정 표시)
- `cp`: 파일이나 디렉토리를 복사합니다. (`-r` 재귀, `-p` 속성 유지, `-a` 아카이브 모드)
- `mv`: 파일이나 디렉토리를 이동하거나 이름을 바꿉니다.
- `touch`: 빈 파일을 생성하거나 파일의 타임스탬프를 업데이트합니다.
- `find <path> -type f -name "*.txt"`: 특정 경로에서 `.txt` 확장자를 가진 파일을 찾습니다.
- `grep -r "pattern" .`: 현재 디렉토리부터 재귀적으로 파일 내용에서 패턴을 검색합니다.
- `chmod`: 파일 권한을 변경합니다. (`u` 사용자, `g` 그룹, `o` 기타, `+` 추가, `-` 제거, `rwx` 권한)
  - `chmod u+x script.sh`: 사용자에게 실행 권한을 추가합니다.
- `chown <user>:<group> <file>`: 파일의 소유자와 그룹을 변경합니다. (`-R` 재귀)
- `stat <file>`: 파일의 상세 정보(inode, 크기, 접근 시간 등)를 표시합니다.
- `ln -s <target> <link_name>`: 심볼릭 링크를 생성합니다.
- `du -sh <dir>`: 디렉토리의 총 사용량을 요약하여 보여줍니다.
- `df -h`: 파일 시스템의 디스크 공간 사용량을 보여줍니다.

= 2. 텍스트 처리 및 리디렉션

- `cat`: 파일 내용을 출력하고 연결합니다.
- `less` / `more`: 파일 내용을 페이지 단위로 봅니다.
- `head -n 20 <file>`: 파일의 첫 20줄을 봅니다.
- `tail -n 20 <file>`: 파일의 마지막 20줄을 봅니다.
  - `tail -f <logfile>`: 로그 파일을 실시간으로 모니터링합니다.
- `sort`: 텍스트 줄을 정렬합니다. (`-n` 숫자순, `-r` 역순, `-k` 필드 지정)
- `uniq`: 중복된 줄을 제거합니다. (`-c` 중복 횟수 표시)
- `cut -d',' -f1-3 <file.csv>`: 쉼표로 구분된 파일에서 첫 3개 필드를 잘라냅니다.
- `sed 's/old/new/g' <file>`: 스트림 편집기를 사용하여 파일 내용의 'old'를 'new'로 치환합니다.
- `awk '{print $1, $3}' <file>`: 파일에서 첫 번째와 세 번째 필드를 출력합니다.
- `>`: 표준 출력을 파일로 리디렉션 (덮어쓰기).
- `>>`: 표준 출력을 파일로 리디렉션 (추가).
- `<`: 파일 내용을 표준 입력으로 사용.
- `2>`: 표준 에러를 파일로 리디렉션.
- `&>`: 표준 출력과 표준 에러를 모두 리디렉션.
- `|`: 파이프. 한 명령어의 출력을 다른 명령어의 입력으로 연결.
  - `ps aux | grep "nginx"`



= 3. 시스템 정보 및 모니터링

- `uname -a`: 모든 커널 정보를 인쇄합니다.
- `lscpu`: CPU 아키텍처 정보를 표시합니다.
- `free -h`: 메모리 및 스왑 사용량을 표시합니다.
- `top`: 실행 중인 프로세스와 시스템 리소스를 실시간으로 표시합니다.
- `htop`: `top`의 개선된 버전 (설치 필요).
- `ps aux`: 모든 실행 중인 프로세스를 BSD 스타일로 표시합니다.
- `pstree`: 프로세스를 트리 형태로 보여줍니다.
- `kill <PID>`: 프로세스를 종료합니다. (`-9` 강제 종료, `-15` 정상 종료)
- `pkill <name>`: 이름으로 프로세스를 종료합니다.
- `ip addr` 또는 `ifconfig`: 네트워크 인터페이스와 IP 주소를 표시합니다.
- `netstat -tulnp`: 수신 대기 중인 모든 TCP/UDP 포트와 해당 포트를 사용하는 프로세스를 표시합니다.
- `ss`: `netstat`의 최신 대체 도구.
- `uptime`: 시스템 가동 시간과 부하 평균을 보여줍니다.
- `dmesg`: 커널 링 버퍼 메시지를 인쇄합니다. (부팅 및 하드웨어 관련 문제 진단)
- `journalctl`: systemd 로그를 조회합니다. (`-u <service>` 특정 서비스, `-f` 실시간)

= 4. 패키지 관리

- *Debian/Ubuntu (APT)*:
  - `apt update && apt upgrade`
  - `apt install <package>`
  - `apt remove <package>`
  - `apt autoremove`: 불필요한 의존성 패키지 자동 제거
  - `apt search <keyword>`
  - `apt show <package>`
- *Red Hat/CentOS/Fedora (DNF/YUM)*:
  - `dnf check-update && dnf upgrade`
  - `dnf install <package>`
  - `dnf remove <package>`
  - `dnf search <keyword>`
  - `dnf info <package>`

= 5. 사용자 및 권한 관리

- `useradd -m <username>`: 홈 디렉토리와 함께 새 사용자를 추가합니다.
- `usermod -aG <group> <user>`: 사용자를 특정 그룹에 추가합니다.
- `userdel -r <username>`: 홈 디렉토리와 함께 사용자를 삭제합니다.
- `passwd <username>`: 사용자의 비밀번호를 변경합니다.
- `su - <username>`: 다른 사용자의 환경으로 완전히 전환합니다.
- `sudo <command>`: root 권한으로 명령을 실행합니다.
- `visudo`: `/etc/sudoers` 파일을 안전하게 편집합니다.

= 6. 압축 및 아카이빙

- `tar`:
  - `tar -czvf archive.tar.gz /path/to/dir`: 디렉토리를 gzip으로 압축.
  - `tar -xzvf archive.tar.gz`: gzip 압축 해제.
  - `tar -cjvf archive.tar.bz2 /path/to/dir`: bzip2로 압축.
  - `tar -xjvf archive.tar.bz2`: bzip2 압축 해제.
- `zip`/`unzip`:
  - `zip -r archive.zip /path/to/dir`
  - `unzip archive.zip`

= 7. SSH 및 네트워크 파일 전송

- `ssh <user>@<host>`: 원격 호스트에 SSH로 연결합니다.
  - `ssh -p <port> <user>@<host>`: 포트 지정.
  - `ssh -i /path/to/key <user>@<host>`: 개인키 지정.
- `scp`: 원격 호스트와 파일을 안전하게 복사합니다.
  - `scp local_file user@host:/remote/path`
  - `scp user@host:/remote/path local_file`
- `rsync -avz <source> <destination>`: 빠르고 효율적인 파일 동기화 도구.
