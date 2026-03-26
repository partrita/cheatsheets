#import "./templates/conf.typ": *

#show: template.with(
  title: "Pixi 치트시트 ",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 프로젝트 초기화 및 구성

- `pixi init`: 현재 디렉토리 `pixi.toml` 생성 및 프로젝트 초기화.
  - `--conda-channels <channel>`: conda 채널 지정 (예: `conda-forge`).
  - `--platform <p1>`: 지원 플랫폼(OS/Arch) 지정.
- `pixi init --env-file <file>`: 환경 파일 기반 프로젝트 초기화.

= 2. 종속성 관리

- `pixi add <package>`: 프로젝트 의존성 추가.
  - `pixi add "numpy>=1.20"`: 버전 제약 조건 명시 추가.
  - `--platform <p>`: 특정 플랫폼용 의존성 추가.
  - `--build` / `--host`: 빌드/호스트 전용 의존성 추가.
- `pixi remove <package>`: 의존성 제거.
- `pixi list`: 의존성 목록 표시.
- `pixi install`: `pixi.lock` 기반 모든 의존성 설치 및 환경 구성.
- `pixi update`: 제약 조건 내 의존성 최신 업데이트 및 락 파일 갱신.

= 3. 환경 및 작업 실행

- `pixi run <task> [args...]`: 정의된 작업 실행 및 인수 전달.
- `pixi shell`: 프로젝트 환경 활성화 새 셸 시작.
- `pixi task list`: 사용 가능 작업 나열.
- `pixi task add <name> <cmd>`: 새 작업 추가.
- `pixi task remove <name>`: 작업 제거.

= 4. 다중 환경 (Features)

"features"를 통한 다중 환경 관리 지원.

- `pixi.toml` feature 정의:
  ```toml
  [feature.test.dependencies]
  pytest = "*"

  [feature.docs.dependencies]
  mkdocs = "*"
  ```
- Feature 환경 활성화: `pixi shell --env test`
- Feature 환경 작업 실행: `pixi run --env test pytest`


= 5. `pixi.toml` 구조 분석

```toml
[project]
name = "my-project"
version = "0.1.0"
channels = ["conda-forge"]
platforms = ["linux-64", "osx-64", "win-64"]

[tasks]
start = "python main.py"
test = { cmd = "pytest", env = "test" }

[dependencies]
python = ">=3.9"
numpy = ">=1.20"

[feature.test.dependencies]
pytest = "*"
```

= 6. 기타 유용한 명령어

- `pixi info`: 프로젝트 및 시스템 정보 표시.
- `pixi search <package>`: 패키지 검색.
- `pixi self-update`: pixi 자체 최신 업데이트.
- `pixi project channels add <channel>`: 채널 추가.
- `pixi project platforms add <platform>`: 지원 플랫폼 추가.

= Pixi 사용 이점

`conda`의 패키지 관리력과 `pip`의 유연성 결합, 현대적 도구 경험 제공.
- 재현성: `pixi.lock` 기반 모든 플랫폼 동일 환경 재현.
- 속도: 병렬 다운로드 및 고속 리졸버 활용.
- 통합: 의존성/작업/환경 관리 단일 도구 통합.
- 크로스 플랫폼: Win, macOS, Linux 동일 작동 방식 지원.
