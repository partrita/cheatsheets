#import "../templates/conf.typ": *

#show: template.with(
  title: "Warp 터미널 단축키 치트시트",
  header: [#datetime.today().display()],
  footer: "가이드: 생산성을 높여주는 Warp 필수 단축키",
)

= 1. 기본 탐색 및 텍스트 편집

== 커서 이동
- *줄의 시작으로 이동*
  - macOS: `Cmd + ←` 또는 `Ctrl + A`
  - Windows/Linux: `Home` 또는 `Ctrl + A`
- *줄의 끝으로 이동*
  - macOS: `Cmd + →` 또는 `Ctrl + E`
  - Windows/Linux: `End` 또는 `Ctrl + E`
- *단어 단위 이동 (왼쪽/오른쪽)*
  - macOS: `Option + ← / →`
  - Windows/Linux: `Ctrl + ← / →`
- *한 글자 단위 이동*
  - 모든 OS: `Ctrl + F` (오른쪽), `Ctrl + B` (왼쪽)

== 텍스트 편집 및 삭제
- *커서부터 줄 끝까지 삭제*: `Ctrl + K`
- *커서부터 줄 시작까지 삭제*: `Ctrl + U`
- *이전 단어 삭제*: `Ctrl + W`
- *다음 단어 삭제*
  - macOS: `Option + D`
  - Windows/Linux: `Ctrl + D`
- *최근 삭제한 텍스트 붙여넣기 (Yank)*: `Ctrl + Y`
- *인접한 두 문자 위치 바꾸기*: `Ctrl + T`

== 명령어 히스토리
- *히스토리 검색*: `Ctrl + R` (역방향), `Ctrl + S` (정방향)
- *이전/다음 명령어 불러오기*: `↑ / ↓` 또는 `Ctrl + P / N`

= 2. Warp 핵심 기능

== 블록(Block) 기반 관리
Warp는 명령어와 출력을 하나의 '블록' 단위로 취급합니다.
- *이전/다음 블록으로 이동*
  - macOS: `Cmd + ↑ / ↓`
  - Windows/Linux: `Ctrl + Shift + ↑ / ↓`
- *블록 선택 영역 확장*
  - macOS: `Cmd + Shift + ↑ / ↓`
  - Windows/Linux: `Ctrl + Alt + ↑ / ↓`
- *특정 번호 블록으로 바로 이동*
  - macOS: `Cmd + G`
  - Windows/Linux: `Ctrl + G`
- *현재 선택된 블록 삭제*
  - macOS: `Cmd + D`
  - Windows/Linux: `Ctrl + D`

== 명령어 팔레트 및 설정
- *명령어 팔레트 열기*:
  - macOS: `Cmd + P`
  - Windows/Linux: `Ctrl + Shift + P`
- *빠른 명령어 검색 (Workflow)*:
  - macOS: `Cmd + K`
  - Windows/Linux: `Ctrl + K`
- *설정 메뉴 열기*:
  - macOS: `Cmd + ,`
  - Windows/Linux: `Ctrl + ,`

== AI 어시스턴트 및 자동완성
- *자동완성 제안*: `Tab` (수락), `Shift + Tab` (거절)
- *AI 어시스턴트 패널 열기*:
  - macOS: `Cmd + I`
  - Windows/Linux: `Ctrl + I`
- *AI 명령어 생성 제안*:
  - macOS: `Cmd + J`
  - Windows/Linux: `Ctrl + J`
- *AI에게 현재 명령어 설명 요청*: `Ctrl + X + A`

= 3. 터미널 및 윈도우 관리

== 탭(Tab) 관리
- *새 탭 열기*: `Cmd + T` (macOS), `Ctrl + Shift + T` (Win/Linux)
- *현재 탭 닫기*: `Cmd + W` (macOS), `Ctrl + Shift + W` (Win/Linux)
- *방금 닫은 탭 다시 열기*: `Cmd + Shift + T` (macOS), `Ctrl + Shift + Y` (Win/Linux)
- *특정 번호 탭으로 이동*: `Cmd + 1-9` (macOS), `Ctrl + 1-9` (Win/Linux)
- *이전/다음 탭 전환*: `Cmd + Option + ←/→` 또는 `Ctrl + PageUp/PageDown`

== 패널(Pane) 분할 및 이동
- *수직 분할*: `Cmd + D` (macOS), `Ctrl + Shift + D` (Win/Linux)
- *수평 분할*: `Cmd + Shift + D` (macOS), `Ctrl + Shift + H` (Win/Linux)
- *패널 간 커서 이동*: `Cmd + Option + 화살표` (macOS), `Ctrl + Alt + 화살표` (Win/Linux)
- *현재 패널 닫기*: `Cmd + Shift + W` (macOS), `Ctrl + Shift + Q` (Win/Linux)

== 윈도우 제어
- *새 윈도우 생성*: `Cmd + N` (macOS), `Ctrl + Shift + N` (Win/Linux)
- *비공개(Incognito) 윈도우 열기*: `Cmd + Shift + N` (macOS), `Ctrl + Shift + P` (Win/Linux)
- *폰트 크기 조절*: `Cmd + +/-/0` (macOS), `Ctrl + +/-/0` (Win/Linux)

= 4. 검색 및 결과 필터링

== 텍스트 검색
- *현재 페이지에서 찾기*: `Cmd + F` (macOS), `Ctrl + F` (Win/Linux)
- *다음/이전 검색 결과로 이동*: `Cmd + G` / `Cmd + Shift + G` (macOS)
- *검색창 닫기*: `Escape`

== 블록 필터링
- *블록 필터링 활성화*: `Cmd + Shift + F` (macOS), `Ctrl + Shift + F` (Win/Linux)
- *오류 발생 블록만 보기*: `Cmd + Shift + E` (macOS), `Ctrl + Shift + E` (Win/Linux)
- *필터링 해제*: `Cmd + Shift + C` (macOS), `Ctrl + Shift + C` (Win/Linux)

= 5. 복사 및 출력 관리

- *선택 영역 복사 / 붙여넣기*: `Cmd + C / V` (macOS), `Ctrl + C / V` (Win/Linux)
- *블록 전체 내용 복사*: `Cmd + Shift + C` (macOS), `Ctrl + Shift + C` (Win/Linux)
- *서식 없이 붙여넣기*: `Cmd + Shift + V` (macOS), `Ctrl + Shift + V` (Win/Linux)
- *명령어 구문만 복사*: `Cmd + Option + C` (macOS), `Ctrl + Alt + C` (Win/Linux)
- *화면 지우기*: `Cmd + L` (macOS), `Ctrl + L` (Win/Linux)
- *현재 블록 다시 실행*: `Cmd + Shift + R` (macOS), `Ctrl + Shift + R` (Win/Linux)

= 6. 고급 기능 및 시스템 통합

- *개발자 도구 / JS 콘솔*: `Cmd + Option + I` / `Cmd + Shift + J` (macOS)
- *세션 내용 내보내기 (Export)*: `Cmd + E` (macOS), `Ctrl + E` (Win/Linux)
- *파일 탐색기에서 현재 경로 열기*: `Cmd + Option + O` (macOS), `Ctrl + Alt + O` (Win/Linux)
- *VS Code에서 현재 경로 열기*: `Cmd + Option + R` (macOS), `Ctrl + Alt + R` (Win/Linux)

= 7. 실행 중인 프로세스 제어 (공통)

- *강제 종료 (SIGINT)*: `Ctrl + C`
- *일시 정지 (SIGTSTP)*: `Ctrl + Z`
- *입력 종료 (EOF)*: `Ctrl + D`
- *프로세스 덤프 및 종료 (SIGQUIT)*: `Ctrl + \`
- *출력 일시 정지 / 재개*: `Ctrl + S / Q`
