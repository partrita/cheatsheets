#import "../templates/conf.typ": *

#show: template.with(
  title: "Hermes Agent 치트시트 (v0.20)",
  header: [Last updated: 2026-08-25],
  footer: "Hermes Agent Cheat Sheet (hermes-agent.nousresearch.com)",
)

= 설치 및 CLI

== 설치
- `curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash`: Linux/macOS/WSL2/Termux
- `iex (irm https://hermes-agent.nousresearch.com/install.ps1)`: Windows PowerShell
- `hermes setup --portal`: 초기 설정 (Nous Portal)

== CLI 명령어
- `hermes`: 대화형 CLI 세션 시작
- `hermes --tui`: 전체 화면 TUI (오버레이, 마우스 지원)
- `hermes chat -q "질문"`: 단발성 비대화형 질의
- `hermes chat --query-file p.txt`: 파일/stdin에서 질의 (그대로 전달)
- `hermes -w`: 워크트리 모드 (격리된 Git worktree)
- `hermes --continue` / `--resume <id>`: 세션 재개
- `hermes -in <dir>`: 시작/재개 전 디렉터리 이동
- `hermes model`: 대화형 모델 선택기
- `hermes config set model.default <모델>`: 모델 직접 지정
- `hermes sessions list`: 저장된 세션 목록
- `hermes dashboard`: 로컬 브라우저 UI
- `hermes backup` / `hermes debug share`: 백업 / 디버그 리포트
- `hermes update`: 업데이트

= 게이트웨이 및 메시징

- `hermes gateway setup`: 플랫폼 대화형 설정
- `hermes gateway run`: 포그라운드 서비스
- `hermes gateway install/start/stop/restart`: 백그라운드 서비스
- Telegram, Discord, Slack, WhatsApp, iMessage 등 28+ 플랫폼
- Cron 작업: 모델/작업 디렉터리 오버라이드가 가능한 예약 작업

= 키보드 단축키
- `Ctrl + P`: 퍼지 커맨드 팔레트 (`/palette` 동일)
- `Ctrl + S`: 작성 중이던 프롬프트 임시 저장(stash)
- `Shift + Enter`: 줄바꿈 (멀티라인 입력)
- `!명령어`: 즉시 셸 모드
- `Esc`: 진행 중 턴 중단 후 방향 전환
- Busy input 모드: 에이전트 작업 중에도 입력 가능

= 슬래시 명령어 (Slash Commands)

== 세션
- `/new`: 새 세션
- `/resume`: 세션 재개
- `/compress`: 대화 컨텍스트 압축
- `/context`: 컨텍스트 사용량 확인
- `/diff`: 변경 사항 검토
- `/focus`: 포커스 모드
- `/export`: 대화 내보내기

== 모델 및 계정
- `/model`: 즉시 모델 전환 (재시작 불필요)
- `/usage`: 토큰/비용 분석 + 계정 한도
- `/topup`: Nous 잔액/결제 (기존 /credits 대체)
- `/subscription` (`/upgrade`): Nous 플랜 관리
- `/insights`: 사용량 분석 (최근 30일)

== 도구 및 스킬
- `/init`: 프로젝트 지침 초기화
- `/skills`: 스킬 탐색
- `/learn`: 워크플로를 재사용 가능한 스킬로 저장
- `/approvals`: 도구 승인 관리
- `/background <작업>`: 백그라운드 작업 실행 (`bg_<id>`)
- `/moa`: 멀티 에이전트 오케스트레이션
- `/journey`: 저니 모드
- `/wake` / `/whoami` / `/version` / `/palette` / `/update`

= 설정 (Configuration)

== 파일 위치
- `~/.hermes/`: 모든 상태, 설정, 스킬, 세션
- `config.yaml`: 메인 설정

== config.yaml 주요 섹션
- `model`: `default`, `provider`, `base_url`, `api_key`, `context_length`
- `agent.max_turns`: 턴당 도구 호출 반복 한도 (기본 500)
- `terminal.backend`: local / docker / ssh / modal
- `compression`: threshold / target_ratio
- `delegation`: model, max_iterations
- `security.tirith_enabled`: 안전 가드레일
- 프로바이더: OpenRouter, Anthropic, OpenAI, DeepSeek, Gemini, xAI, Kimi 등 20+

= 위임 및 서브에이전트
- `delegate_task(goal, context, toolsets)`: 동기 서브에이전트 (L1)
- 최대 3개 동시 병렬 배치 실행
- 독립 프로세스: `hermes chat -q "..."` 실행 후 잊기(fire-and-forget)
- tmux 멀티 에이전트: 에이전트별 `tmux new-session -d 'hermes -w'`
- 위임 스킬로 Claude Code, Codex, OpenCode, Antigravity CLI에 작업 인계

= 워크플로 팁
- `-w` 워크트리 플래그로 병렬 에이전트 간 머지 충돌 방지
- `/learn`으로 스킬화; 시작 시 로드하거나 슬래시 명령으로 호출
- Personalities: 전환 가능한 에이전트 페르소나
- v0.19부터 추론 스트리밍 기본 활성화, 첫 토큰 시간 ~80% 단축
