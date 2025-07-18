#import "./templates/conf.typ": *

#show: template.with(
  title: "uv 치트시트 (심화)",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 가상 환경 관리 (`uv venv`)

`uv`는 Python 프로젝트를 위한 가상 환경을 매우 빠르게 생성하고 관리할 수 있습니다.

- `uv venv [name]`: 현재 디렉토리에 `.venv`라는 이름의 가상 환경을 생성합니다.
  - `uv venv my-env`: `my-env`라는 이름으로 생성합니다.
- `uv venv --python <version>`: 특정 Python 버전을 사용하여 가상 환경을 생성합니다.
  - 시스템에 설치된 `python3.11`, `python3.10` 등을 자동으로 찾아 사용합니다.
- `uv venv --seed`: `pip`, `setuptools`, `wheel`을 가상 환경에 미리 설치합니다.
- *활성화*:
  - Linux/macOS: `source .venv/bin/activate`
  - Windows: `.venv\Scripts\activate`
- *비활성화*: `deactivate`

= 2. 패키지 설치 (`uv pip install`)

`uv`는 `pip`과 호환되는 인터페이스를 제공하며, 놀랍도록 빠른 속도로 패키지를 설치합니다.

- `uv pip install <package>`: 패키지를 설치합니다.
  - `uv pip install "requests>=2.25.1,<3.0"`: 버전 제약 조건을 명시하여 설치.
  - `uv pip install -r requirements.txt`: `requirements.txt` 파일로부터 패키지를 설치합니다.
  - `uv pip install -r requirements.txt -r requirements-dev.txt`: 여러 요구사항 파일을 동시에 설치합니다.
  - `uv pip install .`: 현재 디렉토리의 `pyproject.toml`을 기반으로 프로젝트를 설치합니다.
  - `uv pip install ".[dev]"`: `dev` extra를 포함하여 설치합니다.
- *주요 옵션*:
  - `--no-deps`: 종속성 없이 패키지만 설치합니다.
  - `--reinstall`: 패키지를 강제로 다시 설치합니다.
  - `--index-url <url>`: 기본 PyPI 대신 사용할 인덱스 URL을 지정합니다.

= 3. 패키지 제거 및 동기화

- `uv pip uninstall <package>`: 패키지를 제거합니다.
- `uv pip uninstall -r requirements.txt`: 파일에 명시된 모든 패키지를 제거합니다.
- `uv pip sync requirements.txt`: 현재 환경을 `requirements.txt` 파일과 정확히 일치시킵니다.
  - 파일에 명시된 패키지는 설치/업데이트됩니다.
  - 파일에 없는 패키지는 환경에서 *제거*됩니다.
  - 재현 가능한 환경을 유지하는 데 매우 유용합니다.

= 4. 종속성 해결 및 고정 (`uv pip compile`)

`uv`는 `pip-tools`의 `pip-compile` 기능을 내장하고 있어, 추상적인 요구사항으로부터 구체적인 버전이 고정된 `requirements.txt` 파일을 생성할 수 있습니다.

- `uv pip compile requirements.in -o requirements.txt`: `requirements.in` 파일의 종속성을 해결하여 `requirements.txt` 파일에 고정합니다.
- `uv pip compile pyproject.toml -o requirements.txt`: `pyproject.toml`의 `[project.dependencies]`를 기반으로 컴파일합니다.
- `uv pip compile pyproject.toml --extra dev -o requirements-dev.txt`: `dev` extra를 포함하여 컴파일합니다.
- *주요 옵션*:
  - `--upgrade`: 패키지를 최신 버전으로 업그레이드하면서 컴파일합니다.
  - `--resolution=highest|lowest`: 의존성 해결 전략을 선택합니다.
  - `--generate-hashes`: `requirements.txt`에 파일 해시를 포함하여 보안을 강화합니다.

#pagebreak()

= 5. 설치된 패키지 확인

- `uv pip list`: 설치된 패키지 목록을 `pip list`와 유사한 형식으로 표시합니다.
- `uv pip freeze`: 설치된 패키지를 `requirements.txt` 형식으로 출력합니다.
- `uv pip check`: 설치된 패키지 간의 종속성이 호환되는지 확인합니다.

= 6. 캐시 관리 (`uv cache`)

`uv`는 빠른 속도를 위해 공격적인 캐싱을 사용합니다.

- `uv cache clean`: `uv`의 모든 캐시를 지웁니다.
- `uv cache clean --name <package>`: 특정 패키지의 캐시만 지웁니다.
- `uv cache dir`: 캐시 디렉토리의 경로를 보여줍니다.

= 7. 왜 `uv`를 사용하는가?

- *압도적인 속도*: Rust와 최신 비동기 기술을 사용하여 `pip`, `pip-tools`, `venv`를 합친 것보다 10배에서 100배까지 빠릅니다. CI/CD 시간을 크게 단축시킬 수 있습니다.
- *통합된 경험*: 가상 환경 생성, 패키지 설치, 종속성 컴파일 등 파편화되어 있던 도구들을 `uv`라는 단일 실행 파일로 통합했습니다.
- *Drop-in Replacement*: `pip` 및 `requirements.txt`와 완벽하게 호환되므로 기존 프로젝트에 점진적으로 도입하기 쉽습니다.
- *효율적인 캐싱*: 글로벌 캐시를 통해 여러 프로젝트에서 동일한 패키지를 다시 다운로드할 필요가 없어 디스크 공간과 시간을 절약합니다.
- *활발한 개발*: Astral (Ruff 개발사)에서 적극적으로 개발하고 있어 기능 개선과 안정화가 빠르게 이루어지고 있습니다.

= `uv` 워크플로우 예시

1. *프로젝트 시작*:
   ```bash
   # pyproject.toml 또는 requirements.in에 필요한 패키지 명시
   # 예: fastapi, uvicorn
   ```
2. *가상 환경 생성 및 활성화*:
   ```bash
   uv venv
   source .venv/bin/activate
   ```
3. *종속성 컴파일 및 설치*:
   ```bash
   uv pip compile pyproject.toml -o requirements.txt
   uv pip sync requirements.txt
   ```
4. *개발 중 패키지 추가*:
   ```bash
   # pyproject.toml에 새 패키지 추가 (예: "httpx")
   uv pip compile pyproject.toml -o requirements.txt
   uv pip sync requirements.txt
   ```
5. *실행*:
   ```bash
   uvicorn main:app --reload
   ```
이 워크플로우는 항상 `requirements.txt`를 통해 재현 가능한 환경을 유지하도록 보장합니다.
