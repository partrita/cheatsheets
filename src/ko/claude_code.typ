#import "../templates/conf.typ": *

#show: template.with(
  title: "Claude Code 치트시트 (v2.1.116)",
  header: [Last updated: 2026-04-20],
  footer: "Claude Code Cheat Sheet (cc.storyfox.cz)",
)

= 키보드 단축키 (Keyboard Shortcuts)

== 일반 제어
- `Ctrl + C`: 입력/생성 취소
- `Ctrl + D`: 세션 종료
- `Ctrl + L`: 입력 지우기 + 화면 강제 리프레시
- `Ctrl + O`: 대화 기록 뷰어 전환 (상세 출력)
- `Ctrl + U`: 입력 버퍼 전체 지우기
- `Ctrl + Y`: 지워진 입력 버퍼 복구
- `Ctrl + R`: 히스토리 역검색
- `Ctrl + G`: 편집기에서 열기 (Ctrl+X Ctrl+E 동일)
- `Ctrl + B`: 백그라운드 작업 실행
- `Ctrl + T`: 작업 목록 전환
- `Ctrl + V`: 이미지 붙여넣기
- `Ctrl + X Ctrl + K`: 모든 백그라운드 에이전트 종료 (2회 확인)
- `Esc Esc`: 되돌리기(Rewind) 또는 요약
- `Esc`: 일반 취소/되돌리기

== 모드 전환 및 입력
- `Shift + Tab`: 권한 모드 순환 (Default → Accept Edits → Plan → ...)
- `Alt + P`: 모델 전환
- `Alt + T`: 확장 사고(Thinking) 모드 전환
- `Alt + O`: 빠른 모드(Fast Mode) 전환
- `\ + Enter`: 줄바꿈 (Newline)
- `Ctrl + J`: 제어 시퀀스 줄바꿈

= 슬래시 명령어 (Slash Commands)

== 세션 및 파일
- `/clear`: 대화 내용 지우기
- `/compact [focus]`: 컨텍스트 압축 및 최적화
- `/branch [name]`: 새 브랜치 생성 (/fork 동일)
- `/cost`: 토큰 사용량 확인 (모델별 + 캐시)
- `/context`: 컨텍스트 시각화 (그리드)
- `/diff`: 대화형 Diff 뷰어
- `/copy [N]`: 마지막(또는 N번째) 응답 복사
- `/recap`: 세션 복귀 시 컨텍스트 요약
- `/undo` / `/rewind`: 이전 체크포인트로 되돌리기
- `/export`: 대화 내보내기
- `/resume [session]`: 세션 ID/이름으로 재개
- `/focus`: 포커스 뷰 전환 (전체화면 전용)

== 설정 및 도구
- `/config`: 설정 관리
- `/model [model]`: 모델 선택 및 노력 수준 조절
- `/fast [on|off]`: 빠른 모드 전환
- `/theme`: 테마 변경 (Auto/Terminal 매칭 지원)
- `/permissions`: 권한 조회 및 업데이트
- `/effort [level]`: 수준 설정 (low/med/high/xhigh/max)
- `/color [color]`: 프롬프트 바 색상 설정
- `/keybindings`: 단축키 커스텀
- `/terminal-setup`: 터미널 키바인딩 설정
- `/init`: CLAUDE.md 생성
- `/memory`: 메모리 편집 및 자동 메모리 토글
- `/mcp`: MCP 서버 관리 UI
- `/hooks`: 후크(Hooks) 관리
- `/skills`: 사용 가능한 스킬 목록
- `/agents`: 에이전트 구성 관리
- `/reload-plugins`: 플러그인 다시 로드
- `/add-dir <path>`: 작업 디렉토리 추가

== 특수 명령 및 리뷰
- `/plan [desc]`: 계획 모드 즉시 진입
- `/review [PR]`: 로컬 PR 리뷰
- `/ultrareview [PR#]`: 클라우드 기반 병렬 다중 에이전트 리뷰
- `/simplify [focus]`: 코드 리뷰 및 수정 (3개 에이전트)
- `/security-review`: 취약점 스캔
- `/less-permission-prompts`: 화이트리스트 추가로 프롬프트 감소
- `/loop [interval] [prompt]`: 반복 작업 (/proactive 동일)
- `/voice`: 음성 입력 활성화
- `/doctor`: 문제 진단 및 해결
- `/rc` / `/remote-control`: 원격 제어 모드
- `/desktop`: 데스크톱 앱에서 계속하기
- `/rename [name]`: 세션 이름 변경
- `/btw <question>`: 컨텍스트 비용 없이 사이드 질문
- `/insights`: 세션 보고서 분석

= MCP 및 에이전트 관리

== MCP 서버 관리
- `--transport http`: 원격 HTTP 서버 (권한 필요)
- `--transport stdio`: 로컬 프로세스 서버
- `--transport sse`: 원격 SSE 서버
- `claude mcp list`: 전체 서버 목록 확인
- `claude mcp serve`: Claude Code를 MCP 서버로 실행

== 스코프 및 설정
- 로컬: `~/.claude.json`
- 프로젝트: `project.mcp.json`
- 사용자: `~/.claude.json`

== 에이전트 및 스킬
- *내장 에이전트*: Explore, Plan, General, Bash
- *프론트매터*: `permissionMode`, `isolation`, `memory`, `background`, `maxTurns`
- *스킬 위치*: `.claude/skills/` (프로젝트), `~/.claude/skills/` (개인)

= 메모리 및 파일 구조

== CLAUDE.md 위치
- `./CLAUDE.md`: 프로젝트 공통 (팀 공유)
- `./CLAUDE.local.md`: 로컬 개인용 (gitignored)
- `~/.claude/CLAUDE.md`: 사용자 전역 (모든 프로젝트)
- `/etc/claude-code/CLAUDE.md`: 조직 정책 (관리자용)

== 규칙 및 임포트
- `.claude/rules/*.md`: 프로젝트 규칙
- `~/.claude/rules/*.md`: 사용자 전역 규칙
- `paths: frontmatter`: 경로별 규칙 적용
- `@path/to/file`: CLAUDE.md 내 파일 임포트

== 자동 메모리
- `~/.claude/projects/<id>/memory/` 내 `MEMORY.md` 및 주제별 파일 자동 로드

= 워크플로 및 팁

- *Thinking & Effort*: `Alt + T` 토글, "ultrathink" 한 턴 최대 노력, `xhigh` 수준 추가 (high와 max 사이)
- *Auto Mode*: Max 구독자(Opus 4.7)는 `--enable-auto-mode` 없이 상시 사용 가능
- *Git Worktrees*: `--worktree`로 분리된 작업 환경, `isolation: worktree` 에이전트 전용 트리
- *Context 관리*: `/compact`로 최적화 (1M 지원, Opus 4.6 이상), `CLAUDE.md`는 압축 제외
- *Voice Mode*: `/voice` 활성화 후 스페이스바 홀드로 녹음 및 전송 (20개 언어 지원)
- *SendMessage*: 에이전트 자동 재개 기능 추가 (기존 resume 대체)

= CLI 및 환경 설정

== 주요 환경 변수
- `ANTHROPIC_API_KEY`, `ANTHROPIC_MODEL`
- `ANTHROPIC_BASE_URL`: 프록시/게이트웨이 오버라이드
- `ANTHROPIC_BETAS`: 추가 베타 헤더
- `MAX_THINKING_TOKENS`: 사고 토큰 제한 (0=끄기)
- `ENABLE_PROMPT_CACHING_1H`: 1시간 캐시 TTL 옵트인
- `FORCE_PROMPT_CACHING_5M`: 5분 캐시 TTL 강제
- `CLAUDE_CODE_ENABLE_AWAY_SUMMARY`: 텔레메트리 비활성 시 recap 강제
- `CLAUDECODE`: CC 쉘 감지 (=1)
- `API_TIMEOUT_MS`: API 타임아웃 (기본 600s)
- `CLAUDE_CODE_DISABLE_CRON`: 예약 작업 비활성화

== CLI 명령 및 플래그
- `claude auth login`: 로그인 (--sso, --console)
- `claude update`: 업데이트 확인 및 적용
- `-n / --name`: 세션 이름 지정
- `--allowedTools` / `--disallowedTools`: 도구 허용/차단
- `--dangerously-skip-permissions`: 모든 승인 건너뛰기 ⚠️
- `--system-prompt`: 커스텀 시스템 프롬프트 지정
- `--settings <file>`: 설정 JSON 로드
- `--output-format`: text/json/stream-json
