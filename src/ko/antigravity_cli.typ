#import "../templates/conf.typ": *

#show: template.with(
  title: "Antigravity CLI 치트시트 (v1.1)",
  header: [Last updated: 2026-08-25],
  footer: "Antigravity CLI Cheat Sheet (antigravity.google/docs/cli)",
)

= 개요 및 설치

구글의 터미널 AI 코딩 에이전트 — Gemini CLI의 후속작
(2026-06-18 서비스 종료). 명령어 이름: `agy`.

== 설치
- `curl -fsSL https://antigravity.google/cli/install.sh | bash`: macOS/Linux (~/.local/bin/agy)
- `irm https://antigravity.google/cli/install.ps1 | iex`: Windows
- `agy install`: 설치 후 PATH 및 셸 구성

== CLI 명령어
- `agy`: 대화형 TUI 시작
- `agy -p "프롬프트"`: 비대화형 print 모드 (CI/스크립트)
- `agy models`: 지원 모델 목록
- `agy agents`: 커스텀 에이전트 목록
- `agy plugin import gemini`: Gemini CLI 확장 마이그레이션
- `agy plugin disable <이름>`: 플러그인 비활성화
- `agy changelog`: 릴리스 노트

== 주요 플래그
- `--model <slug>` / `--effort <level>`: 모델 및 추론 강도
- `--mode default|accept-edits|plan`: 실행 모드
- `--agent <이름>`: 커스텀 에이전트로 시작
- `--project <p>` / `--new-project <n>`: 프로젝트 선택
- `--sandbox`: 세션 샌드박싱 활성화
- `--output-format text|json|stream-json`: 구조화 출력
- `--json-schema <schema>`: 출력 스키마 검증
- `--disable-slash-commands`: 슬래시 입력을 일반 텍스트로 처리

= 키보드 단축키
- `Enter`: 프롬프트 제출
- `Shift+Enter` / `Ctrl+J` / `Alt+Enter`: 줄바꿈
- `Tab`: 슬래시 명령 자동완성 확정
- `Shift + Tab`: 실행 모드 순환 (default → accept-edits → plan)
- `Esc`: 패널 닫기 / 스트림 중단 / 빈 프롬프트 지우기
- `Ctrl + C`: 에이전트 작업 취소(1회), CLI 종료(2회)
- `f`: diff 미리보기에서 개별 변경 수락/거절
- `ctrl+k`: 도구 즉시 승인
- `?`: 도움말 개요
- Vim 모드: settings.json에서 `editorMode: "vim"` (v1.1.11)

= 슬래시 명령어 (Slash Commands)

== 대화
- `/resume` (`/switch`): 세션 재개/전환
- `/rewind` (`/undo`): 체크포인트로 롤백
- `/rename <이름>`: 대화 이름 변경
- `/diff`: 대화형 diff 뷰어
- `/tasks`: 백그라운드 작업 모니터링/종료

== 설정 및 계정
- `/permissions`: 자율성 수준 (request-review / always-proceed / strict)
- `/model`: 모델 선택 (세션 간 유지)
- `/effort`: 추론 강도 수준
- `/settings`: 설정 패널 (+ Agent Mode 기본값)
- `/keybindings`: 단축키 편집기
- `/statusline` / `/title`: 상태 바 / 터미널 제목
- `/credits`: 남은 AI 크레딧 및 사용량
- `/logout` / `/exit`: 로그아웃 / 종료

== 도구
- `/agents`: 에이전트 상태 패널
- `/mcp`: MCP 서버 관리
- `/skills`: 로컬 및 전역 워크플로 탐색
- `/codesearch` (`/cs`): 워크스페이스 정규식 코드 검색
- `/open <경로>`: 외부 편집기에서 파일 열기

= 권한 프리셋
- *request-review* (기본): 파일 쓰기 전 diff 미리보기
- *proceed-in-sandbox*: 샌드박스 내 자동 진행
- *always-proceed*: 프롬프트 없음 (신뢰된 워크스페이스 전용)
- *strict*: 모든 비읽기 도구에 프롬프트 표시

= 설정 및 경로
- `~/.gemini/antigravity-cli/settings.json`: 메인 설정
- 주요 키: `altScreenMode`, `editor`, `editorMode`, `notifications`, `showTips`, `runningLightSpeed`
- 세분화된 권한: settings.json에서 허용/차단 명령 목록 정의
- `keybindings.json`: 커스텀 단축키 (삭제하면 기본값 복원)
- `AGY_CLI_CMD_OUTPUT_PERCENTAGE`: TUI 명령 출력 제한
- 규칙은 AGENTS.md / GEMINI.md로 관리

= Gemini CLI에서 마이그레이션
- 설정 위치: `~/.gemini/antigravity-cli/`
- `agy plugin import gemini`로 확장 마이그레이션
- 기존 `/commands` → *skills*로 변환 필요
- 프롬프트 하나에 여러 선행 슬래시 명령 중첩 가능 (v1.1.4)
