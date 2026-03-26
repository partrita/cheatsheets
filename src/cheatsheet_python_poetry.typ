#import "./templates/conf.typ": *

#show: template.with(
  title: "Poetry 치트시트 ",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 프로젝트 초기화 및 관리

- `poetry new <project_name>`: 표준 디렉토리 구조 기반 새 프로젝트 생성.
- `poetry init`: 기존 디렉토리 내 `pyproject.toml` 대화형 생성.
- `poetry check`: `pyproject.toml` 구문 및 의존성 유효성 검사.
- `poetry show`: 프로젝트 모든 의존성 목록 표시.
  - `--tree`: 의존성 트리 시각화.
  - `--outdated`: 구버전 패키지 확인.
- `poetry search <package>`: PyPI 패키지 검색.

= 2. 종속성 관리

- `poetry add <package>`: 의존성 추가 및 `pyproject.toml`, `poetry.lock` 업데이트.
  - `poetry add "pandas@^1.0"`: 버전 제약 조건 명시 추가.
  - `poetry add --group dev <package>`: 개발용 의존성 그룹 추가.
  - `poetry add "git+https://github.com/user/repo.git"`: Git 저장소 직접 추가.
- `poetry remove <package>`: 의존성 제거.
- `poetry install`: `poetry.lock` 기반 의존성 설치. 락 파일 없을 시 의존성 해결 후 생성.
  - `--no-dev`: 기본 의존성만 설치 (배포용).
  - `--with <group>`: 특정 의존성 그룹 포함 설치.
  - `--sync`: 환경을 락 파일과 완전 일치화 (불필요 패키지 삭제).
- `poetry update`: 버전 제약 내 최신 업데이트 및 락 파일 갱신.
- `poetry lock`: 의존성 해결 및 락 파일 생성/업데이트 (설치 미수행).

= 3. 가상 환경 및 실행

- `poetry run <command>`: 가상 환경 내 명령어 실행.
- `poetry shell`: 가상 환경 활성화 셸 시작.
- `poetry config virtualenvs.in-project true`: 프로젝트 내 `.venv` 생성 전역 설정.
- `poetry config --local virtualenvs.in-project true`: 현재 프로젝트 적용 설정.
- `poetry env info`: 가상 환경 정보(경로, Python 버전 등) 표시.
- `poetry env list`: 프로젝트 관련 가상 환경 목록 표시.
- `poetry env use <python>`: 사용할 Python 버전 변경.
- `poetry env remove <python>`: 특정 가상 환경 삭제.



= 4. 빌드 및 배포

- `poetry build`: 소스 배포판 및 휠 빌드 (`dist/` 생성).
- `poetry publish`: 빌드 패키지 게시.
  - `--build`: 게시 전 빌드 수행.
  - `--repository <name>`: 특정 저장소 게시.
- `poetry config repositories.<name> <url>`: 외부 패키지 저장소 설정.

= 5. `pyproject.toml` 구조

```toml
[tool.poetry]
name = "my-awesome-project"
version = "0.1.0"
description = "Project description"
authors = ["Your Name <you@example.com>"]
license = "MIT"

# ^: 호환 버전 (>=1.2.3, <2.0.0)
# ~: 근사 버전 (>=1.2.3, <1.3.0)
[tool.poetry.dependencies]
python = "^3.9"
requests = "^2.25.1"
scipy = { version = "^1.7.3", optional = true }

[tool.poetry.group.dev.dependencies]
pytest = "^6.2.2"

[tool.poetry.scripts]
my-script = "my_awesome_project.main:app"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
```

= 6. 워크플로우 예시

1. 프로젝트 생성: `poetry new my-project`
2. 환경 설정: `poetry config virtualenvs.in-project true`
3. 의존성 추가: `poetry add pandas`, `poetry add --group dev pytest`
4. 개발/실행: `poetry run python main.py` 또는 `poetry shell`
5. 테스트: `poetry run pytest`
6. 배포 준비: `poetry.lock` 포함 커밋
7. 게시: `poetry publish --build`
