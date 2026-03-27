#import "./templates/conf.typ": *

#show: template.with(
  title: "Gemini CLI 치트시트",
  header: [#datetime.today().display()],
  footer: "Gemini CLI Cheat Sheet",
)

= 1. 기본 실행 (Basic Usage)

- 대화형 모드 시작: `gemini`
- 초기 프롬프트와 함께 시작: `gemini "안녕, 오늘 날씨 어때?"`
- 비대화형(Headless) 모드: `gemini -p "프로젝트 구조 분석해줘"`
- YOLO 모드 (자동 승인): `gemini -y`
- 특정 모델 지정: `gemini -m "gemini-1.5-pro"`

= 2. 주요 커맨드 라인 옵션

- `-y, --yolo`: 모든 도구 실행을 자동으로 승인합니다.
- `-p, --prompt`: 비대화형 모드로 실행하고 결과를 출력합니다.
- `-i, --prompt-interactive`: 프롬프트 실행 후 대화형 모드를 유지합니다.
- `-r, --resume [session]`: 이전 세션을 재개합니다. (`latest` 또는 인덱스)
- `--list-sessions`: 현재 프로젝트의 세션 목록을 표시합니다.
- `-m, --model <name>`: 사용할 모델을 지정합니다.
- `-d, --debug`: 디버그 모드로 실행합니다. (F12로 디버그 콘솔 열기)
- `-s, --sandbox`: 샌드박스 환경에서 실행합니다.

= 3. 대화 중 명령어 (Slash Commands)

- `/help`: 사용 가능한 명령어와 도움말을 표시합니다.
- `/bug`: 버그를 보고하거나 피드백을 보냅니다.
- `tab`: 쉘 입력 모드로 포커스를 전환합니다 (인터랙티브 도구 사용 시).
- `Ctrl + C`: 현재 실행 중인 작업을 중단합니다.

= 4. 스킬 관리 (Skills)

스킬은 에이전트의 기능을 확장하는 전문화된 가이드입니다.

- 스킬 목록 확인: `gemini skills list`
- 스킬 활성화 (대화 중): `activate_skill(name)` 도구 호출
- 주요 기본 스킬:
  - `find-skills`: 새로운 스킬 검색 및 설치 안내
  - `grammar-checker`: 한국어 문법 및 맞춤법 교정
  - `humanizer`: AI 텍스트를 자연스러운 문체로 변환
  - `style-guide`: 일관된 문서 작성 스타일 유지
  - `simple`: 창의적/설계 작업 전 브레인스토밍 최적화

= 5. 세션 및 관리 (Management)

- 세션 목록 보기: `gemini --list-sessions`
- 세션 삭제: `gemini --delete-session <index>`
- 버전 확인: `gemini --version`
- MCP 서버 관리: `gemini mcp <command>`
- 확장 프로그램 관리: `gemini extensions <command>`

= 6. 주요 활용 팁

- *YOLO 모드 활용*: 반복적이거나 신뢰할 수 있는 작업 시 `-y` 옵션을 사용하여 승인 단계를 건너뛸 수 있습니다.
- *세션 재개*: 작업 도중 중단되었다면 `gemini -r latest`로 마지막 상태를 불러올 수 있습니다.
- *비대화형 파이프라인*: 쉘 스크립트 등에서 `gemini -p "..." > output.md`와 같이 활용 가능합니다.
- *디렉토리 포함*: `--include-directories` 옵션으로 외부 경로를 작업 영역에 추가할 수 있습니다.
