#import "../templates/conf.typ": *

#show: template.with(
  title: "OpenCode 치트시트 (v1.14)",
  header: [Last updated: 2026-08-25],
  footer: "OpenCode Cheat Sheet (opencode.ai)",
)

= 설치 및 CLI

== 설치
- `curl -fsSL https://opencode.ai/install | bash`: 설치
- `npm i -g opencode-ai`: npm으로 설치
- `brew install sst/tap/opencode`: macOS

== CLI 명령어
- `opencode`: 현재 디렉터리에서 대화형 TUI 시작
- `opencode run "프롬프트"`: 원샷 실행 (`-c` 이어하기, `-m provider/model`, `--format json`)
- `opencode serve`: 헤드리스 HTTP 서버 (`--port`, `--hostname`, `--mdns`)
- `opencode attach <url>`: 실행 중인 서버에 연결
- `opencode acp`: IDE(Zed 등)용 ACP 서버
- `opencode auth login`: 프로바이더 자격증명 추가
- `opencode agent list`: 에이전트 목록
- `opencode github run`: GitHub 에이전트 워크플로
- `opencode upgrade`: 자동 업데이트

= 키보드 단축키

리더 키(Leader key) = `Ctrl + X`

== 앱 제어
- `Ctrl + C` / `Ctrl + D` / `<L>q`: 종료
- `Ctrl + P`: 커맨드 팔레트
- `<L>t`: 테마 전환
- `<L>b`: 사이드바 전환
- `<L>s`: 상태 표시
- `<L>e`: 외부 편집기(`$EDITOR`)
- `Escape`: 실행 중인 도구 호출 중단

== 세션
- `<L>n`: 새 세션
- `<L>l`: 세션 목록
- `<L>g`: 세션 타임라인/히스토리
- `<L>x`: 세션 내보내기
- `<L>c`: 컨텍스트 압축
- `<L>u` / `<L>r`: 메시지 실행 취소 / 다시 실행
- `<L>y`: 마지막 메시지 복사
- `<L>Left`/`Right`/`Up`: 하위 / 상위 세션

== 모델 및 에이전트
- `<L>m`: 모델 선택기
- `F2` / `Shift+F2`: 최근 모델 다음 / 이전
- `Ctrl + T`: 모델 변형(variant) 순환
- `<L>a`: 에이전트 선택기
- `Tab` / `Shift+Tab`: 에이전트 순환 (build ↔ plan)

== 입력 및 스크롤
- `Enter`: 제출
- `Shift+Enter` / `Alt+Enter` / `Ctrl+Enter`: 줄바꿈
- `@파일`: 프롬프트에 파일 퍼지 참조
- `!명령어`: 셸 명령 인라인 실행
- `PageUp/PageDown`, `Home/End`: 스크롤
- `Ctrl + G` / `Ctrl + Alt + G`: 맨 위 / 맨 아래

= 슬래시 명령어 (Slash Commands)

== 세션
- `/new`: 새 세션
- `/sessions`: 저장된 세션 전환
- `/compact` (`/summarize`): 컨텍스트 압축
- `/undo` / `/redo`: 메시지+파일 변경 되돌리기/복구 (Git 필요)
- `/share` / `/unshare`: 세션 공유 링크
- `/export`: Markdown으로 저장
- `/clear`: 화면 지우기
- `/exit` (`/quit`): 종료

== 설정
- `/connect`: 프로바이더/API 키 추가
- `/init`: AGENTS.md 생성
- `/models`: 모델/프로바이더 선택
- `/editor`: `$EDITOR`에서 프롬프트 작성
- `/themes`: 테마 선택
- `/help`: 명령어 목록

= 설정 (Configuration)

== 파일 위치
- `~/.config/opencode/opencode.json`: 전역 설정
- `.opencode/opencode.json` (또는 `opencode.json`): 프로젝트 설정
- `AGENTS.md`: 프로젝트 규칙/메모리 (`/init`)
- `.opencode/commands/*.md`: 프로젝트 커스텀 슬래시 명령
- `~/.config/opencode/commands/*.md`: 전역 커스텀 명령
- `.opencode/agent/*.md`: 커스텀 서브에이전트
- `tui.json`: 키바인드/테마/스크롤 설정

== 커스텀 명령 예시
```markdown
---
description: 구현 없이 계획만 수립
agent: plan
subtask: true
---
다음에 대한 단계별 계획 수립: $ARGUMENTS
```
- 같은 이름의 커스텀 명령은 빌트인을 덮어씀
- Frontmatter: `description`, `agent`, `model`, `subtask`

== 에이전트 및 권한
- 빌트인 에이전트: *build*(편집 허용), *plan*(읽기 전용)
- `opencode.json`의 permissions: `edit`, `bash` (allow/ask/deny 패턴)
- MCP 서버는 `opencode.json`의 `mcp` 키로 설정

= 워크플로 팁
- 첫 방문: `/connect` → `/init` → `/models`
- `@경로/파일.ts`: git 인식 퍼지 파일 첨부, 별칭(alias) 지원
- `/undo`는 Git 저장소 필요
- API 키는 `opencode auth login`으로 관리
- 외부 편집기: `EDITOR=nvim` 또는 `"code --wait"` 설정
