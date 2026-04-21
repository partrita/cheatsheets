#import "../templates/conf.typ": *

#show: template.with(
  title: "실용 셸 스크립트 도구",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "Useful Shell Scripts & Wrappers",
)

이 문서는 반복적인 작업을 줄이고 터미널 생산성을 높이기 위해 작성된 실용적인 셸 스크립트 도구 모음입니다. 대부분의 스크립트는 macOS와 Linux에서 작동하며, 기존 도구의 번거로움을 해결하는 데 집중합니다.

= 1. 클립보드 관리 (Clipboard)

- `copy`: 표준 출력을 시스템 클립보드로 복사합니다. (`pbcopy` 또는 `xclip` 기반)
  - `ls | copy`
- `pasta`: 클립보드의 텍스트를 출력합니다.
  - `pasta > file.txt`, `vim "$(pasta)"`
- `pastas`: 클립보드 변경을 실시간 감시하며 내용을 출력합니다.
  - `pastas | wget -i -` (복사한 링크들을 즉시 다운로드)
- `cpwd`: 현재 디렉토리의 전체 경로를 클립보드에 복사합니다.

= 2. 파일 및 디렉토리 관리 (File Management)

- `mkcd <dir>`: 디렉토리를 생성하고 즉시 이동합니다. (`mkdir && cd`)
- `tempe`: 임시 디렉토리를 생성하고 이동합니다. (샌드박스 작업용)
  - `tempe; wget <url>; tar -xf <file>`
- `trash <file>`: 파일을 삭제하는 대신 휴지통으로 안전하게 이동합니다.
- `mksh <name>`: 새 셸 스크립트 파일을 생성, 실행 권한 부여 후 에디터로 엽니다.

= 3. 인터넷 및 네트워크 (Internet)

- `serveit`: 현재 디렉토리에서 즉시 정적 파일 서버를 구동합니다.
- `getsong <url>`: `yt-dlp`를 사용하여 최고 음질의 음원을 다운로드합니다.
- `getpod <url>`: 영상을 팟캐스트용 오디오 형식으로 다운로드합니다.
- `getsubs <url>`: 자막을 추출합니다 (영문 우선, 자동 자막 폴백).
  - `getsubs <url> | ollama run llama3.2 "요약해줘"`
- `wifi [off|on|toggle]`: 시스템 WiFi를 제어합니다.
- `url <string>`: URL을 파싱하여 호스트, 경로, 쿼리 등을 분리해 보여줍니다.

= 4. 텍스트 처리 (Text Processing)

- `scratch`: 임시 텍스트 버퍼를 에디터(Vim 등)에서 빠르게 엽니다.
- `straightquote`: 스마트 인용부호(“ ”)를 일반 직선 인용부호(" ")로 변환합니다.
- `markdownquote`: 입력의 각 줄 앞에 `>`를 붙여 마크다운 인용문을 만듭니다.
- `jsonformat`: JSON 데이터를 보기 좋게 정렬(Pretty-print)합니다.
- `uppered` / `lowered`: 문자열을 대문자/소문자로 변환합니다.
- `nato <text>`: 텍스트를 NATO 알파벳(Alpha, Bravo...) 코드로 변환합니다.
- `u+ <hex>`: 유니코드 문자의 이름과 기호를 조회합니다.
- `snippets <key>`: 개인 스니펫 사전에서 상용구를 불러옵니다.

= 5. REPL 런처 (REPL Launchers)

다양한 언어의 인터랙티브 셸을 빠르게 실행합니다.
- `iclj`: Clojure / `ijs`: Deno/Node / `iphp`: PHP / `ipy`: Python / `isql`: SQLite

= 6. 프로세스 및 시스템 (Process & System)

- `running <keyword>`: 특정 키워드가 포함된 실행 중인 프로세스를 검색합니다.
- `murder <id>`: 프로세스를 점진적으로(안전하게) 종료합니다.
- `waitfor <pid>`: 특정 프로세스가 종료될 때까지 대기합니다.
- `bb <cmd>`: 명령어를 완전한 백그라운드 모드(데몬)로 실행합니다.
- `tryna <cmd>`: 명령어가 성공할 때까지 반복 실행합니다.
- `prettypath`: `$PATH` 환경 변수를 한 줄씩 보기 좋게 출력합니다.

= 7. 미디어 및 기타 (Media & Misc)

- `ocr <file>`: 이미지 파일에서 텍스트를 추출합니다.
- `boop`: 직전 명령의 성공/실패 여부를 소리로 알립니다.
- `timer <time>`: 타이머를 설정하고 완료 시 알림을 보냅니다.
- `tunes` / `pix`: `mpv`를 사용해 오디오를 재생하거나 사진을 봅니다.
- `shrinkvid`: `ffmpeg`를 사용해 영상 파일 용량을 압축합니다.
- `emoji <key>`: 키워드로 이모지를 검색합니다.
- `uuid`: 버전 4 UUID를 생성합니다.
- `notify <msg>`: 시스템 OS 알림을 전송합니다.

= 8. 현대적인 셸 유틸리티 (Modern Tools)

표준 도구를 대체하거나 기능을 확장하는 강력한 도구들입니다.
- `tldr <cmd>`: `man` 페이지보다 간결한 실전 예제 중심의 도움말을 보여줍니다.
- `fd <pattern>`: `find`보다 빠르고 직관적인 파일 검색 도구입니다. (정규식 지원)
- `rg <pattern>`: `grep`보다 훨씬 빠른 코드/텍스트 검색 도구입니다. (ripgrep)
- `fzf`: 범용 퍼지 파인더. 명령 이력(`Ctrl+R`)이나 파일 검색 시 시각적으로 결과를 선택하게 해줍니다.
- `z` / `j` (autojump): 자주 방문하는 디렉토리로 키워드만 사용하여 즉시 이동합니다.
  - `z project` -> `/home/user/workspace/very/long/path/project`로 이동
- `tree`: 디렉토리 구조를 트리 형태로 시각화합니다.
- `nnn` / `ranger`: 터미널 기반의 강력한 파일 관리자입니다.
