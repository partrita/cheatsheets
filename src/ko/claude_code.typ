#import "../templates/conf.typ": *

#show: template.with(
  title: "Claude Code 치트시트",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "Claude Code CLI Assistant Cheat Sheet",
)

= 개요 및 설치 (Installation & Setup)

Claude Code는 소프트웨어 엔지니어링 작업을 위한 Anthropic의 터미널 기반 AI 어시스턴트입니다.

- *설치*: `npm install -g @anthropics/claude-code`
- *로그인*: `claude auth login` (API 키 및 웹 인증)
- *인증 상태 확인*: `claude auth status`
- *현재 사용자 확인*: `claude auth whoami`
- *로그아웃*: `claude auth logout`

= 빠른 시작 (Quick Start)

- *대화형 세션 시작*: `claude`
- *단일 명령어 실행*: `claude "Python 함수 작성을 도와줘"`
- *이전 세션 재개*: `claude --resume`
- *메모리 활성화 상태로 시작*: `claude --memory`
- *확장 사고(Thinking) 활성화*: `claude --think`
- *이미지 분석*: `claude "스크린샷 분석해줘" --image path/to/image.png`

= 핵심 명령어 (Core Commands)

== 파일 작업 및 리팩토링
- 파일 읽기 및 분석: `claude "read file.py"`
- 파일 수정: `claude "edit file.py"`
- 새 파일 생성: `claude "create file.py"`
- 실패하는 테스트 수정: `claude "fix tests"`
- 코드 리팩토링: `claude "refactor code"`

== Git 통합 작업
- 커밋 생성 및 메시지 작성: `claude "create commit"`
- 풀 리퀘스트(PR) 생성: `claude "create PR"`
- Git 변경 사항 리뷰: `claude "review changes"`
- 머지 충돌(Conflict) 해결 지원: `claude "fix merge conflicts"`

= 키보드 단축키 (Shortcuts)

== 세션 및 입력 제어
- `Ctrl + C`: 현재 입력/생성 취소
- `Ctrl + D`: 세션 종료
- `Ctrl + L`: 화면 지우기 및 리프레시
- `Ctrl + O`: 상세 대화 기록(Transcript) 뷰어 토글
- `Ctrl + U` / `Ctrl + Y`: 입력 버퍼 지우기 / 복구
- `Ctrl + R`: 히스토리 역검색
- `Ctrl + V`: 클립보드 이미지 붙여넣기
- `Ctrl + B`: 백그라운드 작업 실행
- `Shift + Tab`: 권한 모드 순환 (Default → Accept Edits → Plan)
- `Alt + P`: 모델 전환
- `Alt + T`: 확장 사고(Thinking) 모드 토글
- `\ + Enter` / `Ctrl + J`: 줄바꿈

= 슬래시 명령어 (Slash Commands)

== 세션 관리
- `/help`: 도움말 및 사용 가능한 명령어 목록
- `/clear`: 현재 대화 내용 지우기
- `/reset`: 대화 상태 초기화
- `/exit`: 대화형 모드 종료
- `/version`: Claude Code 버전 확인
- `/undo` / `/rewind`: 이전 체크포인트로 되돌리기
- `/compact [focus]`: 컨텍스트 압축 및 최적화
- `/cost`: 토큰 사용량 및 비용 확인

== 설정 및 모델
- `/settings` / `/config`: 설정 패널 열기
- `/model [name]`: AI 모델 변경
- `/memory on` / `/memory off`: 메모리 활성화/비활성화
- `/permissions`: 권한 조회 및 업데이트
- `/init`: `CLAUDE.md` 초기화

== 생산성 및 저장
- `/save`: 대화 저장
- `/load`: 이전 대화 불러오기
- `/export`: 대화 내용을 파일로 내보내기
- `/diff`: 대화형 Diff 뷰어 열기

= 주요 워크플로우 (Workflows)

== 코드 리뷰 (Code Review)
- 특정 파일 버그 검사: `claude "review this code for bugs" file.py`
- Git 변경 사항 전체 검토: `claude "review my git changes"`
- 프로젝트 품질 개선 제안: `claude "suggest improvements" src/`

== 테스트 및 문서화
- 함수 테스트 코드 생성: `claude "write tests for this function"`
- 실패한 테스트 복구: `claude "fix these test failures"`
- 테스트 커버리지 분석: `claude "analyze test coverage"`
- README 생성: `claude "create README for this project"`
- 함수 주석/문서화 추가: `claude "add documentation to this function"`
- API 문서 생성: `claude "generate API docs"`

== 디버깅 및 분석
- 에러 원인 분석: `claude "help debug this error: [에러 메시지]"`
- 성능 병목 분석: `claude "why is this code slow?"`
- 코드 동작 원리 설명: `claude "explain how this works" complex_function.py`

= IDE 통합 및 환경 설정 (IDE & Config)

== VS Code 통합
- 확장 설치: `code --install-extension anthropic.claude-code`
- VS Code에서 실행: `claude --vscode`
- 단축키: `Ctrl+Shift+P` -> `"Claude: Ask"`, `"Claude: Review"`

== 환경 설정 (Configuration)
- 기본 편집기 설정: `claude config set editor code`
- 작업 디렉토리 지정: `claude config set workdir /path/to/project`
- 전체 설정 목록 확인: `claude config list`
- 기본값으로 재설정: `claude config reset`
- 타임아웃 설정: `claude config set timeout 30`

= 전역 옵션 및 문제 해결 (Troubleshooting)

== CLI 전역 옵션
- `--resume`: 이전 세션 이어서 진행
- `--memory` / `--no-memory`: 메모리 활성화/비활성화
- `--think`: 심층 분석 모드 실행
- `--no-color`: 색상 출력 비활성화
- `--verbose`: 상세 로깅 출력
- `--clear-cache`: 캐시 삭제
- `--proxy <url>`: HTTP 프록시 설정 (예: `claude --proxy http://proxy:8080`)

== 자주 발생하는 문제 해결
- *인증 오류*: `claude auth logout && claude auth login`
- *설정 초기화*: `claude config reset`
- *캐시 초기화*: `claude --clear-cache`
- *디버그 모드*: `claude --verbose --debug`
- *메모리 초기화*: `claude "clear memory"`
