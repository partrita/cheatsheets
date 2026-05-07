#import "../templates/conf.typ": *

#show: template.with(
  title: "uv Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://docs.astral.sh/uv/",
)

= Overview

`uv` is an extremely fast Python package and project manager written in Rust by Astral (the makers of `ruff`). It unifies `pip`, `pip-tools`, `venv`, and parts of `poetry` / `pyenv` into a single blazing-fast binary.

= Project Initialization & Virtual Environments

`uv` manages projects using `pyproject.toml` and `uv.lock` — similar to Cargo for Rust.

- `uv init`: Initialize a new project in the current directory. Creates `pyproject.toml` and `uv.lock`.
  - `uv init my-project`: Create a new project directory named `my-project`.
  - `uv init --lib`: Initialize as a library project (src layout).
- `uv venv`: Create a virtual environment in `.venv/`.
  - `uv venv my-env`: Create with a custom name.
  - `uv venv --python 3.12`: Use a specific Python version.
  - `uv venv --seed`: Pre-install `pip`, `setuptools`, `wheel` in the env.
- Activate virtual environment:
  - Linux/macOS: `source .venv/bin/activate`
  - Windows: `.venv\Scripts\activate`
- Deactivate: `deactivate`

= Dependency Management

- `uv add <package>`: Add a dependency to `pyproject.toml` and install it immediately.
  - `uv add requests`: Add `requests`.
  - `uv add 'requests==2.31.0'`: Pin to a specific version.
  - `uv add ".[dev]"`: Install current project with `dev` extras.
  - `uv add -r requirements.txt`: Add all packages from a requirements file.
  - `uv add --group dev pytest`: Add to a dependency group (dev/test/docs).
- `uv remove <package>`: Remove a dependency from `pyproject.toml` and uninstall it.

= Environment Sync

`uv sync` is the core command — it makes the virtual environment exactly match `pyproject.toml` / `uv.lock`.

- `uv sync`: Sync environment to `uv.lock` (installs missing, removes extra packages).
- `uv sync --group dev`: Include the `dev` dependency group.
- `uv sync --all-groups`: Sync all dependency groups.
- `uv sync --frozen`: Sync without updating the lock file.

= Lock File Management

- `uv lock`: Resolve all direct and transitive dependencies and write `uv.lock`.
- `uv lock --upgrade-package <pkg>`: Upgrade only a specific package in the lock file.
- `uv lock --upgrade`: Upgrade all packages to the latest allowed versions.
- `uv lock --strict`: Error on dependency conflicts instead of warning.

= pip Interface (Drop-in Replacement)

`uv` is a near-drop-in replacement for `pip` and `pip-tools`:

- `uv pip install <package>`: Install packages (10–100x faster than pip).
- `uv pip uninstall <package>`: Uninstall packages.
- `uv pip list`: List installed packages.
- `uv pip freeze`: Output installed packages in `requirements.txt` format.
- `uv pip check`: Verify dependency compatibility.
- `uv pip compile requirements.in -o requirements.txt`: Resolve and pin dependencies (replaces `pip-compile`).
- `uv pip sync requirements.txt`: Sync environment to a requirements file exactly (replaces `pip-sync`).

= Running Commands & Scripts

- `uv run <command>`: Run a command inside the project environment (no activation needed).
  - `uv run python main.py`
  - `uv run pytest`
  - `uv run uvicorn main:app --reload`
- `uv run script.py`: Run a script. If the script has inline dependency metadata (PEP 723), `uv` auto-creates a temporary environment.

```python
# script.py with inline metadata (PEP 723)
# /// script
# requires-python = ">=3.11"
# dependencies = ["requests", "rich"]
# ///
import requests
from rich import print
print(requests.get("https://httpbin.org/get").json())
```
  Run with: `uv run script.py`

= Tool Management (pipx replacement)

- `uv tool install <package>`: Install a CLI tool in an isolated environment (replaces `pipx install`).
  - `uv tool install ruff`
  - `uv tool install black`
- `uv tool list`: List all installed tools.
- `uv tool uninstall <package>`: Remove an installed tool.
- `uv tool upgrade <package>`: Upgrade a tool.
- `uvx <tool> [args]`: Run a tool without permanently installing it (replaces `pipx run`).
  - `uvx ruff check .`
  - `uvx black --check .`

= Python Version Management (pyenv replacement)

- `uv python list`: List available and installed Python versions.
- `uv python install 3.12`: Download and install Python 3.12 locally.
- `uv python install 3.11 3.12`: Install multiple versions.
- `uv python pin 3.12`: Pin the Python version for the current project (writes `.python-version`).
- `uv python find 3.11`: Show the path to a Python 3.11 installation.

= Cache Management

`uv` uses a global cache for packages and wheels, dramatically reducing repeated download times.

- `uv cache clean`: Delete all cached data.
- `uv cache info`: Show cache size and location.
- `uv cache dir`: Print the cache directory path.
- `uv cache prune`: Remove old, unused entries only.

= pyproject.toml Reference

```toml
[build-system]
requires      = ["hatchling"]
build-backend = "hatchling.build"

[project]
name            = "my-package"
version         = "0.1.0"
description     = "A fast Python project"
readme          = "README.md"
requires-python = ">=3.10"
license         = { text = "MIT" }
authors         = [{ name = "Jane Smith", email = "jane@example.com" }]
keywords        = ["cli", "tool"]

dependencies = [
  "requests>=2.25",
  "rich>=13.0",
]

[project.optional-dependencies]
dev  = ["pytest>=7", "ruff", "mypy"]
docs = ["mkdocs", "mkdocs-material"]

[project.scripts]
my-cli = "my_package.cli:main"

[tool.uv]
dev-dependencies = ["pytest", "ruff"]
```

= Typical Workflow

```bash
# 1. Start a new project
uv init my-project && cd my-project

# 2. Add dependencies
uv add fastapi uvicorn[standard]
uv add --group dev pytest ruff

# 3. Sync environment
uv sync --group dev

# 4. Run the application
uv run uvicorn main:app --reload

# 5. Run tests
uv run pytest

# 6. Lint and format
uvx ruff check .
uvx ruff format .
```

= Pro Tips

- *Speed*: `uv` is 10–100x faster than `pip` due to Rust, parallelism, and aggressive caching.
- *No Python required*: `uv` is a standalone binary — ideal for CI/CD without pre-installing Python.
- *Global cache*: Packages are stored once and hard-linked into environments, saving disk space.
- *Lock file*: `uv.lock` is cross-platform and human-readable — commit it to version control.
- *`UV_PYTHON`*: Set this environment variable to override the Python used by `uv`.
